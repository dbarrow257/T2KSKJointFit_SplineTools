import os

for iFile in os.listdir():
    if ("1D" in iFile):
        fileName = "spline2020asplinesfitqunPre_"+(iFile.split("_1D_XsecResponse_Splines"))[0]+".root"
        Command = "mv "+iFile+" "+fileName
        print(Command)
        os.system(Command)
    if ("2D" in iFile):
        fileName = "spline2020asplinesfitqunPreerectheta_"+(iFile.split("_2D_XsecResponse_Splines"))[0]+".root"
        Command = "mv "+iFile+" "+fileName
        print(Command)
        os.system(Command)
