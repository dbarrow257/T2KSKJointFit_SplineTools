export NIWG_DIR=NIWGReWeight

git clone git@github.com:/t2k-software/NIWGReWeight ${NIWG_DIR}
cd ${NIWG_DIR}
git checkout 517cf9d6328e6a0a3f0cfbd6bb1d7e9a8803ea91 #DBarrow_JointFit_AdditionalSplines

mkdir build; cd build; 
cmake ../ -DUSE_NEUT=1
make install

source ./Linux/setup.sh
