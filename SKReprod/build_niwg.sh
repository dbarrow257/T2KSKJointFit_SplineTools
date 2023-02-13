export NIWG_DIR=NIWGReWeight

git clone git@github.com:/t2k-software/NIWGReWeight ${NIWG_DIR}
cd ${NIWG_DIR}
git checkout daa138eeffc3fe8dbe2e3a8995d77144b5347744 #SK_ReprodOA2020

mkdir build; cd build; 
cmake ../ -DUSE_NEUT=1
make install

source ${NIWG_DIR}/build/Linux/setup.sh
