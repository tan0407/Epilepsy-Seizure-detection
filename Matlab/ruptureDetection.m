function [meandiff,sddiff,isRupture] = ruptureDetection(previousWindow,actualWindow,TSmean,TSsd)
    c = size(previousWindow,2);
    localAnomalies=0;
    for col=1:c
        mu1 = mean(previousWindow(:,col));
        sd1 = std(previousWindow(:,col));
        mu2 = mean(actualWindow(:,col));
        sd2 = std(actualWindow(:,col));
        meandiff=mu2-mu1;
        sddiff=sd2-sd1;
        if meandiff>TSmean || sddiff > TSsd
            localAnomalies=localAnomalies+1;         
        end
    end
    if localAnomalies>1
        isRupture=1;
    else
        isRupture=0;
    end
end