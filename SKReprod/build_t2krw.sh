export T2KRW_DIR=T2KReWeight

git clone git@github.com:/t2k-software/T2KReWeight ${T2KRW_DIR}
cd ${T2KRW_DIR}
git checkout c69997d68d430418a1363f7295d176583e2aba8c #SK_reprodofOA2020

mkdir build; cd build;
cmake ../ -DUSE_NEUT=ON -DUSE_NIWG=ON
make -j 8
make install

source ${T2KRW_DIR}/build/Linux/setup.sh
