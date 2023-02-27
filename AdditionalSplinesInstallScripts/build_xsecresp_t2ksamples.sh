export XSECRS_DIR=XsecResponse_T2K

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout 779a6929794692fe03e093ec5755674621a88450 #DBarrow_JointFit_AdditionalSplines_Beam

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse/lib:${LD_LIBRARY_PATH}
