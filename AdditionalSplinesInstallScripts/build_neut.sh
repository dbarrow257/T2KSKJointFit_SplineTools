export NEUT_DIR=neut

git clone git@github.com:/neut-devel/neut ${NEUT_DIR}
cd  ${NEUT_DIR}
git checkout 836dca507dd01f55396aee390246cff6701fd520 #main on 19th Oct 2021

mkdir build; cd build;
../src/configure --prefix=$(readlink -f Linux)
make -j 8
make install

source ./Linux/setup.sh
