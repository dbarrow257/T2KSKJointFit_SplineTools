export GEANT_DIR=GeantReWeight

git clone git@github.com:/t2k-software/GeantReWeight ${GEANT_DIR}
cd ${GEANT_DIR}
git checkout f0777a8dbb1f652932ab45b54dcd17868c7e9307 #develop on 15th Oct 2021

make
source ./setup.sh
