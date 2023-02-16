import os

def replaceText(File,oldText,newText):
    with open(File) as f:
        newText=f.read().replace(oldText,newText)
    with open(File,"w") as f:
        f.write(newText)
            
BaseRunScript = "BatchRunScriptBase.sh"
BaseSubmitScript = "BatchSubmitScriptBase.sh"

NSamples = 19
NChannels = 12

for Sample in range(1,NSamples+1):
    for Channel in range(1,NChannels+1):
        NewRunScript = "BatchRunScript_"+str(Sample)+"_"+str(Channel)+".sh"
        os.system("cp "+BaseRunScript+" "+NewRunScript)
        replaceText(NewRunScript,"SAMPLE",str(Sample))
        replaceText(NewRunScript,"CHANNEL",str(Channel))
        
        NewSubmitScript = "BatchSubmitScript_"+str(Sample)+"_"+str(Channel)+".sh"
        os.system("cp "+BaseSubmitScript+" "+NewSubmitScript)
        replaceText(NewSubmitScript,"SAMPLE",str(Sample))
        replaceText(NewSubmitScript,"CHANNEL",str(Channel))
        
        Command = "condor_submit "+NewSubmitScript
        os.system(Command)
        #print(Command)
