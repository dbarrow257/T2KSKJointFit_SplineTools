import os

for i in range(100):
    Command = "root -b 'RenameSplines_CC1pi_to_CC1pipm_and_CC1pi0.C("+str(i)+")' &"
    os.system(Command)
