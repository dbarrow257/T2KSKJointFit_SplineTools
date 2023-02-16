import time
import os

SKReprod = "SKReprod/"
AdditionalSplines = "AdditionalSplines/"
HaddedSplines = "HaddedSplines"

SKReprodFiles = os.listdir("./"+SKReprod)
for File in SKReprodFiles:
    if "spline" in File:
        if os.path.isfile("./"+AdditionalSplines+"/"+File):
            Command = "hadd "+HaddedSplines+"/"+File+" "+SKReprod+"/"+File+" "+AdditionalSplines+"/"+File+" &"
            os.system(Command)
            #print(Command)
        else:
            print(File+" not found")

print("Finished.. Waiting")
time.sleep(1000000)
