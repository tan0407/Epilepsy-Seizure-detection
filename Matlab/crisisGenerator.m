function [GenEpi] = crisisGenerator(EpiAcc,EpiEMG,EpiGyro)
meanAcc = mean(EpiAcc,1);
meanEMG = mean(EpiEMG,1);
meanGyro = mean(EpiGyro,1);
stdAcc = std(EpiAcc,1);
stdEMG = std(EpiEMG,1);
stdGyro = std(EpiGyro,1);
p=size(EpiEMG,1)/size(EpiAcc,1);
values = floor(((rand()-1)*2000)+size(EpiAcc,1));
GenEpiAcc = mvnrnd(meanAcc,stdAcc,values);
GenEpiEMG = mvnrnd(meanEMG,stdEMG,floor(values*p));
GenEpiGyro = mvnrnd(meanGyro,stdGyro,values);
GenEpi = struct("Acc",GenEpiAcc,"EMG",GenEpiEMG,"Gyro",GenEpiGyro);
end