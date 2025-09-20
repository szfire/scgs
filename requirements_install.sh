conda create -n scgs python=3.10
conda activate scgs

pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install setuptools==69.5.1
pip install numpy==1.23.5
pip install Cmake

pip install -r requirements.txt

cd submodules/diff-gaussian-rasterization
pip install -e .

cd ../simple-knn
pip install -e .
cd ../..