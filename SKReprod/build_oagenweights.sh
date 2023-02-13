#DB Some changes from the SKReprodOA2020 base branch - Now incorporated into SKReprodOA2020_AtmosphericJointFit

#--- a/app/SK/genWeightsSKsplines_newfunctions_2021Weights.cxx
#+++ b/app/SK/genWeightsSKsplines_newfunctions_2021Weights.cxx
#@@ -78,6 +78,10 @@ int main(int argc, char **argv) {
#     SK_infile->GetObject("minituple", sktree);
#   }
#   if(!sktree){
#+    cerr <<EOF
# "Cannot find tree minituple! Looking for atm_minituple instead" <<endl;
#+    SK_infile->GetObject("atm_minituple", sktree);
#+  }
#+  if(!sktree){
#     cerr << "Cannot find tree minituple! this is a problem"<<endl;
#     exit(1);
#   }
#@@ -189,6 +193,7 @@ int main(int argc, char **argv) {
# 
#   // ETA - Q2 params ||
#   // HI - Old Low Q2 weight 6-8 are now high Q2 weight 1-3
#+  /*
#   TurnDial("QETwk_LowQ2Weight_1", LowQ2Suppression_knots, true); 
#   TurnDial("QETwk_LowQ2Weight_2", LowQ2Suppression_knots, true);
#   TurnDial("QETwk_LowQ2Weight_3", LowQ2Suppression_knots, true);
#@@ -197,6 +202,7 @@ int main(int argc, char **argv) {
#   TurnDial("QETwk_HighQ2Weight_1", LowQ2Suppression_knots, true);
#   TurnDial("QETwk_HighQ2Weight_2", LowQ2Suppression_knots, true);
#   TurnDial("QETwk_HighQ2Weight_3", LowQ2Suppression_knots, true);
#+  */
# 
#   cout << "---------------------------------" << endl;
#   cout << "Completed, weights are stored in " << fSKOutName << endl;
#EOF

export OAGEN_DIR=OAGenWeightsApps

git clone git@github.com:t2k-software/OAGenWeightsApps ${OAGEN_DIR}
cd ${OAGEN_DIR}
git checkout cd00a6c562844e2f926947c0bfc037a15d26433f #SKReprodOA2020_AtmosphericJointFit

mkdir build; cd build;
cmake ../ -DUSE_SK=ON
make
make install

source ${OAGEN_DIR}/build/Linux/setup.sh
