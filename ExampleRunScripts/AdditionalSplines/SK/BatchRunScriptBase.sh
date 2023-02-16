#! /bin/bash

T2KUtilDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/AdditionalSplinesInstallScripts/"
XsecRespDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/AdditionalSplinesInstallScripts/XsecResponse_SK/"

MTupleDir="/opt/ppd/t2k/users/barrowd/T2KSoftware/SKReprod/SKMtuples/"
MTuplePrefix="sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_SampleSAMPLE_Channel"
MTupleSuffix=".root"

WtDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/AdditionalSplines/SK/Weights/"
WtPrefix="sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_SampleSAMPLE_Channel"
WtSuffix="_T2KReWeight_Weights.root"

SplineDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/AdditionalSplines/SK/Splines/"
SplinePrefix="sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_SampleSAMPLE_Channel"
SplineSuffix="_XsecResponse_Splines.root"

SampleNum=SAMPLE
ChannelNum=CHANNEL

cd ${T2KUtilDir}
source setup_SK.sh

MTupleFile=${MTupleDir}${MTuplePrefix}${ChannelNum}${MTupleSuffix}
WtFile=${WtDir}${WtPrefix}${ChannelNum}${WtSuffix}
SplineFile=${SplineDir}${SplinePrefix}${ChannelNum}${SplineSuffix}

cd ${T2KUtilDir}
./OAGenWeightsApps/build/Linux/bin/genWeights_T2KSKAtm_OA2020_AdlerAngle_MatrixElement_SIPN_CRPA -s ${MTupleFile} -o ${WtFile}
cd ${XsecRespDir}
bin/make_xsec_response_sk_2019_2d -m ${MTupleFile} -w ${WtFile} -o ${SplineFile} -s ${SampleNum}

