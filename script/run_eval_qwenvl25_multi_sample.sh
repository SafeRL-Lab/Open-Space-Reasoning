#!/bin/bash

ports=(12346 12347 12348)
# "OpenGVLab/InternVL2_5-38B"
models=(
    # "Qwen/Qwen2.5-VL-3B-Instruct"
    # "Qwen/Qwen2.5-VL-7B-Instruct"
    "Qwen/Qwen2.5-VL-32B-Instruct"  
)

tasks=(
    # "land_space_short_easy_sample"
    # "land_space_short_medium_sample"
    # "land_space_short_hard_sample"
    # "land_space_medium_easy_sample"
    # "land_space_medium_medium_sample"
    # "land_space_medium_hard_sample"
    # "land_space_long_easy_sample"
    # "land_space_long_medium_sample"
    # "land_space_long_hard_sample"    
    # "air_space_short_easy_sample"
    # "air_space_short_medium_sample"
    # "air_space_short_hard_sample"
    # "air_space_medium_easy_sample"
    # "air_space_medium_medium_sample"
    # "air_space_medium_hard_sample"
    # "air_space_long_easy_sample"
    # "air_space_long_medium_sample"
    # "air_space_long_hard_sample"
    # "water_space_short_easy_sample"
    # "water_space_short_medium_sample"
    # "water_space_short_hard_sample"
    # "water_space_short_easy_sample"
    # "water_space_short_medium_sample"
    # "water_space_short_hard_sample"
    # "water_space_medium_easy_sample"
    # "water_space_medium_medium_sample"
    "water_space_medium_hard_sample"
)

for task in "${tasks[@]}"; do
    for i in "${!models[@]}"; do
        accelerate launch --num_processes 8 --main_process_port ${ports[$((i % ${#ports[@]}))]} -m lmms_eval \
            --model qwen2_5_vl \
            --model_args pretrained=${models[$i]},max_pixels=12845056,use_flash_attention_2=False,interleave_visuals=True \
            --tasks $task \
            --batch_size 1 \
            --log_samples \
            --output_path /home/jovyan/workspace/Open-Space-Reasoning/outputs_sample/$task/
    done
done
