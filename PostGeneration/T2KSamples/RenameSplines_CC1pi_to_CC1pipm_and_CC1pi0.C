#include <vector>

bool RenameSpline(TString OldFileName, TString NewFileName, std::vector<TString> OldModeNames, std::vector<TString> NewModeNames);

void RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0(int iFile) {

  std::vector<TString> OldFileNames;
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.nuebar_x_nuebar_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.nuebar_x_nuebar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.nue_x_nue_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.nue_x_nue_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numubar_x_nuebar_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numubar_x_nuebar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numubar_x_numubar_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numubar_x_numubar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numu_x_nue_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numu_x_nue_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numu_x_numu_cc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.fhc.numu_x_numu_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.nuebar_x_nuebar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.nue_x_nue_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.numubar_x_nuebar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.numubar_x_numubar_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.numu_x_nue_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPreerectheta_t2ksk19b.fqv4r0.rhc.numu_x_numu_nueselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.nuebar_x_nuebar_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.nuebar_x_nuebar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.nue_x_nue_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.nue_x_nue_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numubar_x_nuebar_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numubar_x_nuebar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numubar_x_numubar_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numubar_x_numubar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numu_x_nue_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numu_x_nue_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numu_x_numu_numucc1piselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.fhc.numu_x_numu_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.nuebar_x_nuebar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.nue_x_nue_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.numubar_x_nuebar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.numubar_x_numubar_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.numu_x_nue_numuselec.root");
  OldFileNames.push_back("spline2020asplinesfitqunPre_t2ksk19b.fqv4r0.rhc.numu_x_numu_numuselec.root");

  if (iFile >= OldFileNames.size()) {
    return;
  }

  std::vector<TString> OldModeNames;
  OldModeNames.push_back("cc1pi");
  OldModeNames.push_back("cc1pi");

  std::vector<TString> NewModeNames;
  NewModeNames.push_back("cc1pipm");
  NewModeNames.push_back("cc1pi0");

  if (OldModeNames.size() != NewModeNames.size()) {
    std::cerr << "Invalid mode name vectors" << std::endl;
    throw;
  }
  
  std::cout << "--------------------------------------------" << std::endl;
  TString OldFileName = OldFileNames[iFile];
  
  TString NewFileName = OldFileNames[iFile];
  NewFileName.ReplaceAll(".root","_Temp.root");
  
  bool RenamedSpline = RenameSpline(OldFileName,NewFileName,OldModeNames,NewModeNames);
  
  if (RenamedSpline) {
    std::cout << "Renaming " << NewFileName << " to " << OldFileName << std::endl;
    rename(NewFileName.Data(),OldFileName.Data());
  }
  
  std::cout << "--------------------------------------------" << std::endl;
  
}

bool RenameSpline(TString OldFileName, TString NewFileName, std::vector<TString> OldModeNames, std::vector<TString> NewModeNames) {

  if (OldModeNames.size()!=NewModeNames.size()) {std::cout << "Vectors of different size!" << std::endl; return false;}
  int nModesToRename = OldModeNames.size();

  std::cout << "Old File:" << OldFileName << std::endl;
  std::cout << "New File:" << NewFileName << std::endl;

  std::cout << "\n" << "Renaming following splines:" << std::endl;
  for (int iMode=0;iMode<nModesToRename;iMode++) {
    std::cout << OldModeNames[iMode] << " to " << NewModeNames[iMode] << std::endl;
  }

  TFile* OldFile = new TFile(OldFileName);
  if (OldFile->IsZombie()) {std::cout << "Old File not Found!" << std::endl; return false;}

  TIter Next(OldFile->GetListOfKeys());
  TKey* Key;

  TFile* NewFile = new TFile(NewFileName,"RECREATE");
  NewFile->cd();

  while ((Key = (TKey*)Next())) {
    TString ObjName = Key->GetName();

    char* ObjName_Char = (char*)Key->GetName();
    char* mode_char = strtok(ObjName_Char,"_");
    mode_char = strtok (NULL, "_");
    mode_char = strtok (NULL, "_");    
    TString ModeName = mode_char;

    bool WrittenObj = false;

    for (int iModeName=0;iModeName<OldModeNames.size();iModeName++) {
      if (ModeName == OldModeNames[iModeName]) {

	TString NewName = ObjName;
        NewName.ReplaceAll(OldModeNames[iModeName],NewModeNames[iModeName]);

	if (strcmp(Key->GetClassName(),"TH3F")==0) {
	  TH3F* Hist = (TH3F*)Key->ReadObj();
	  Hist->SetName(NewName);
	  Hist->SetTitle(NewName);
	  Hist->Write();
	} else if (strcmp(Key->GetClassName(),"TGraph")==0) {
	  TGraph* Graph = (TGraph*)Key->ReadObj();
	  Graph->SetName(NewName);
	  Graph->SetTitle(NewName);
	  Graph->Write();
	} else if (strcmp(Key->GetClassName(),"TSpline3")==0) {
	  TSpline3* Spline = (TSpline3*)Key->ReadObj();
	  Spline->SetName(NewName);
	  Spline->SetTitle(NewName);
	  Spline->Write();
	} else if (strcmp(Key->GetClassName(),"TH2F")==0) {
	  TH2F* Hist2F = (TH2F*)Key->ReadObj();
	  Hist2F->SetName(NewName);
	  Hist2F->SetTitle(NewName);
	  Hist2F->Write();
	} else {
	  std::cout << "Not found - " << ObjName << " " << Key->GetClassName() << std::endl;
	  return false;
	}

	WrittenObj = true;
      }
    }

    if (!WrittenObj) {

      if (strcmp(Key->GetClassName(),"TH3F")==0) {
	TH3F* Hist = (TH3F*)Key->ReadObj();
	Hist->SetName(ObjName);
	Hist->SetTitle(ObjName);
	Hist->Write();
      } else if (strcmp(Key->GetClassName(),"TGraph")==0) {
	TGraph* Graph = (TGraph*)Key->ReadObj();
	Graph->SetName(ObjName);
	Graph->SetTitle(ObjName);
	Graph->Write();
      } else if (strcmp(Key->GetClassName(),"TSpline3")==0) {
	TSpline3* Spline = (TSpline3*)Key->ReadObj();
	Spline->SetName(ObjName);
	Spline->SetTitle(ObjName);
	Spline->Write();
      } else if (strcmp(Key->GetClassName(),"TH2F")==0) {
	TH2F* Hist2F = (TH2F*)Key->ReadObj();
        Hist2F->SetName(ObjName);
        Hist2F->SetTitle(ObjName);
        Hist2F->Write();
      } else {
	std::cout << "Not found - " << ObjName << " " << Key->GetClassName() << std::endl;
	return false;
      }

    }

  }

  NewFile->Close();
  OldFile->Close();

  return true;
}


