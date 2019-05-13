function [GeneratedEpi] = crisisGenerator(EpiAcc,EpiEMG,EpiGyro)
    meanAcc = mean(EpiAcc,1); %gets the mean for each column (axis)
    meanEMG = mean(EpiEMG,1);
    meanGyro = mean(EpiGyro,1);
    stdAcc = std(EpiAcc,1); %gets the standard deviation for each column (axis)
    stdEMG = std(EpiEMG,1);
    stdGyro = std(EpiGyro,1);
    
    values = floor(((rand()-1)*2000)+size(EpiAcc,1));
   
    GenEpiAcc = mvnrnd(meanAcc,stdAcc,values);
    GenEpiEMG = mvnrnd(meanEMG,stdEMG,values*4);
    GenEpiGyro = mvnrnd(meanGyro,stdGyro,values);
    
    GeneratedEpi = struct("Acc",GenEpiAcc,"EMG",GenEpiEMG,"Gyro",GenEpiGyro);
end

