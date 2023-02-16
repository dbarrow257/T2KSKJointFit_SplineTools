#include <vector>

bool RenameSpline(std::string OriginalFileName, std::string NewFileName, std::vector<TString> OriginalSystNames, std::vector<TString> NewSystNames);

void RenameSplines_HighEnergy() {
  int StartPDFIndex = 8;
  int EndPDFIndex = 20;

  int nChannels = 12;

  std::vector<TString> OriginalSystNames;
  OriginalSystNames.push_back("mecpdd");
  OriginalSystNames.push_back("ca5");
  OriginalSystNames.push_back("manff");
  OriginalSystNames.push_back("bgscl");
  OriginalSystNames.push_back("FSIINELLO");
  OriginalSystNames.push_back("FSIINELHI");
  OriginalSystNames.push_back("FSIPIPROD");
  OriginalSystNames.push_back("FSIPIABS");
  OriginalSystNames.push_back("FSICEXLO");

  std::vector<TString> NewSystNames;
  NewSystNames.push_back("mecpddHighEnergy");
  NewSystNames.push_back("ca5HighEnergy");
  NewSystNames.push_back("manffHighEnergy");
  NewSystNames.push_back("bgsclHighEnergy");
  NewSystNames.push_back("FSIINELLOHighEnergy");
  NewSystNames.push_back("FSIINELHIHighEnergy");
  NewSystNames.push_back("FSIPIPRODHighEnergy");
  NewSystNames.push_back("FSIPIABSHighEnergy");
  NewSystNames.push_back("FSICEXLOHighEnergy");

  for (int iPDF=StartPDFIndex;iPDF<EndPDFIndex;iPDF++) {
    for (int iChannel=1;iChannel<nChannels+1;iChannel++) {
      std::string OriginalFileName = std::string("sk4_fcmc_tau_pcmc_ummc_fQv4r0_sf_minituple_500yr_Sample")+Form("%i",iPDF)+"_Channel"+Form("%i",iChannel)+"_XsecResponse_Splines.root";

      std::string NewFileName = OriginalFileName.substr(0, OriginalFileName.find(".root"));
      NewFileName += "_Renamed.root";

      bool RenamedSpline = RenameSpline(OriginalFileName,NewFileName,OriginalSystNames,NewSystNames);

      if (RenamedSpline) {
	std::cout << "Renaming " << NewFileName << " to " << OriginalFileName << std::endl;
	rename(NewFileName.c_str(),OriginalFileName.c_str());
      }

      std::cout << "--------------------------------------------" << std::endl;
    }
  }

}

bool RenameSpline(std::string OriginalFileName, std::string NewFileName, std::vector<TString> OriginalSystNames, std::vector<TString> NewSystNames) {

  if (OriginalSystNames.size()!=NewSystNames.size()) {std::cout << "Vectors of different size!" << std::endl; return false;}
  int nSystsToRename = OriginalSystNames.size();

  std::cout << "Original File:" << OriginalFileName << std::endl;
  std::cout << "New File:" << NewFileName << std::endl;

  std::cout << "\n" << "Renaming following splines:" << std::endl;
  for (int iSyst=0;iSyst<nSystsToRename;iSyst++) {
    std::cout << OriginalSystNames[iSyst] << " to " << NewSystNames[iSyst] << std::endl;
  }

  TFile* OriginalFile = new TFile(OriginalFileName.c_str());
  if (OriginalFile->IsZombie()) {std::cout << "Original File not Found!" << std::endl; return false;}

  TIter Next(OriginalFile->GetListOfKeys());
  TKey* Key;

  TFile* NewFile = new TFile(NewFileName.c_str(),"RECREATE");
  NewFile->cd();

  while ((Key = (TKey*)Next())) {
    TString Name = Key->GetName();

    TString NewName = Key->GetName();
    for (int iSyst=0;iSyst<OriginalSystNames.size();iSyst++) {
      NewName.ReplaceAll(OriginalSystNames[iSyst],NewSystNames[iSyst]);
    }

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
    } else {
      std::cout << "Not found - " << Key->GetClassName() << std::endl;
      return false;
    }
  }

  NewFile->Close();
  OriginalFile->Close();

  return true;
}


