function normalizeddata = normalizemultactivities(list)
    normalizeddata = List.empty();
    for activity = 1:length(list)
        append(normalizeddata,normalization(list(activity)));
    end
end
%INPUT : An EMG activity data (MyoMex format)
%OUTPUT : The data normalized which follows a normal law (vector)
%FUNCTION : This function takes the EMG data of an activity, gets the first emg canal
%and normalize it. The plot of the function has also been added.

function normalizedEmg = normalizationEMG(Emgdata)
    %  EMGdata=Emgdata.myoData.emg_log(); %gets the emg data
    normalizedEmg = normalize(EMGdata(:,1)); %gets one emg canal
   % histfit(normalizedEmg); %plots the barchart with the density function
end

