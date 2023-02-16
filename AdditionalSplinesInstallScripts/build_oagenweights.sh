export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout 9372c958d21f4c6c28b41c7eee3f3c4bb605565d #DBarrow_JointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ./Linux/setup.sh
