export XSECRS_DIR=XsecResponse_SK

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout d91720b91faa2088ad566430101c1dd54914351e #DBarrow_JointFit_AdditionalSplines_Atm

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse_SK/lib:${LD_LIBRARY_PATH}
