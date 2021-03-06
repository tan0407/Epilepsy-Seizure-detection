function [nbPeaksGyro,nbPeaksEmg,nbPeaksAcc] = peakDetection(GyroData,EMGData,AccData)
%PEAKDETECTION
% Peak detection for each axis 
% Returns the mean number of peaks for data
    [r,c] = size(GyroData);
    nbPeaksGyro=0;
    for i=1:c
        [p,h] = findpeaks(GyroData(:,i));       
        nbPeaksGyro = nbPeaksGyro + size(p,1);
    end
    nbPeaksGyro = floor(nbPeaksGyro/c);
    
    [r,c] = size(EMGData);
    nbPeaksEmg=0;
    for i=1:c
        [p,h] = findpeaks(EMGData(:,i));       
        nbPeaksEmg = nbPeaksEmg + size(p,1);
    end
    nbPeaksEmg = floor(nbPeaksEmg/c);
    
    [r,c] = size(AccData);
    nbPeaksAcc=0;
    for i=1:c
        [p,h] = findpeaks(AccData(:,i));       
        nbPeaksAcc = nbPeaksAcc + size(p,1);
    end
    nbPeaksAcc = floor(nbPeaksAcc/c);
end

