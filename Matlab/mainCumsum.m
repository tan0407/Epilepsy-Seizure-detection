GenEpi = crisisGenerator(EpiAcc,EpiEMG,EpiGyro);
TSAcc = 2400;
TSGyro = 1.5e4;
TSEMG = 55;

[c21, isWalkEpiAccCrisis2] = cumsumOnMatrix(EpiWalkAcc,TSAcc,2*mean(EpiWalkAcc,1));
[c22, isWalkEpiGyroCrisis2] = cumsumOnMatrix(EpiWalkGyro,TSGyro,2*mean(EpiWalkGyro,1));
[c23, isWalkEpiEMGCrisis2] = cumsumOnMatrix(EpiWalkEMG,TSEMG,2*mean(EpiWalkEMG,1));
if isWalkEpiAccCrisis2+isWalkEpiGyroCrisis2+isWalkEpiEMGCrisis2 > 1
    isWalkEpiCrisis2=true;
else 
    isWalkEpiCrisis2=false;
end
clear isWalkEpiAccCrisis2 isWalkEpiGyroCrisis2 isWalkEpiEMGCrisis2

[c41, isPingAccCrisis2] = cumsumOnMatrix(PingAcc,TSAcc,2*mean(PingAcc,1));
[c42, isPingGyroCrisis2] = cumsumOnMatrix(PingGyro,TSGyro,2*mean(PingGyro,1));
[c43, isPingEMGCrisis2] = cumsumOnMatrix(PingEMG,TSEMG,2*mean(PingEMG,1));
if isPingAccCrisis2+isPingGyroCrisis2+isPingEMGCrisis2 > 1
    isPingCrisis2=true;
else 
    isPingCrisis2=false;
end
clear isPingAccCrisis2 isPingGyroCrisis2 isPingEMGCrisis2

[c31, isAspiAccCrisis2] = cumsumOnMatrix(AspiAcc,TSAcc,2*mean(AspiAcc,1));
[c32, isAspiGyroCrisis2] = cumsumOnMatrix(AspiGyro,TSGyro,2*mean(AspiGyro,1));
[c33, isAspiEMGCrisis2] = cumsumOnMatrix(AspiEMG,TSEMG,2*mean(AspiEMG,1));
if isAspiAccCrisis2+isAspiGyroCrisis2+isAspiEMGCrisis2 > 1
    isAspiCrisis2=true;
else 
    isAspiCrisis2=false;
end
clear isAspiAccCrisis2 isAspiGyroCrisis2 isAspiEMGCrisis2

[c51, isBasketAccCrisis2] = cumsumOnMatrix(BasketAcc,TSAcc,2*mean(BasketAcc,1));
[c52, isBasketGyroCrisis2] = cumsumOnMatrix(BasketGyro,TSGyro,2*mean(BasketGyro,1));
[c53, isBasketEMGCrisis2] = cumsumOnMatrix(BasketEMG,TSEMG,2*mean(BasketEMG,1));
if isBasketAccCrisis2+isBasketGyroCrisis2+isBasketEMGCrisis2 > 1
    isBasketCrisis2=true;
else 
    isBasketCrisis2=false;
end
clear isBasketAccCrisis2 isBasketGyroCrisis2 isBasketEMGCrisis2

[c61, isRunAccCrisis2] = cumsumOnMatrix(RunAcc,TSAcc,2*mean(RunAcc,1));
[c62, isRunGyroCrisis2] = cumsumOnMatrix(RunGyro,TSGyro,2*mean(RunGyro,1));
[c63, isRunEMGCrisis2] = cumsumOnMatrix(RunEMG,TSEMG,2*mean(RunEMG,1));
if isRunAccCrisis2+isRunGyroCrisis2+isRunEMGCrisis2 > 1
    isRunCrisis2=true;
else 
    isRunCrisis2=false;
end
clear isRunAccCrisis2 isRunGyroCrisis2 isRunEMGCrisis2

[c71, isBrushAccCrisis2] = cumsumOnMatrix(BrushAcc,TSAcc,2*mean(BrushAcc,1));
[c72, isBrushGyroCrisis2] = cumsumOnMatrix(BrushGyro,TSGyro,2*mean(BrushGyro,1));
[c73, isBrushEMGCrisis2] = cumsumOnMatrix(BrushEMG,TSEMG,2*mean(BrushEMG,1));
if isBrushAccCrisis2+isBrushGyroCrisis2+isBrushEMGCrisis2 > 1
    isBrushCrisis2=true;
else 
    isBrushCrisis2=false;
end
clear isBrushAccCrisis2 isBrushGyroCrisis2 isBrushEMGCrisis2

[c11, isEpiAccCrisis2] = cumsumOnMatrix(GenEpi.Acc,TSAcc,2*mean(GenEpi.Acc,1));
[c12, isEpiGyroCrisis2] = cumsumOnMatrix(GenEpi.Gyro,TSGyro,2*mean(GenEpi.Gyro,1));
[c13, isEpiEMGCrisis2] = cumsumOnMatrix(GenEpi.EMG,TSEMG,2*mean(GenEpi.EMG,1));
if isEpiAccCrisis2+isEpiGyroCrisis2+isEpiEMGCrisis2 > 1
    isEpiCrisis2=true;
else 
    isEpiCrisis2=false;
end
clear isEpiAccCrisis2 isEpiGyroCrisis2 isEpiEMGCrisis2

figure("Name","WalkEpiAcc");plot(c21,'DisplayName','c21')
yline(TSAcc,'-','Threshold')
figure("Name","WalkEpiGyro");plot(c22,'DisplayName','c22')
yline(TSGyro,'-','Threshold')
figure("Name","WalkEpiEMG");plot(c23,'DisplayName','c23')
yline(TSEMG,'-','Threshold')

figure("Name","PingPongAcc");plot(c41,'DisplayName','c41')
yline(TSAcc,'-','Threshold')
figure("Name","PingPongGyro");plot(c42,'DisplayName','c42')
yline(TSGyro,'-','Threshold')
figure("Name","PingPongEMG");plot(c43,'DisplayName','c43')
yline(TSEMG,'-','Threshold')
% 
% [c isEpiCrisis1] = cumsum_adaptive(GenEpi.EMG(:,1),TS,2*mean(GenEpi.EMG(:,1)));
% [c2 isWalkEpiCrisis2] = cumsum_adaptive(EpiWalkAcc(:,1),TS,2*mean(EpiWalkAcc(:,1)));
% [c3 isAspiCrisis3] = cumsum_adaptive(AspiAcc(:,1),TS,2*mean(AspiAcc(:,1)));
% [c4 isPingCrisis3] = cumsum_adaptive(PingAcc(:,1),TS,2*mean(PingAcc(:,1)));
% [c5 isBasketCrisis3] = cumsum_adaptive(BasketAcc(:,1),TS,2*mean(BasketAcc(:,1)));
% [c6 isRunCrisis3] = cumsum_adaptive(RunAcc(:,1),TS,2*mean(RunAcc(:,1)));
% [c7 isBrushCrisis3] = cumsum_adaptive(BrushEMG(:,1),TS,2*mean(BrushEMG(:,1)));