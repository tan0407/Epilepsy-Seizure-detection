function [cumsumMat, anomaly] = cumsumOnMatrix(mat,TS,w)
    [r,c] = size(mat);
    cumsumMat=zeros(r,c);
    anomalies=0;
    for col=1:c
        [cumsumact,an]=cumsumOnVector(mat(:,col),TS,w(col));
        cumsumMat(:,col)=cumsumact;
        if (an==1)
            anomalies=anomalies+1;
        end
    end
    if (anomalies>1)
        anomaly=1;
    else
        anomaly=0;
    end
end

