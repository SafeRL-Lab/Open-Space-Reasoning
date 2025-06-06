export HF_HOME="~/.cache/huggingface"

# pip install git+https://github.com/LLaVA-VL/LLaVA-NeXT.git
# pip install git+https://github.com/EvolvingLMMs-Lab/lmms-eval.git

# lmms-lab/llava-onevision-qwen2-0.5b-ov
# lmms-lab/llava-onevision-qwen2-7b-ov

accelerate launch --num_processes=8 --main_process_port 12399 -m lmms_eval \
    --model=llava_onevision \
    --model_args=pretrained=lmms-lab/llava-onevision-qwen2-7b-ov,conv_template=qwen_1_5,device_map=auto,model_name=llava_qwen \
    --tasks=land_space_hard \
    --batch_size=1 \
    --output_path /home/jovyan/workspace/Open-Space-Reasoning/outputs/water_space_short_hard/