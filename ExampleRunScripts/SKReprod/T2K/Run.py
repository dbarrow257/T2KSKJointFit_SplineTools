import os

def replaceText(File,oldText,newText):
    with open(File) as f:
        newText=f.read().replace(oldText,newText)
    with open(File,"w") as f:
        f.write(newText)
            
BaseRunScript = "BatchRunScriptBase.sh"
BaseSubmitScript = "BatchSubmitScriptBase.sh"

NSamples = 5
NChannels = 6

for Sample in range(0,NSamples):
    for Channel in range(0,NChannels):
    
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
        
