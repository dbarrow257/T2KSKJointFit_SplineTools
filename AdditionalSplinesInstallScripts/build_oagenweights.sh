export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout ebeded1d70069904100954b02bb7738ab5b97462 #DBarrow_JointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ./Linux/setup.sh
