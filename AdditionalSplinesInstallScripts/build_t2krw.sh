export T2KRW_DIR=T2KReWeight

git clone git@github.com:/t2k-software/T2KReWeight ${T2KRW_DIR}
cd ${T2KRW_DIR}
git checkout 45817b6d414ba23edb647df8c69b9690cca9a9a1 #develop on 29th Oct 2021

mkdir build; cd build;
cmake ../ -DUSE_NEUT=ON -DUSE_NIWG=ON -DUSE_GEANT=ON
make -j 8
make install

source ./Linux/setup.sh
