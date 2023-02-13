export XSECRS_DIR=XsecResponse_SK

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout 2e0d4f78 #DBarrow_JointFit_SKReprod_Atm

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse_SK/lib:${LD_LIBRARY_PATH}
