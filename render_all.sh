!/bin/bash
GPU_ID=$1  # 修复等号两边空格问题

# 定义一个函数来运行训练和渲染流程
run_pipeline() {

    # 运行渲染脚本
    CUDA_VISIBLE_DEVICES="$1" python render.py \
    --source_path /data/szz/SCGS/scgs/data/"$2" \
    --model_path outputs/"$2" \
    --deform_type node \
    --node_num 512 \
    --hyper_dim 8 \
    --is_blender \
    --eval \
    --gt_alpha_mask_as_scene_mask \
    --local_frame \
    --resolution 2 \
    --W 800 \
    --H 800 > outputs/"$2"/render.log 2>&1
}

# 定义NeRF-DS数据集数组
#NeRF_DS=("basin_novel_view" "cup_novel_view" "plate_novel_view" "press_novel_view" "sieve_novel_view" "as_novel_view" "bell_novel_view")

#Neural3D_DA=("flame_salmon_1" "coffee_martini" "cut_roasted_beef" "sear_steak" "flame_steak" "cook_spinach")

#Neural3D_DA=("Painter" "Birthday" "Train" "Fatma" "Hands") # "Painter" "Birthday" "Train" "Fatma" "Hands")  "Fabien"  "Theater" #( "Fatma" "Hands") #("coffee_martini" "flame_steak") # "Birthday" "Fabien"   "Fabien" "Theater" "Train"  "Theater"
#Neural3D_DA=( "Birthday")

D_NeRF=("bouncingballs" "hellwarrior" "hook" "jumpingjacks" "lego" "mutant" "standup" "trex")
# valloader="technicolorvalid"
# 循环遍历数组并调用run_pipeline函数
for data_name in "${D_NeRF[@]}"; 
do
    echo -e "\033[32m###################################################\033[0m"
    echo "Dataset: D-NeRF/${data_name}"
    # data_name_path="Technicolor/${data_name}"
    run_pipeline "$GPU_ID" "$data_name"
done
