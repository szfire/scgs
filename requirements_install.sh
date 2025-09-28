#!/bin/bash
#根据
#pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install Cmake

pip install -r requirements.txt
pip install imageio-ffmpeg==0.6.0
pip install dearpygui==2.0.0
pip install 

cd submodules/diff-gaussian-rasterization
pip install -e .

cd ../simple-knn
pip install -e .
cd ../..

