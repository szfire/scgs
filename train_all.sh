#!/bin/bash
GPU_ID=$1  # 修复等号两边空格问题

# 定义一个函数来运行训练和渲染流程
run_pipeline() {

    # 运行训练脚本
    CUDA_VISIBLE_DEVICES="$GPU_ID" python train_gui_51.py \
    --source_path data_spacetime/"$data_name_path"/colmap_0 \
    --model_path logs/technicolorvalid/"$data_name"_8 \
    --deform_type node \
    --node_num 1024 \
    --hyper_dim 8 \
    --is_blender \
    --eval \
    --gt_alpha_mask_as_scene_mask \
    --local_frame \
    --resolution 2 \
    --W 800 \
    --H 800 \
    --config arguments/"$data_name_path".py
    



    # 运行渲染脚本
    CUDA_VISIBLE_DEVICES="$GPU_ID" python render5_b.py \
    --source_path data_spacetime/"$data_name_path"/colmap_0 \
    --model_path logs/technicolorvalid/"$data_name"_8 \
    --deform_type node \
    --node_num 1024 \
    --hyper_dim 8 \
    --is_blender \
    --eval \
    --gt_alpha_mask_as_scene_mask \
    --local_frame \
    --resolution 2 \
    --W 800 \
    --H 800 \
    --dataset_type $valloader
}

# 定义NeRF-DS数据集数组
#NeRF_DS=("basin_novel_view" "cup_novel_view" "plate_novel_view" "press_novel_view" "sieve_novel_view" "as_novel_view" "bell_novel_view")

#Neural3D_DA=("flame_salmon_1" "coffee_martini" "cut_roasted_beef" "sear_steak" "flame_steak" "cook_spinach")

#Neural3D_DA=("Painter" "Birthday" "Train" "Fatma" "Hands") # "Painter" "Birthday" "Train" "Fatma" "Hands")  "Fabien"  "Theater" #( "Fatma" "Hands") #("coffee_martini" "flame_steak") # "Birthday" "Fabien"   "Fabien" "Theater" "Train"  "Theater"
Neural3D_DA=( "Birthday")
valloader="technicolorvalid"
# 循环遍历数组并调用run_pipeline函数
for data_name in "${Neural3D_DA[@]}"; 
do
    echo "Dataset: Technicolor/${data_name}"
    data_name_path="Technicolor/${data_name}"
    run_pipeline "$GPU_ID" "$data_name_path" "$data_name" "$valloader"
done
