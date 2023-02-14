#! /bin/bash

T2KUtilDir="/opt/ppd/t2k/users/barrowd/T2KSoftware/SKReprod/"
XsecRespDir="/opt/ppd/t2k/users/barrowd/T2KSoftware/SKReprod/XsecResponse_SK/"

MTupleDir="/opt/ppd/t2k/users/barrowd/T2KSoftware/SKReprod/SKMtuples/"
MTuplePrefix="sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_SampleSAMPLE_Channel"
MTupleSuffix=".root"

WtDir="/opt/ppd/scratch-2022/barrow/RemadeSplines/SKReprod/T2KReWeightOutput/SK/"
WtPrefix="sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_SampleSAMPLE_Channel"
WtSuffix="_T2KReWeight_Weights.root"

SplineDir="/opt/ppd/scratch-2022/barrow/RemadeSplines/SKReprod/XsecResponseOutput/SK/"
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
./OAGenWeightsApps/build/Linux/bin/genWeightsSKsplines_newfunctions_2021Weights -s ${MTupleFile} -o ${WtFile}
cd ${XsecRespDir}
bin/make_xsec_response_sk_2019_2d -m ${MTupleFile} -w ${WtFile} -o ${SplineFile} -s ${SampleNum}

