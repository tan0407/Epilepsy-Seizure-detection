function [peaks] = peakDetection(data)
%PEAKDETECTIONONQUANTIZED 
% Peak detection for each axis 
% Returns a struct that contains the number of peaks for each axis
    [r,c] = size(data);
    for i=1:c
        [p,h] = findpeaks(data(:,i));       
        peaks.(strcat('c',num2str(i))) = size(p,1);
    end
end

