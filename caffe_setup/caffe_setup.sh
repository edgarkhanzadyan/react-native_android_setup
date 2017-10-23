cd $HOME/Documents
echo "Install brew dependencies"
brew install -vd snappy leveldb gflags glog szip lmdb
brew tap homebrew/science
brew install hdf5 opencv
echo "Change everything same to this if you're using conda python"
echo "-DPYTHON_LIBRARY=#{py_prefix}/lib/libpython2.7.dylib"
echo "-DPYTHON_INCLUDE_DIR=#{py_prefix}/include/python2.7"
brew edit opencv
echo "Continue installing brew deps"
brew install -vd boost boost-python
echo "Clone the repo"
git clone https://github.com/BVLC/caffe && cd caffe
echo "Build the project"
mkdir build
cd build
cmake ..
make all
make install
make runtest