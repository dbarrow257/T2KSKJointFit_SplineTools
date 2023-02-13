export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout 37b53493b29d02988d53b54d29817f0e53224046 #DBarrow_JointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ./Linux/setup.sh
