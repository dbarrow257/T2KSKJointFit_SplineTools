export T2KUtils=$PWD
source setup_Deps.sh

#NEUT
export NEUT_ROOT=${T2KUtils}/neut/
source ${NEUT_ROOT}/build/Linux/setup.sh

#NIWGRW
export NIWG=${T2KUtils}/NIWGReWeight/
export LD_LIBRARY_PATH=${NIWG}:${LD_LIBRARY_PATH}
export NIWGREWEIGHT_INPUTS=${NIWG}/inputs
source ${T2KUtils}/NIWGReWeight/build/Linux/setup.sh

#FSIFitter
source ${T2KUtils}/FSIFitter/setup_octave.sh
source ${T2KUtils}/FSIFitter/setup.sh

#GEANTReWeight
source ${T2KUtils}/GeantReWeight/setup.sh

#T2KReWeight
export T2KREWEIGHT=${T2KUtils}/T2KReWeight/
export LD_LIBRARY_PATH=${T2KREWEIGHT}/lib:${LD_LIBRARY_PATH}
source ${T2KUtils}/T2KReWeight/build/Linux/setup.sh

#OAGenWeightsApp
source ${T2KUtils}/OAGenWeightsApps/build/Linux/setup.sh

#XSecResponse
export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse_SK/lib:${LD_LIBRARY_PATH}
