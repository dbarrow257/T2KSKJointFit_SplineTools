*** General Information

This set of tools should (hopefully) allow the user to build the systematics splines for the beam and atmospheric samples for the first iteration of the joint T2K+SK MaCh3 analysis. To build the splines, first a set of weight files for the given MC is produced for several known parameter variations, which is then used to build TSpline3 objects from.

There are several complications within this analysis. Firstly, this analysis is built from the OA2020 beam analysis. Therefore, the systemaics used within that analysis should be replicated. However, there are several systematics within the joint analysis which have been technically implemented within the T2KRW stack since the 2020 beam analysis. 

Therefore, to create the systematic splines to these requirements, there exist two implementations of the T2KRW stack. Firstly, the 'SKReprod' tools which build the OA2020-identical splines, and secondly, the 'AdditionalSplines' tools which build all the rest of the splines. Both sets of these tools contain the full T2KRW stack: neut, NIWGRW, T2KRW, OAGenWeightsApps, XsecResponse. As the 'AdditionalSplines' tools require building SI splines, that version of the stack also contains FSIFitter and GEANTRW.

Once the splines from each stack has been produced, they need to be added together. A 'hadd' tool is supplied to do this task. As an added complication, the atmospheric MC has high and low energy splines from the same systematic. As a technical limitation to ensure they are separated in the MaCh3 framework, the high energy version of the splines need to be renamed to include a '_HighEnergy' suffix.

In yet another complication, the 2020 beam analysis requires that the CC1pipm and CC1pi0 modes are handled by the controlled by the same spline. However, the additional atmospheric splines require that the CC1pipm and CC1pi0 be split. As a technical limitation, the same MaCh3 modes have to be used in the covarianceXsec object. To get around this, the splines for the beam samples (created by XsecResponse) are created using both CC1pi0 and CC1pipm mode events, and then 'copied' to have a seperate set of splines for the two modes. This ensures the response for CC1pipm/CC1pi0 events are the same for the beam samples.

As a final complication, the different binning (Erec and Theta for beam, Momentum and Direction for atmospheric) means that there are two XsecResponse tools. With enough effort, these could be unified. However, that seems like effort... For now, two sets of the XsecResponse tools will be built for each version of the software stack.

This guide assumes that you have access to the atmospheric and beam MC, mtupled using the 'iclass' and oscillation channel mode combinations. For atmospheric samples, 'iclass' is equivalent to ATMPDEventType. I will make a guide for creating those mtuples later...

*** Dependancies

This guide will assume the following dependancies have been installed. The provided versions have been tested, although it's likely other versions will work. However, other versions should be tested and validated.

- gcc [4.8.5]
- cmake [3.17.5]
- ROOT [5.34.38]
- imake [1.0.7]
- makedepend [1.0.5]
- CERNLib [2005] -> Installation instructions here: https://t2k.org/asg/xsec/niwgdocs/neut/install_neut

In both software stacks, a 'setup_Deps.sh' is included. It is assumed the user can correctly modify this script to setup the correct environment variables to load these dependancies.

*** SKReprod Stack Installation

Starting with the SKReprod software stack, there is a directory SKReprodInstallScripts which has all the scripts to build the correct versions of the code to replicate the 2020 beam analysis. There also exists 'setup_*.sh' (* = SK, T2K) which needs to be sourced after installation to ensure the correct environment variables are defined.

In general, the way in which the installation will proceed is that a single tool is built, the 'setup_*.sh' script is re-sourced and the next tool is built, etc.

The installation steps are equivalent for beam and atmospheric samples, up until the XsecResponse tools are built. As mentioned, there are two versions of the XsecResponse tool which need to be installed. The setup steps should be followed using the 'setup_SK.sh' script as a basis.

The following steps should be taken to install the SKReprod stack:

1. Comment out all the NEUT/NIWGRW/T2KRW/OAGenWeightsApps/XsecResp lines from 'setup_SK.sh'. Then source setup_SK.sh: 'source setup_SK.sh'
2. 'sh build_neut.sh' installs and builds neut. If there are any 'autolib' looking errors, follow the instructions: https://github.com/neut-devel/neut . Once built, uncomment the neut lines in 'setup_SK.sh' and resource setup_SK.sh
3. 'sh build_niwg.sh' installs and builds NIWGRW. Once built, uncomment the NIWGRW lines in 'setup_SK.sh' and resource setup_SK.sh
4. 'sh build_t2krw.sh' installs and builds T2KRW. Once built, uncomment the T2KRW lines in 'setup_SK.sh' and resource setup_SK.s
5. 'sh build_oagenweightsapps.sh' installs and builds OAGenWeightsApps. Once built, uncomment the OAGenWeightsApps lines in 'setup_SK.sh' and resource setup_SK.sh

This is the point at which the beam and atmospheric tools diverge, requiring a separate installation of XsecResponse. 

** When building, or sourcing, the different XsecResp tools, a clean working environment is required. **

6a. 'sh build_xsecresp_sksamples.sh' installs the atmospheric version of XsecResponse. Once built, uncomment the XsecResponse lines in 'setup_SK.sh' and resource setup_SK.sh
6b. 'sh build_xsecresp_t2ksamples.sh' installs the beam version of XsecResponse. Once built, uncomment the XsecResponse lines in 'setup_T2K.sh' and resource setup_T2K.sh

At this point all the tools should be correctly installed, linked and built. 

*** AdditionalSplines Stack Installation

Firstly, read the instructions for 'SKReprod'. There are important details which need to be followed as the installation is very similar.

Starting with the AdditionalSplinesInstallScripts directory, proceed with the following steps:

1. Comment out all the NEUT/NIWGRW/FSIFitter/GeantRW/T2KRW/OAGenWeightsApps/XsecResp lines from 'setup_SK.sh'. Then source setup_SK.sh: 'source setup_SK.sh'
2. 'sh build_neut.sh' installs and builds neut. If there are any 'autolib' looking errors, follow the instructions: https://github.com/neut-devel/neut . Once built, uncomment the neut lines in 'setup_SK.sh' and resource setup_SK.sh
3. 'sh build_niwg.sh' installs and builds NIWGRW. Once built, uncomment the NIWGRW lines in 'setup_SK.sh' and resource setup_SK.sh
4. 'sh build_fsifitter.sh' installs and builds FSIFitter. This will take a while as it has to install a custom install of Octave. Once built, uncomment the FSIFitter lines in 'setup_SK.sh' and resource setup_SK.sh
5. 'sh build_geantrw.sh' installs and builds GEANTRW. Once built, uncomment the GEANTRW lines in 'setup_SK.sh' and resource setup_SK.sh
6. 'sh build_t2krw.sh' installs and builds T2KRW. Once built, uncomment the T2KRW lines in 'setup_SK.sh' and resource setup_SK.s
7. 'sh build_oagenweightsapps.sh' installs and builds OAGenWeightsApps. Once built, uncomment the OAGenWeightsApps lines in 'setup_SK.sh' and resource setup_SK.sh

This is the point at which the beam and atmospheric tools diverge, requiring a separate installation of XsecResponse. 

** When building, or sourcing, the different XsecResp tools, a clean working environment is required. **

8a. 'sh build_xsecresp_sksamples.sh' installs the atmospheric version of XsecResponse. Once built, uncomment the XsecResponse lines in 'setup_SK.sh' and resource setup_SK.sh
8b. 'sh build_xsecresp_t2ksamples.sh' installs the beam version of XsecResponse. Once built, uncomment the XsecResponse lines in 'setup_T2K.sh' and resource setup_T2K.sh

*** Running the weight and spline generation code

ExampleRunScript contains some code to generate the run scripts and submission scripts for a Condor scheduler. There exists code to be able to generate both beam and atmospheric weight and spline files using this example code.

'BatchRunScriptBase.sh' is the run script which gets copied and editd to create an individual file for each sample and oscillation channel combination. This file will need modifying to point at the users individual install:

- 'T2KUtilDir' -> Should point at the head directory of the software stack. This should point to the 'SKReprod' or 'AdditionalSplines' stack head directory.
- 'XsecRespDir' -> Should point at the XsecResponse installation within the head directory. This will be beam or atmospheric sample specific.
- 'MTupleDir' -> Should point to a directory containing the mtupled (i.e. split by sample and oscillation channel) MC
- 'WtDir' -> Should point to a directory where the weight files will be stored.
- 'SplineDir' -> Should point to a directory where the spline files will be stored.

This file contains patterns 'SAMPLE' and 'CHANNEL' which get editted by Run.py . These should not be changed.

'BatchSubmitScriptBase.sh' is the submission script for a Condor scheduler. This should be modified to point to the directory in which the submission scripts will be created. Again, the patterns should not changed.

Once the variables have been set to point to the correct directories, the jobs can be spawned and submitted using 'python Run.py'

When finished, there should be '196' atmospheric spline files and '60' beam spline files per software stack (for a total of 512), if the official SK and OA2020 T2K oscillation samples are used.

*** Post-generation

The splines from the 'SKReprod' and 'AdditionalSplines' software stacks need to be h-added together and then modified in accordance with the file structure that MaCh3 expects

** SKSamples **

In PostGeneration/SKSamples directory, two macro files exist: 'HaddSplines_Repo_Additional_SK.py' and 'RenameSplines_HighEnergy.C'. They should be ran in this order.

- HaddSplines_Repo_Additional_SK.py combines the spline files from the SKReprod and AdditionalSplines output directory. This script expects the SKReprod and AdditionalSplines splines directory to be available like so:

[barrowd@mercury009 SKSamples]$ ls -l
total 190
lrwxrwxrwx 1 barrowd t2k   91 Feb 15 08:48 AdditionalSplines -> /opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/AdditionalSplines/SK/Splines/
drwxr-xr-x 2 barrowd t2k  198 Feb 15 08:51 HaddedSplines
-rw-r--r-- 1 barrowd t2k  560 Feb 15 08:49 HaddSplines_Repo_Additional_SK.py
-rw-r--r-- 1 barrowd t2k 3919 Feb 15 08:45 RenameSplines_HighEnergy.C
lrwxrwxrwx 1 barrowd t2k   82 Feb 15 08:48 SKReprod -> /opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/SKReprod/SK/Splines/
[barrowd@mercury009 SKSamples]$ 

The script combines the output of AdditionalSplines and SKReprod, and saves the summed file in HaddedSplines. I do this by sym-linking the separate output and making a new directory for the summed output(mkdir HaddedSplines).

Important ** -> This script spawns a lot of 'hadd' jobs and then performs a sleep command. The hadd jobs typically finish well before the sleep command does. There I run this script in the background and monitor the 'hadd' jobs using 'top'. It's not great, but who's code ever is...

This script is run by 'python HaddSplines_Repo_Additional_SK.py'

- RenameSplines_HighEnergy.C renames the high energy splines to ensure they are technically separated from the low energy counterparts when loaded into MaCh3. This root macro needs to copied into the HaddedSplines folder and ran with 'root -b RenameSplines_HighEnergy.C'. There will be parts where it prints scary looking console output. This is because it assumes every sample has 12 oscillation channels (including taus) but the PC and Upmu samples don't. These kind of errors can be ignored.

This script should be copied into 'HaddedSplines' directory and ran with 'root -b RenameSplines_HighEnergy.C'

** T2KSamples **

The file directory in PostGeneration/T2KSamples should be the same as that in the PostGeneration/SKSamples:

[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls -l PostGeneration/T2KSamples/
total 115
lrwxrwxrwx 1 barrowd t2k   92 Feb 16 08:16 AdditionalSplines -> /opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/AdditionalSplines/T2K/Splines/
-rw-r--r-- 1 barrowd t2k  139 Feb 16 10:30 Go.py
drwxr-xr-x 2 barrowd t2k   64 Feb 16 12:18 HaddedSplines
-rw-r--r-- 1 barrowd t2k  544 Feb 16 08:20 HaddSplines_Repo_Additional_SK.py
-rw-r--r-- 1 barrowd t2k  487 Feb 16 08:14 RenameSplineFiles_MaCh32020Convention.py
-rw-r--r-- 1 barrowd t2k 8390 Feb 16 10:30 RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0.C
lrwxrwxrwx 1 barrowd t2k   83 Feb 16 08:16 SKReprod -> /opt/ppd/scratch-2022/barrow/T2KSKJointFit_SplineTools/runbox/SKReprod/T2K/Splines/
[barrowd@mercury009 T2KSKJointFit_SplineTools]$ 

In PostGeneration/T2KSamples, there are several macros which should be ran in the following order:

- RenameSplineFiles_MaCh32020Convention.py  -> This is a very basic renaming script to match the filenaming scheme set out in MaCh3. A version of this macro should be copied into each of the SKReprod and AdditionalSplines directory and run using 'python RenameSplineFiles_MaCh32020Convention.py'.

- HaddSplines_Repo_Additional_SK.py -> This should be ran in the same way as that in PostGeneration/SKSamples

- RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0.C & Go.py  -> This macro copies the cc1pi splines and renames them to cc1pipm and cc1pi0. This is due to the technical requirement that the CC1pi0 and CC1pipm modes being treated independently for the atmospheric MC, but identically for the beam MC. This is a particularly slow macro and spawns multiple jobs so I would suggest monitoring the jobs with 'top' command. A list of spline files exists within the macro, and it performs this copying on a file-by-file basis [ran via "root -b 'RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0.C(IndexOfFileToModify)'"]. The Go.py script spawns 100 jobs, where each job has a specific index in the range 0-100. Consequently, there will be some errors about missing files. These can be ignored *hopefully*. Both RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0 and Go.py should be copied into HaddedSplines directory, and then ran with 'python Go.py'. Monitor the jobs and wait for them to finish.

*** Final Remarks

At this point, there should be two directories with the final processed splines: PostGeneration/SKSamples/HaddedSplines (196 files) and PostGeneration/T2KSamples/HaddedSplines (60 files). These should be sym-linked within the MaCh3 framework.

If everything worked, congratulations! If it didn't, drop a slack message on #mach3-jointskatmospheric and someone (probably Dan will get back to you). Developments are encouraged, but 'thar be dragons' in this codebase...

```
   (  )   /\   _                 (     
    \ |  (  \ ( \.(               )                      _____
  \  \ \  `  `   ) \             (  ___                 / _   \
 (_`    \+   . x  ( .\            \/   \____-----------/ (o)   \_
- .-               \+  ;          (  O                           \____
                          )        \_____________  `              \  /
(__                +- .( -'.- <. - _  VVVVVVV VV V\                 \/
(_____            ._._: <_ - <- _  (--  _AAAAAAA__A_/                  |
  .    /./.+-  . .- /  +--  - .     \______________//_              \_______
  (__ ' /x  / x _/ (                                  \___'          \     /
 , x / ( '  . / .  /                                      |           \   /
    /  /  _/ /    +                                      /              \/
   '  (__/                                             /                  \   
```

*** Example directory structure for spline/weight file creation

[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/
AdditionalSplines  SKReprod
[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/AdditionalSplines/
SK  T2K
[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/AdditionalSplines/SK/
RunScripts  Splines  Weights

[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/AdditionalSplines/SK/RunScripts/
BatchRunScript_10_10.err  BatchRunScript_13_12.sh   BatchRunScript_16_5.out   BatchRunScript_1_9.err   BatchRunScript_5_4.sh    BatchRunScript_9_12.out     BatchSubmitScript_17_6.sh
BatchRunScript_10_10.out  BatchRunScript_13_1.err   BatchRunScript_16_5.sh    BatchRunScript_1_9.out   BatchRunScript_5_5.err   BatchRunScript_9_12.sh      BatchSubmitScript_17_7.sh
BatchRunScript_10_10.sh   BatchRunScript_13_1.out   BatchRunScript_16_6.err   BatchRunScript_1_9.sh    BatchRunScript_5_5.out   BatchRunScript_9_1.err      BatchSubmitScript_17_8.sh
...

[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/AdditionalSplines/SK/Weights/
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel10_T2KReWeight_Weights.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample19_Channel4_T2KReWeight_Weights.root
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel11_T2KReWeight_Weights.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample19_Channel5_T2KReWeight_Weights.root
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel12_T2KReWeight_Weights.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample19_Channel6_T2KReWeight_Weights.root
...

[barrowd@mercury009 T2KSKJointFit_SplineTools]$ ls runbox/AdditionalSplines/SK/Splines/
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel10_XsecResponse_Splines.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample19_Channel7_XsecResponse_Splines.root
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel11_XsecResponse_Splines.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample19_Channel8_XsecResponse_Splines.root
sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample10_Channel12_XsecResponse_Splines.root  sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample1_Channel10_XsecResponse_Splines.root
...
