export NIWG_DIR=NIWGReWeight

git clone git@github.com:/t2k-software/NIWGReWeight ${NIWG_DIR}
cd ${NIWG_DIR}
git checkout fafbb9fcb4535c3ac46cfe2f7d63df80cf2beab5 #DBarrow_JointFit_AdditionalSplines

mkdir build; cd build; 
cmake ../ -DUSE_NEUT=1
make install

source ./Linux/setup.sh
