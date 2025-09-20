conda create -n scgs python=3.10
conda activate scgs

pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install Cmake

pip install -r requirements.txt

cd submodules/diff-gaussian-rasterization
pip install -e .

cd ../simple-knn
pip install -e .
cd ../..

CUDA_VISIBLE_DEVICES=0 python render.py --source_path D:/work/project/SCGS/scgs/data/jumpingjacks --model_path outputs/jumpingjacks --deform_type node --node_num 512 --hyper_dim 8 --is_blender --eval --gt_alpha_mask_as_scene_mask --local_frame --resolution 2 --W 800 --H 800
CUDA_VISIBLE_DEVICES=0 python render.py --source_path /data/szz/scgs/data/jumpingjacks --model_path outputs/jumpingjacks --deform_type node --node_num 512 --hyper_dim 8 --is_blender --eval --gt_alpha_mask_as_scene_mask --local_frame --resolution 2 --W 800 --H 800