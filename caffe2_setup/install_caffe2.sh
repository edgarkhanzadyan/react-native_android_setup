echo "[STEP 1] install brew dependencies"
brew install \
automake \
cmake \
git \
glog

echo "[STEP 2] install conda with brew"
brew cask install anaconda

echo "[STEP 3] setup PATH to PATH=/usr/local/anaconda3/bin:"$PATH""
export PATH=/usr/local/anaconda3/bin:"$PATH"
echo "# Setup PATH for anaconda python 2.7" >> $HOME/.bash_profile
echo "export PATH=/usr/local/anaconda3/bin:\$PATH" >> $HOME/.bash_profile

echo "[STEP 4] change python 3 to python 2 in conda"
conda install python=2

# At this point I already had python pointing to conda's python2 
# So when I run in terminal "python" it logs "Python 2.7.14 |Anaconda custom (x86_64)"
# or "which python" logs me back /usr/local/anaconda3/bin/python
echo "[STEP 5] install conda dependencies"
conda install -y --channel https://conda.anaconda.org/conda-forge  \
future \
gflags \
glog  \
numpy \
protobuf=3.1.0 \
six

echo "[STEP 6] Uninstall protobuf in brew (just in case)"
brew uninstall protobuf

echo "[STEP 7] Cloning caffe2 repo"
git clone --recursive https://github.com/caffe2/caffe2.git && cd caffe2

echo "[STEP 8] Build caffe2"
mkdir build && cd build
cmake -DUSE_CUDA=OFF ..

j_arg=$( echo $1 | cut -c-2 )

if [ $j_arg == "-j" ]; then
        cores=$( echo $1 | cut -c3-3 )
        echo "Running make with $cores cores"
        sudo make install $j_arg$cores
else
        echo "Wrong input argument"
        sudo make install
fi

echo "[STEP 9] Setup PYTHONPATH to /usr/local"
export PYTHONPATH=/usr/local

# but i don't know if this actually helped me
echo "[STEP 10] Run install_name_tool which was suggested in caffe2 docs"
sudo install_name_tool -change libpython2.7.dylib ~/anaconda/lib/libpython2.7.dylib /usr/local/caffe2/python/caffe2_pybind11_state.so

echo "[STEP 11] !CHECK IN BUILD!"
python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

echo "[STEP 12] !CHECK OUTSIDE OF BUILD!"
cd ../..
python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"
