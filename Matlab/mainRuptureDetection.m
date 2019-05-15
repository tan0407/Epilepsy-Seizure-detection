GenEpi = crisisGenerator(EpiAcc,EpiEMG,EpiGyro);
Window = 235; %The frequency for Gyro & Acc is over 50Hz and 200Hz for EMG; It means that a window of 235 values of Gyro is equivalent at 5s of measure 


%PINGPONG
begin = 1;
PreviousWindowAcc=PingAcc(begin:begin+Window,:);
PreviousWindowEMG=PingEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=PingGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=PingAcc(begin:begin+Window,:);
CurrentWindowEMG=PingEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=PingGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyPing=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyPing=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(PingAcc,1)
        break
    end
    CurrentWindowAcc=PingAcc(begin:begin+Window,:);
    CurrentWindowEMG=PingEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=PingGyro(begin:begin+Window,:);

end

%ASPI
begin = 1;
PreviousWindowAcc=AspiAcc(begin:begin+Window,:);
PreviousWindowEMG=AspiEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=AspiGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=AspiAcc(begin:begin+Window,:);
CurrentWindowEMG=AspiEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=AspiGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyAspi=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyAspi=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(AspiAcc,1)
        break
    end
    CurrentWindowAcc=AspiAcc(begin:begin+Window,:);
    CurrentWindowEMG=AspiEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=AspiGyro(begin:begin+Window,:);

end

%BASKET
begin = 1;
PreviousWindowAcc=BasketAcc(begin:begin+Window,:);
PreviousWindowEMG=BasketEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=BasketGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=BasketAcc(begin:begin+Window,:);
CurrentWindowEMG=BasketEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=BasketGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyBasket=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyBasket=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(BasketAcc,1)
        break
    end
    CurrentWindowAcc=BasketAcc(begin:begin+Window,:);
    CurrentWindowEMG=BasketEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=BasketGyro(begin:begin+Window,:);

end

%BRUSH
begin = 1;
PreviousWindowAcc=BrushAcc(begin:begin+Window,:);
PreviousWindowEMG=BrushEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=BrushGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=BrushAcc(begin:begin+Window,:);
CurrentWindowEMG=BrushEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=BrushGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyBrush=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyBrush=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(BrushAcc,1)
        break
    end
    CurrentWindowAcc=BrushAcc(begin:begin+Window,:);
    CurrentWindowEMG=BrushEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=BrushGyro(begin:begin+Window,:);

end

%SIMPLE EPILEPSY
begin = 1;
PreviousWindowAcc=EpiAcc(begin:begin+Window,:);
PreviousWindowEMG=EpiEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=EpiGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=EpiAcc(begin:begin+Window,:);
CurrentWindowEMG=EpiEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=EpiGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyEpi=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyEpi=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(EpiAcc,1) || (begin+Window)*scale > size(EpiEMG,1)
        break
    end
    CurrentWindowAcc=EpiAcc(begin:begin+Window,:);
    CurrentWindowEMG=EpiEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=EpiGyro(begin:begin+Window,:);

end

%Running
begin = 1;
PreviousWindowAcc=RunAcc(begin:begin+Window,:);
PreviousWindowEMG=RunEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=RunGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=RunAcc(begin:begin+Window,:);
CurrentWindowEMG=RunEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=RunGyro(begin:begin+Window,:);

meandiffsAcc=[];
sdiffsAcc=[];

meandiffsGyro=[];
sdiffsGyro=[];

meandiffsEMG=[];
sdiffsEMG=[];
anomalyRun=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc=[meandiffsAcc m1];
    sdiffsAcc=[sdiffsAcc s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG=[meandiffsEMG m2];
    sdiffsEMG=[sdiffsEMG s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro=[meandiffsGyro m3];
    sdiffsGyro=[sdiffsGyro s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyRun=true;
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(RunAcc,1)
        break
    end
    CurrentWindowAcc=RunAcc(begin:begin+Window,:);
    CurrentWindowEMG=RunEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=RunGyro(begin:begin+Window,:);

end


%EPI WALK
scale = 4;
begin = 1;    
PreviousWindowAcc=EpiWalkAcc(begin:begin+Window,:);
PreviousWindowEMG=EpiWalkEMG(begin*scale:(begin+Window)*scale,:);
PreviousWindowGyro=EpiWalkGyro(begin:begin+Window,:);

begin = begin + Window;    

CurrentWindowAcc=EpiWalkAcc(begin:begin+Window,:);
CurrentWindowEMG=EpiWalkEMG(begin*scale:(begin+Window)*scale,:);
CurrentWindowGyro=EpiWalkGyro(begin:begin+Window,:);

meandiffsAcc1=[];
sdiffsAcc1=[];

meandiffsGyro1=[];
sdiffsGyro1=[];

meandiffsEMG1=[];
sdiffsEMG1=[];
anomalyWalkEpi=false;
while 1
    anomalies=0;
    [m1,s1,isRp1] =ruptureDetection(PreviousWindowAcc,CurrentWindowAcc,0.3,0.5);
    meandiffsAcc1=[meandiffsAcc1 m1];
    sdiffsAcc1=[sdiffsAcc1 s1];
    [m2,s2,isRp2]= ruptureDetection(PreviousWindowEMG,CurrentWindowEMG,0.01,0.3);
    meandiffsEMG1=[meandiffsEMG1 m2];
    sdiffsEMG1=[sdiffsEMG1 s2];
    [m3,s3,isRp3] = ruptureDetection(PreviousWindowGyro,CurrentWindowGyro,30,100);
    meandiffsGyro1=[meandiffsGyro1 m3];
    sdiffsGyro1=[sdiffsGyro1 s3];
    anomalies = isRp1+isRp2+isRp3;
    if anomalies>1
        anomalyWalkEpi=true;
        figure('Name','sdiffsAccEpiWalk');plot(sdiffsAcc1);
        yline(0.5,'-','Threshold')
        figure('Name','sdiffsEMGEpiWalk');plot(sdiffsEMG1);
        yline(0.3,'-','Threshold')
        figure('Name','sdiffsGyroEpiWalk');plot(sdiffsGyro1);
        yline(100,'-','Threshold')
        figure('Name','meandiffsAccEpiWalk');plot(meandiffsAcc1);
        yline(0.3,'-','Threshold')
        figure('Name','meandiffsEMGEpiWalk');plot(meandiffsEMG1);
        yline(0.01,'-','Threshold')
        figure('Name','meandiffsGyroEpiWalk');plot(meandiffsGyro1);
        yline(30,'-','Threshold')
        break
    end
    PreviousWindowAcc=CurrentWindowAcc;
    PreviousWindowEMG=CurrentWindowEMG;
    PreviousWindowGyro=CurrentWindowGyro;
        
    begin = begin+Window;
    if begin+Window>size(EpiWalkAcc,1)
        break
    end
    CurrentWindowAcc=EpiWalkAcc(begin:begin+Window,:);
    CurrentWindowEMG=EpiWalkEMG(begin*scale:(begin+Window)*scale,:);
    CurrentWindowGyro=EpiWalkGyro(begin:begin+Window,:);

end