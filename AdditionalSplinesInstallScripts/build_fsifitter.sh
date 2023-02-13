export FSI_DIR=FSIFitter

git clone git@github.com:/t2k-software/FSIFitter ${FSI_DIR}
cd ${FSI_DIR}
git checkout 21fce711ae908aa6e42dec945fdcc13a83a4b4a6 #debug/Makefile_c11

./build_octave.sh 
source ./setup_octave.sh 
source ./setup.sh 
make
