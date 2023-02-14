export XSECRS_DIR=XsecResponse_T2K

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout 383ef862 #DBarrow_JointFit_SKReprod_Beam

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse/lib:${LD_LIBRARY_PATH}
