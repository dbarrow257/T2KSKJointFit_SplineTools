export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout dd5b815a06dfd7faa7c3212d5bdafa038e60a759 #DBarrow_JointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ./Linux/setup.sh
