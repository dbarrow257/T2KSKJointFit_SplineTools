export XSECRS_DIR=XsecResponse_SK

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout 0ebf7f537c67f119bc5e695f0140ed5b6f018561 #DBarrow_JointFit_AdditionalSplines_Atm

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse_SK/lib:${LD_LIBRARY_PATH}
