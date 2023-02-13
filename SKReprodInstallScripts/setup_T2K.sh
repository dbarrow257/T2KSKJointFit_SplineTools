export T2KUtils=$PWD

#Why oh god does NEUT have to use CERNLIB which in turn uses imake and makedepend????
export PATH=$PATH:/opt/ppd/t2k/users/barrowd/Software/imake/imake-build/bin
export PATH=$PATH:/opt/ppd/t2k/users/barrowd/Software/makedepend/makedepend-build/bin

#CERNLIB
export PATH=$PATH:/opt/ppd/t2k/users/barrowd/T2KSoftware/CERNLIB/2005/bin
export CERN=/opt/ppd/t2k/users/barrowd/T2KSoftware/CERNLIB
export CERN_ROOT=/opt/ppd/t2k/users/barrowd/T2KSoftware/CERNLIB/2005
export CERN_LEVEL=2005

#ROOT
source /opt/ppd/t2k/users/barrowd/Software/Root/root_v5_34_38-Build/bin/thisroot.sh

#NEUT
export NEUT_ROOT=${T2KUtils}/neut/
source ${NEUT_ROOT}/build/Linux/setup.sh

#NIWGRW
export NIWG=${T2KUtils}/NIWGReWeight/
export LD_LIBRARY_PATH=${NIWG}:${LD_LIBRARY_PATH}
export NIWGREWEIGHT_INPUTS=${NIWG}/inputs
source ${T2KUtils}/NIWGReWeight/build/Linux/setup.sh

#T2KReWeight
export T2KREWEIGHT=${T2KUtils}/T2KReWeight/
export LD_LIBRARY_PATH=${T2KREWEIGHT}/lib:${LD_LIBRARY_PATH}
source ${T2KUtils}/T2KReWeight/build/Linux/setup.sh

#OAGenWeightsApp
source ${T2KUtils}/OAGenWeightsApps/build/Linux/setup.sh

#XSecResponse
export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse_T2K/lib:${LD_LIBRARY_PATH}
