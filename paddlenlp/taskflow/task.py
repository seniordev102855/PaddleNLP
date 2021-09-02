# coding:utf-8
# Copyright (c) 2021  PaddlePaddle Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import abc
from abc import abstractmethod
import paddle
from ..utils.env import PPNLP_HOME
from ..utils.log import logger
from .utils import static_mode_guard, dygraph_mode_guard


class Task(metaclass=abc.ABCMeta):
    """
    The meta classs of task in TaskFlow. The meta class has the five abstract function,
        the subclass need to inherit from the meta class.
    Args:
        task(string): The name of task.
        model(string): The model name in the task.
        kwargs (dict, optional): Additional keyword arguments passed along to the specific task. 
    """

    def __init__(self, model, task, **kwargs):
        self.model = model
        self.task = task
        self.kwargs = kwargs
        self._usage = ""
        # The dygraph model instantce 
        self._model = None
        # The static model instantce
        self._input_spec = None
        self._static_program = None
        self._static_feed_names = None
        self._static_fetch_targets = None
        self._task_path = os.path.join(PPNLP_HOME, "taskflow", self.task,
                                       self.model)

    @abstractmethod
    def _construct_model(self, model):
        """
       Construct the inference model for the predictor.
       """

    @abstractmethod
    def _construct_tokenizer(self, model):
        """
        Construct the tokenizer for the predictor.
        """

    @abstractmethod
    def _preprocess(self, inputs, padding=True, add_special_tokens=True):
        """
        Transform the raw text to the model inputs, two steps involved:
           1) Transform the raw text to token ids.
           2) Generate the other model inputs from the raw text and token ids.
        """

    @abstractmethod
    def _run_model(self, inputs):
        """
        Run the task model from the outputs of the `_tokenize` function. 
        """

    @abstractmethod
    def _postprocess(self, inputs):
        """
        The model output is allways the logits and pros, this function will convert the model output to raw text.
        """

    @abstractmethod
    def _construct_input_spec(self):
        """
       Construct the input spec for the convert dygraph model to static model.
       """

    def _prepare_static_mode(self):
        """
        Construct the input data and executor in the PaddlePaddele static mode. 
        """
        place = paddle.get_device()
        self._exe = paddle.static.Executor(place)

    def _get_inference_model(self):
        """
        Return the inference program, inputs and outputs in static mode. 
        """
        inference_model_path = os.path.join(self._task_path, "static",
                                            "inference")
        if not os.path.exists(inference_model_path + ".pdiparams"):
            with dygraph_mode_guard():
                self._construct_model(self.model)
                self._construct_input_spec()
                self._convert_dygraph_to_static()
        with static_mode_guard():
            self._prepare_static_mode()
            self._static_program, self._static_feed_names, self._static_fetch_targets \
                 = paddle.static.load_inference_model(inference_model_path, self._exe)

    def _convert_dygraph_to_static(self):
        """
        Convert the dygraph model to static model.
        """
        assert self._model is not None, 'The dygraph model must be created before converting the dygraph model to static model.'
        assert self._input_spec is not None, 'The input spec must be created before converting the dygraph model to static model.'
        logger.info("Converting to the inference model cost a little time.")
        static_model = paddle.jit.to_static(
            self._model, input_spec=self._input_spec)
        save_path = os.path.join(self._task_path, "static", "inference")
        paddle.jit.save(static_model, save_path)
        logger.info("The inference model save in the path:{}".format(save_path))

    def help(self):
        """
        Return the usage message of the current task.
        """
        print("Examples:\n{}".format(self._usage))

    def __call__(self, *args):
        inputs = self._preprocess(*args)
        outputs = self._run_model(inputs)
        results = self._postprocess(outputs)
        return results
