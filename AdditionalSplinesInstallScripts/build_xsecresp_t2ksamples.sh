#diff --git a/src_bin/make_xsec_response_2021_2d.cc b/src_bin/make_xsec_response_2021_2d.cc
#index 9e5a660..976530e 100644
#--- a/src_bin/make_xsec_response_2021_2d.cc
#+++ b/src_bin/make_xsec_response_2021_2d.cc
#@@ -165,8 +165,8 @@ int main(int argc, char *argv[])
#     std::vector<int> mecmode; mecmode.push_back(8);
#     std::vector<int> pimodes; pimodes.push_back(1); pimodes.push_back(4); pimodes.push_back(5);
#     std::vector<int> ccothmode; ccothmode.push_back(3);
#-       std::vector<int> ccmpimode; ccmpimode.push_back(10);
#-       std::vector<int> ccdismode; ccdismode.push_back(11);
#+    std::vector<int> ccmpimode; ccmpimode.push_back(10);
#+    std::vector<int> ccdismode; ccdismode.push_back(11);
#     std::vector<int> allmodes; 
#     for(int i = 0; i <= 11; i++) 
#       allmodes.push_back(i);
#@@ -192,88 +192,32 @@ int main(int argc, char *argv[])
#        //    SystematicProperties2D berpaC_sysprop("NIWG_Effective_rpaCCQE_C","erpa_D",ccqemode,6);
#        //    SystematicProperties2D berpaD_sysprop("NIWG_Effective_rpaCCQE_D","erpa_E",ccqemode,6);
# 
#-    SystematicProperties2D maqe_sysprop("MaCCQE","maqe",ccqemode,3);
#-    SystematicProperties2D mec_sysprop("MECTwkDial_PDDWeight_O16","mecpdd",mecmode,3);
#-    SystematicProperties2D ca5_sysprop("CA5RES","ca5",pimodes,3);
#-    SystematicProperties2D manff_sysprop("MaRES","manff",pimodes,3);
#-       SystematicProperties2D bgscl_sysprop("BgSclRES","bgscl",pimodes,3);
#-
#-       // only 7 knots!
#-       SystematicProperties2D FSI_NCasc_FrAbs_pi_sysprop("PionFSI_AbsProb","FSIPIABS",allmodes,3);
#-       SystematicProperties2D FSI_NCasc_FrInelLow_pi_sysprop("PionFSI_QELowMomProb","FSIINELLO",allmodes,3);
#-       SystematicProperties2D FSI_NCasc_FrCExLow_pi_sysprop("PionFSI_CExLowMomProb","FSICEXLO",allmodes,3);
#-       //SystematicProperties2D FSI_NCasc_FrCExHigh_pi_sysprop("NCasc_FrCExHigh_pi","FSICEXHI",allmodes,3);//ETA- NOT USUALLY IN THE OA
#-       SystematicProperties2D FSI_NCasc_FrInelHigh_pi_sysprop("PionFSI_QEHighMomProb","FSIINELHI",allmodes,3);
#-       SystematicProperties2D FSI_NCasc_FrPiProd_pi_sysprop("PionFSI_InelProb","FSIPIPROD",allmodes,1);
#-
#-       //ETA CCDIS and CCMPi parameters for 2020OA
#-       SystematicProperties2D BY_DIS_sysprop("DIS_BY_corr_on_off", "DISBY", ccdismode,3);
#-       SystematicProperties2D BY_MPi_sysprop("MultiPi_BY_corr_on_off", "MPiBY", ccmpimode,3);
#-       SystematicProperties2D Xsec_AGKY_sysprop("HadMult_AGKY", "MPiAGKYXsec", ccmpimode,3);
#-       //ETA adding I-1/2 anti-nu parameter
#-       SystematicProperties2D bgsclbar_sysprop("BgSclLMCPiBarRES", "bgsclbar", pimodes, 3);
#-       //ETA adding 2p2h which wasn't in this branch...
#-       SystematicProperties2D Edep2p2h_lowEnu_sysprop("MECTwkDial_2p2hEdep_lowEnu","2p2hedeplowenu", mecmode, 1);
#-       SystematicProperties2D Edep2p2h_highEnu_sysprop("MECTwkDial_2p2hEdep_highEnu", "2p2hedephienu", mecmode, 1);
#-       SystematicProperties2D Edep2p2h_lowEnubar_sysprop("MECTwkDial_2p2hEdep_lowEnubar", "2p2hedeplowenubar", mecmode, 1);
#-       SystematicProperties2D Edep2p2h_highEnubar_sysprop("MECTwkDial_2p2hEdep_highEnubar", "2p2hedephienubar", mecmode, 1);
#-       //ETA adding low Q2 params for VALOR                                                                                     #                                                                           
#-       //Changing the naming to be conistent with ND
#-       //i.e. C++ indexing on the names!
#-       SystematicProperties2D LowQ2Suppression_1_sysprop("QETwk_LowQ2Weight_1", "LowQ2Suppression0", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_2_sysprop("QETwk_LowQ2Weight_2", "LowQ2Suppression1", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_3_sysprop("QETwk_LowQ2Weight_3", "LowQ2Suppression2", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_4_sysprop("QETwk_LowQ2Weight_4", "LowQ2Suppression3", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_5_sysprop("QETwk_LowQ2Weight_5", "LowQ2Suppression4", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_6_sysprop("QETwk_HighQ2Weight_1", "LowQ2Suppression5", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_7_sysprop("QETwk_HighQ2Weight_2", "LowQ2Suppression6", ccqemode, 3);
#-       SystematicProperties2D LowQ2Suppression_8_sysprop("QETwk_HighQ2Weight_3", "LowQ2Suppression7", ccqemode, 3);
#-
#-
#-
#+    SystematicProperties2D MatrixElementRO_sysprop("MatrixElement_RO", "MatrixElementRO", pimodes, 3);
#+    SystematicProperties2D AdlerAngle_sysprop("AdlerAngle", "AdlerAngle", pimodes, 3);
#+    SystematicProperties2D PionNuclXSec_FEFQE_sysprop("PionNuclXSec_FEFQE","SIFEFQE",allmodes,0);
#+    SystematicProperties2D PionNuclXSec_FEFABS_sysprop("PionNuclXSec_FEFABS","SIFEFABS",allmodes,0);
#+    SystematicProperties2D PionNuclXSec_FEFCX_sysprop("PionNuclXSec_FEFCX","SIFEFCX",allmodes,0);
#+    SystematicProperties2D PionNuclXSec_FEFINEL_sysprop("PionNuclXSec_FEFINEL","SIFEFINEL",allmodes,0);
#+    SystematicProperties2D PionNuclXSec_FEFQEH_sysprop("PionNuclXSec_FEFQEH","SIFEFQEH",allmodes,0);
#+    SystematicProperties2D PhotoNuclear_sysprop("PhotoNuclear","PhotoNuclear",allmodes,1);
#+    SystematicProperties2D CRPA_O16_nu_sysprop("Nuc_NueNumuTwkDial_O16_nu","CRPAOxygenNu",allmodes,0);
#+    SystematicProperties2D CRPA_O16_nubar_sysprop("Nuc_NueNumuTwkDial_O16_nubar","CRPAOxygenNuBar",allmodes,0);
# 
#     // Put these systematics in a list
#     std::vector<SystematicProperties2D> systProps;
#-    systProps.push_back(maqe_sysprop);
#-    //systProps.push_back(maqe_sf_sysprop);
#-    systProps.push_back(mec_sysprop);
#-       //    systProps.push_back(pfo_sysprop);
#-    systProps.push_back(ca5_sysprop);
#-    systProps.push_back(manff_sysprop);
#-       systProps.push_back(bgscl_sysprop);
#-       //    systProps.push_back(dismpishp_sysprop);
#-       //    systProps.push_back(berpaA_sysprop);
#-       //    systProps.push_back(berpaB_sysprop);
#-       //    systProps.push_back(berpaC_sysprop);
#-       //    systProps.push_back(berpaD_sysprop);
#-    systProps.push_back(FSI_NCasc_FrAbs_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrCExLow_pi_sysprop);
#-    //systProps.push_back(FSI_NCasc_FrCExHigh_pi_sysprop); //ETA- NOT USUALLY IN THE OA
#-    systProps.push_back(FSI_NCasc_FrInelLow_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrPiProd_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrInelHigh_pi_sysprop);
#-       //ETA CCDIS and CCMPi parameters for 2020OA
#-    systProps.push_back(BY_DIS_sysprop);
#-    systProps.push_back(BY_MPi_sysprop);
#-    systProps.push_back(Xsec_AGKY_sysprop);
#-       //ETA I-1/2 anti-nu parameter
#-       systProps.push_back(bgsclbar_sysprop);
#-       //ETA 2p2h energy dependent parameters
#-       systProps.push_back(Edep2p2h_lowEnu_sysprop);
#-       systProps.push_back(Edep2p2h_highEnu_sysprop);
#-       systProps.push_back(Edep2p2h_lowEnubar_sysprop);
#-       systProps.push_back(Edep2p2h_highEnubar_sysprop);
#-       //Q2 parmaeters
#-       systProps.push_back(LowQ2Suppression_1_sysprop);
#-       systProps.push_back(LowQ2Suppression_2_sysprop);
#-       systProps.push_back(LowQ2Suppression_3_sysprop);
#-       systProps.push_back(LowQ2Suppression_4_sysprop);
#-       systProps.push_back(LowQ2Suppression_5_sysprop);       
#-       systProps.push_back(LowQ2Suppression_6_sysprop);       
#-       systProps.push_back(LowQ2Suppression_7_sysprop);       
#-       systProps.push_back(LowQ2Suppression_8_sysprop);       
#-
#-       std::cout << "Size of systProps is " << systProps.size() << std::endl;
#+
#+    systProps.push_back(MatrixElementRO_sysprop);
#+    systProps.push_back(AdlerAngle_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFQE_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFABS_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFCX_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFINEL_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFQEH_sysprop);
#+    systProps.push_back(PhotoNuclear_sysprop);
#+    systProps.push_back(CRPA_O16_nu_sysprop);
#+    systProps.push_back(CRPA_O16_nubar_sysprop);
#+    
#+    std::cout << "Size of systProps is " << systProps.size() << std::endl;
# 
#     // Call the XSecVary class constructor
#     XsecVary20192D* xs;
#diff --git a/src_bin/make_xsec_response_sk_2021.cc b/src_bin/make_xsec_response_sk_2021.cc
#index 18bc84d..81e6de0 100644
#--- a/src_bin/make_xsec_response_sk_2021.cc
#+++ b/src_bin/make_xsec_response_sk_2021.cc
#@@ -152,83 +152,30 @@ int main(int argc, char *argv[])
#        //    SystematicProperties berpaC_sysprop("NIWG_Effective_rpaCCQE_C","erpa_D",ccqemode,6);
#        //    SystematicProperties berpaD_sysprop("NIWG_Effective_rpaCCQE_D","erpa_E",ccqemode,6);
# 
#-    SystematicProperties maqe_sysprop("MaCCQE","maqe",ccqemode,3);
#-    SystematicProperties mec_sysprop("MECTwkDial_PDDWeight_O16","mecpdd",mecmode,3);
#-    SystematicProperties ca5_sysprop("CA5RES","ca5",pimodes,3);
#-    SystematicProperties manff_sysprop("MaRES","manff",pimodes,3);
#-       SystematicProperties bgscl_sysprop("BgSclRES","bgscl",pimodes,3);
#-
#-       // only 7 knots!
#-       SystematicProperties FSI_NCasc_FrAbs_pi_sysprop("PionFSI_AbsProb","FSIPIABS",allmodes,3);
#-       SystematicProperties FSI_NCasc_FrInelLow_pi_sysprop("PionFSI_QELowMomProb","FSIINELLO",allmodes,3);
#-       SystematicProperties FSI_NCasc_FrCExLow_pi_sysprop("PionFSI_CExLowMomProb","FSICEXLO",allmodes,3);
#-       //SystematicProperties2D FSI_NCasc_FrCExHigh_pi_sysprop("NCasc_FrCExHigh_pi","FSICEXHI",allmodes,3);//ETA- NOT USUALLY IN THE OA
#-       SystematicProperties FSI_NCasc_FrInelHigh_pi_sysprop("PionFSI_QEHighMomProb","FSIINELHI",allmodes,3);
#-       SystematicProperties FSI_NCasc_FrPiProd_pi_sysprop("PionFSI_InelProb","FSIPIPROD",allmodes,1);
#-
#-       //ETA CCDIS and CCMPi parameters for 2020OA
#-       SystematicProperties BY_DIS_sysprop("DIS_BY_corr_on_off", "DISBY", ccdismode,3);
#-       SystematicProperties BY_MPi_sysprop("MultiPi_BY_corr_on_off", "MPiBY", ccmpimode,3);
#-       SystematicProperties Xsec_AGKY_sysprop("HadMult_AGKY", "MPiAGKYXsec", ccmpimode,3);
#-       //ETA adding I-1/2 anti-nu parameter
#-       SystematicProperties bgsclbar_sysprop("BgSclLMCPiBarRES", "bgsclbar", pimodes, 3);
#-       //ETA adding 2p2h which wasn't in this branch...
#-       SystematicProperties Edep2p2h_lowEnu_sysprop("MECTwkDial_2p2hEdep_lowEnu","2p2hedeplowenu", mecmode, 1);
#-       SystematicProperties Edep2p2h_highEnu_sysprop("MECTwkDial_2p2hEdep_highEnu", "2p2hedephienu", mecmode, 1);
#-       SystematicProperties Edep2p2h_lowEnubar_sysprop("MECTwkDial_2p2hEdep_lowEnubar", "2p2hedeplowenubar", mecmode, 1);
#-       SystematicProperties Edep2p2h_highEnubar_sysprop("MECTwkDial_2p2hEdep_highEnubar", "2p2hedephienubar", mecmode, 1);
#-       //ETA adding low Q2 params for VALOR                                                                                     #                                                                           
#-       //Changing the naming to be conistent with ND
#-       //i.e. C++ indexing on the names!
#-       SystematicProperties LowQ2Suppression_1_sysprop("QETwk_LowQ2Weight_1", "LowQ2Suppression0", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_2_sysprop("QETwk_LowQ2Weight_2", "LowQ2Suppression1", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_3_sysprop("QETwk_LowQ2Weight_3", "LowQ2Suppression2", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_4_sysprop("QETwk_LowQ2Weight_4", "LowQ2Suppression3", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_5_sysprop("QETwk_LowQ2Weight_5", "LowQ2Suppression4", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_6_sysprop("QETwk_HighQ2Weight_1", "LowQ2Suppression5", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_7_sysprop("QETwk_HighQ2Weight_2", "LowQ2Suppression6", ccqemode, 3);
#-       SystematicProperties LowQ2Suppression_8_sysprop("QETwk_HighQ2Weight_3", "LowQ2Suppression7", ccqemode, 3);
#+    SystematicProperties MatrixElementRO_sysprop("MatrixElement_RO", "MatrixElementRO", pimodes, 3);
#+    SystematicProperties AdlerAngle_sysprop("AdlerAngle", "AdlerAngle", pimodes, 3);
#+    SystematicProperties PionNuclXSec_FEFQE_sysprop("PionNuclXSec_FEFQE","SIFEFQE",allmodes,0);
#+    SystematicProperties PionNuclXSec_FEFABS_sysprop("PionNuclXSec_FEFABS","SIFEFABS",allmodes,0);
#+    SystematicProperties PionNuclXSec_FEFCX_sysprop("PionNuclXSec_FEFCX","SIFEFCX",allmodes,0);
#+    SystematicProperties PionNuclXSec_FEFINEL_sysprop("PionNuclXSec_FEFINEL","SIFEFINEL",allmodes,0);
#+    SystematicProperties PionNuclXSec_FEFQEH_sysprop("PionNuclXSec_FEFQEH","SIFEFQEH",allmodes,0);
#+    SystematicProperties PhotoNuclear_sysprop("PhotoNuclear","PhotoNuclear",allmodes,1);
#+    SystematicProperties CRPA_O16_nu_sysprop("Nuc_NueNumuTwkDial_O16_nu","CRPAOxygenNu",allmodes,0);
#+    SystematicProperties CRPA_O16_nubar_sysprop("Nuc_NueNumuTwkDial_O16_nubar","CRPAOxygenNuBar",allmodes,0);
# 
#     // Put these systematics in a list
#     std::vector<SystematicProperties> systProps;
#-    systProps.push_back(maqe_sysprop);
#-    //systProps.push_back(maqe_sf_sysprop);
#-    systProps.push_back(mec_sysprop);
#-       //    systProps.push_back(pfo_sysprop);
#-    systProps.push_back(ca5_sysprop);
#-    systProps.push_back(manff_sysprop);
#-    systProps.push_back(bgscl_sysprop);
#-       //    systProps.push_back(dismpishp_sysprop);
#-       //    systProps.push_back(berpaA_sysprop);
#-       //    systProps.push_back(berpaB_sysprop);
#-       //    systProps.push_back(berpaC_sysprop);
#-       //    systProps.push_back(berpaD_sysprop);
#-    systProps.push_back(FSI_NCasc_FrAbs_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrCExLow_pi_sysprop);
#-    //systProps.push_back(FSI_NCasc_FrCExHigh_pi_sysprop);//ETA- NOT USUALLY IN THE OA
#-    systProps.push_back(FSI_NCasc_FrInelLow_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrPiProd_pi_sysprop);
#-    systProps.push_back(FSI_NCasc_FrInelHigh_pi_sysprop);
#-       //ETA CCDIS and CCMPi parameters for 2020OA
#-    systProps.push_back(BY_DIS_sysprop);
#-    systProps.push_back(BY_MPi_sysprop);
#-    systProps.push_back(Xsec_AGKY_sysprop);
#-       //ETA I-1/2 anti-nu parameter
#-       systProps.push_back(bgsclbar_sysprop);
#-       //ETA 2p2h energy dependent parameters
#-       systProps.push_back(Edep2p2h_lowEnu_sysprop);
#-       systProps.push_back(Edep2p2h_highEnu_sysprop);
#-       systProps.push_back(Edep2p2h_lowEnubar_sysprop);
#-       systProps.push_back(Edep2p2h_highEnubar_sysprop);
#-       //Q2 parameters
#-       systProps.push_back(LowQ2Suppression_1_sysprop);
#-       systProps.push_back(LowQ2Suppression_2_sysprop);
#-       systProps.push_back(LowQ2Suppression_3_sysprop);
#-       systProps.push_back(LowQ2Suppression_4_sysprop);
#-       systProps.push_back(LowQ2Suppression_5_sysprop);
#-       systProps.push_back(LowQ2Suppression_6_sysprop);
#-       systProps.push_back(LowQ2Suppression_7_sysprop);
#-       systProps.push_back(LowQ2Suppression_8_sysprop);
#+
#+    systProps.push_back(MatrixElementRO_sysprop);
#+    systProps.push_back(AdlerAngle_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFQE_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFABS_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFCX_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFINEL_sysprop);
#+    systProps.push_back(PionNuclXSec_FEFQEH_sysprop);
#+    systProps.push_back(PhotoNuclear_sysprop);
#+    systProps.push_back(CRPA_O16_nu_sysprop);
#+    systProps.push_back(CRPA_O16_nubar_sysprop);
# 
#     // Call the XSecVary class constructor
#     XsecVary2019 xs(wtfile, mtuple, systProps, nutype);
#(END)

export XSECRS_DIR=XsecResponse_T2K

git clone git@github.com:/t2k-software/XsecResponse ${XSECRS_DIR}
cd ${XSECRS_DIR}
git checkout SK_reprodofOA2020

make

export LD_LIBRARY_PATH=${T2KUtils}/XsecResponse/lib:${LD_LIBRARY_PATH}
