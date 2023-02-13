#DB One comment is that the original OA2020 spline treatment should not include the 'CheckReturnWeight(piej_new / piej_old)' term. Currently investigating whether this should be turned on or of using the below diff:

#[barrowd@mercury009 neut]$ git diff src/reweight/NuXSecRES.cc
#diff --git a/src/reweight/NuXSecRES.cc b/src/reweight/NuXSecRES.cc
#index 8d95057..37fd9bb 100644
#--- a/src/reweight/NuXSecRES.cc
#+++ b/src/reweight/NuXSecRES.cc
#@@ -119,8 +119,8 @@ double NuXSecRESEngine::CalcWeight() {
#   cout <<EOF
# "differential cross section (new) = " << new_xsec << endl;
# #endif
# 
#-  return CheckReturnWeight(new_xsec / old_xsec) *
#-         CheckReturnWeight(piej_new / piej_old);
#+  return CheckReturnWeight(new_xsec / old_xsec); 
#+    //         CheckReturnWeight(piej_new / piej_old);
# }
# 
# } // namespace rew
#[barrowd@mercury009 neut]$ 
#EOF

export NEUT_DIR=neut

git clone git@github.com:/neut-devel/neut ${NEUT_DIR}
cd  ${NEUT_DIR}
git checkout 4fe10fd #debug/T2KOA2021_Alpha2_nofsifix

mkdir build; cd build;
../src/configure --prefix=$(readlink -f Linux)
make -j 8
make install

source ./Linux/setup.sh
