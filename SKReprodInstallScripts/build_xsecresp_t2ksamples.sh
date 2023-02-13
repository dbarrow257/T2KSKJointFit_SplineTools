export XSECRS_DIR=XsecResponse_T2K

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout 9b9812e #SK_reprodofOA2020

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse/lib:${LD_LIBRARY_PATH}
