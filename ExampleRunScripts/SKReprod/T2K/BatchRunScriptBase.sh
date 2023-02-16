#! /bin/bash

T2KUtilDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/SKReprodInstallScripts/"
XsecRespDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/SKReprodInstallScripts/XsecResponse_T2K/"

MTupleDir="/opt/ppd/t2k/users/barrowd/T2KSoftware/SKReprod/T2KMtuples/"
MTuplePrefix="t2ksk19b.fqv4r0."
MTupleSuffix=".root"

WtDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/SKReprod/T2K/Weights/"
WtPrefix="t2ksk19b.fqv4r0."
WtSuffix="_T2KReWeight_Weights.root"

SplineDir="/opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/SKReprod/T2K/Splines/"
SplinePrefix="t2ksk19b.fqv4r0."
SplineSuffix="_XsecResponse_Splines.root"

SampleNum=SAMPLE
ChannelNum=CHANNEL

declare -a SampleSelec=("nue" "numu" "cc1pi" "nue" "numu")

declare -a SampleSuffix=("nueselec" "numuselec" "cc1piselec" "nueselec" "numuselec")
declare -a SamplePrefix=("fhc." "fhc." "fhc." "rhc." "rhc.")
declare -a ChannelName=("nuebar_x_nuebar_" "nue_x_nue_" "numubar_x_nuebar_" "numu_x_nue_" "numubar_x_numubar_" "numu_x_numu_")

cd ${T2KUtilDir}
source ${T2KUtilDir}/setup_T2K.sh

MTupleName=${MTuplePrefix}${SamplePrefix[SampleNum]}${ChannelName[ChannelNum]}${SampleSuffix[SampleNum]}

MTupleFile=${MTupleDir}${MTupleName}${MTupleSuffix}
WtFile=${WtDir}${MTupleName}${WtSuffix}
SplineFile1D=${SplineDir}${MTupleName}"_1D"${SplineSuffix}
SplineFile2D=${SplineDir}${MTupleName}"_2D"${SplineSuffix}

cd ${T2KUtilDir}
./OAGenWeightsApps/build/Linux/bin/genWeightsSKsplines_newfunctions_2021Weights -s ${MTupleFile} -o ${WtFile}
cd ${XsecRespDir}
bin/make_xsec_response_sk_2021 -m ${MTupleFile} -w ${WtFile} -o ${SplineFile1D} -selec ${SampleSelec[SampleNum]}
bin/make_xsec_response_2021_2d -m ${MTupleFile} -w ${WtFile} -o ${SplineFile2D} -selec ${SampleSelec[SampleNum]} -f true

