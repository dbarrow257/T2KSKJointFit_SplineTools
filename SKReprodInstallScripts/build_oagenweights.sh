export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout cd00a6c562844e2f926947c0bfc037a15d26433f #SKReprodOA2020_AtmosphericJointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ./Linux/setup.sh
