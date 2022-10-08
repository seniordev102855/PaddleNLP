# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
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

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/cail_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/cail_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/cail_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/cail_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/cail_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/cmrc_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/cmrc_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/cmrc_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/cmrc_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/cmrc_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/drcd_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/drcd_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/drcd_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/drcd_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/drcd_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/dureader_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/dureader_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/dureader_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/dureader_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/dureader_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/medicine_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/medicine_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/medicine_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/medicine_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/medicine_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/military_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/military_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/military_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/military_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/military_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/squad_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/squad_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/squad_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/squad_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/squad_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu

unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/webqa_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/webqa_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/webqa_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/webqa_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/webqa_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu


unset CUDA_VISIBLE_DEVICES
python -m paddle.distributed.launch --gpus "6,7" --log_dir ./unimo/finetune/nine_dataset/yiqing_data/log run_gen.py \
    --dataset_name=dureader_qg \
    --train_file=/root/project/data/qa-dataset/qa-cleran-qg-for-train/yiqing_data.json \
    --predict_file=/root/project/data/qa-dataset/qa-cleran-qg-for-test/yiqing_data.json \
    --model_name_or_path='unimo-text-1.0' \
    --save_dir=./unimo/finetune/nine_dataset/yiqing_data/checkpoints \
    --output_path=./unimo/finetune/nine_dataset/yiqing_data/predict.txt \
    --logging_steps=100 \
    --save_steps=400 \
    --epochs=20 \
    --batch_size=16 \
    --learning_rate=5e-5 \
    --warmup_propotion=0.02 \
    --weight_decay=0.01 \
    --max_seq_len=512 \
    --max_target_len=50 \
    --do_train \
    --do_predict \
    --max_dec_len=50 \
    --min_dec_len=3 \
    --num_return_sequences=1 \
    --adversarial_training=None \
    --template=1 \
    --device=gpu