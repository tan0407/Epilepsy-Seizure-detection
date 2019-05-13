thresholdGyro = 100;
thresholdAcc = 0.4;
thresholdEMG = 0.8;

%Generation of a crisis
GenEpi = crisisGenerator(EpiAcc,EpiEMG,EpiGyro);

%Quantification

QuantiBrushGyro = quantization(BrushGyro,thresholdGyro);
QuantiBrushEMG = quantization(BrushEMG,thresholdEMG);
QuantiBrushAcc = quantization(BrushAcc,thresholdAcc);

QuantiEpiGyro = quantization(EpiGyro,thresholdGyro);
QuantiEpiEMG = quantization(EpiEMG,thresholdEMG);
QuantiEpiAcc = quantization(EpiAcc,thresholdAcc);

QuantiRunGyro = quantization(RunGyro,thresholdGyro);
QuantiRunEMG = quantization(RunEMG,thresholdEMG);
QuantiRunAcc = quantization(RunAcc,thresholdAcc);

QuantiBasketGyro = quantization(BasketGyro,thresholdGyro);
QuantiBasketEMG = quantization(BasketEMG,thresholdEMG);
QuantiBasketAcc = quantization(BasketAcc,thresholdAcc);

QuantiRunGyro = quantization(RunGyro,thresholdGyro);
QuantiRunEMG = quantization(RunEMG,thresholdEMG);
QuantiRunAcc = quantization(RunAcc,thresholdAcc);

QuantiPingGyro = quantization(PingGyro,thresholdGyro);
QuantiPingEMG = quantization(PingEMG,thresholdEMG);
QuantiPingAcc = quantization(PingAcc,thresholdAcc);

QuantiAspiGyro = quantization(AspiGyro,thresholdGyro);
QuantiAspiEMG = quantization(AspiEMG,thresholdEMG);
QuantiAspiAcc = quantization(AspiAcc,thresholdAcc);

QuantiEpi2Gyro = quantization(GenEpi.Gyro,thresholdGyro);
QuantiEpi2EMG = quantization(GenEpi.EMG,thresholdEMG);
QuantiEpi2Acc = quantization(GenEpi.Acc,thresholdAcc);

choix = 1;

%PeakDetection Without Windows
if choix == 0
    [TSGyro,TSEMG,TSAcc] = peakDetection(QuantiEpiGyro,QuantiEpiEMG,QuantiEpiAcc);
    [PeaksRunGyro,PeaksRunEMG,PeaksRunAcc] = peakDetection(QuantiRunGyro,QuantiRunEMG,QuantiRunAcc);
    [PeaksBrushGyro,PeaksBrushEMG,PeaksBrushAcc] = peakDetection(QuantiBrushGyro,QuantiBrushEMG,QuantiBrushAcc);
    [PeaksPingGyro,PeaksPingEMG,PeaksPingAcc] = peakDetection(QuantiPingGyro,QuantiPingEMG,QuantiPingAcc);
    [PeaksBasketGyro,PeaksBasketEMG,PeaksBasketAcc] = peakDetection(QuantiBasketGyro,QuantiBasketEMG,QuantiBasketAcc);
    [PeaksEpi2Gyro,PeaksEpi2EMG,PeaksEpi2Acc] = peakDetection(QuantiEpi2Gyro,QuantiEpi2EMG,QuantiEpi2Acc);

    if(PeaksEpi2Gyro>0.9*TSGyro || PeaksEpi2EMG>0.9*TSEMG || PeaksEpi2Acc > 0.9*TSAcc)
        isCrisis = true;
    else isCrisis = false;
    end

%PeakDetection Windowed
elseif choix ==1
    nbfen=0;
    
    Window = 235; %The frequency for Gyro & Acc is over 47Hz; It means that a window of 705 values of Gyro is equivalent at 15s of measure 
    
    begin1 = floor(rand()*10000);
    scale = size(QuantiEpiEMG,1)/size(QuantiEpiAcc,1);
    
    CurrentWindowEpiAcc = QuantiEpiAcc(begin1:begin1+Window,:);
    CurrentWindowEpiGyro = QuantiEpiGyro(begin1:begin1+Window,:);
    CurrentWindowEpiEMG = QuantiEpiEMG(floor(begin1*scale):floor((begin1+Window)*scale),:);
   
%     begin = floor(rand()*10000);
%     scale = size(QuantiRunEMG,1)/size(QuantiRunAcc,1);
% 
%     CurrentWindowRunAcc = QuantiRunAcc(begin:begin+Window,:);
%     CurrentWindowRunGyro = QuantiRunGyro(begin:begin+Window,:);
%     CurrentWindowRunEMG = QuantiRunEMG(floor(begin*scale):floor((begin+Window)*scale),:);
%     
%     begin = floor(rand()*10000);
%     scale = size(QuantiBrushEMG,1)/size(QuantiBrushAcc,1);
% 
%     CurrentWindowBrushAcc = QuantiBrushAcc(begin:begin+Window,:);
%     CurrentWindowBrushGyro = QuantiBrushGyro(begin:begin+Window,:);
%     CurrentWindowBrushEMG = QuantiBrushEMG(floor(begin*scale):floor((begin+Window)*scale),:);
%     
%     begin = floor(rand()*10000);
%     scale = size(QuantiBasketEMG,1)/size(QuantiBasketAcc,1);
% 
%     CurrentWindowBasketAcc = QuantiBasketAcc(begin:begin+Window,:);
%     CurrentWindowBasketGyro = QuantiBasketGyro(begin:begin+Window,:);
%     CurrentWindowBasketEMG = QuantiBasketEMG(floor(begin*scale):floor((begin+Window)*scale),:);
%     
%     begin = floor(rand()*10000);
%     scale = size(QuantiPingEMG,1)/size(QuantiPingAcc,1);
% 
%     CurrentWindowPingAcc = QuantiBasketAcc(begin:begin+Window,:);
%     CurrentWindowPingGyro = QuantiBasketGyro(begin:begin+Window,:);
%     CurrentWindowPingEMG = QuantiBasketEMG(floor(begin*scale):floor((begin+Window)*scale),:);
%     
      
    begin2 = floor(rand()*10000);
    scale = size(QuantiEpi2EMG,1)/size(QuantiEpi2Acc,1);

    CurrentWindowEpi2Acc = QuantiEpi2Acc(begin2:begin2+Window,:);
    CurrentWindowEpi2Gyro = QuantiEpi2Gyro(begin2:begin2+Window,:);
    CurrentWindowEpi2EMG = QuantiEpi2EMG(floor(begin2*scale):floor((begin2+Window)*scale),:);
    while (nbfen<3)
        [TSGyro,TSEMG,TSAcc] = peakDetection(CurrentWindowEpiGyro,CurrentWindowEpiEMG,CurrentWindowEpiAcc);
        [PeaksEpi2Gyro,PeaksEpi2EMG,PeaksEpi2Acc] = peakDetection(QuantiEpi2Gyro,QuantiEpi2EMG,QuantiEpi2Acc);
        if(PeaksEpi2Gyro>0.9*TSGyro || PeaksEpi2EMG>0.9*TSEMG || PeaksEpi2Acc > 0.9*TSAcc)
            nbfen = nbfen+1;
        else
            nbfen = 0;
        end
        begin1 = begin1+Window;
        begin2 = begin2+Window;
        CurrentWindowEpiAcc = QuantiEpiAcc(begin1:begin1+Window,:);
        CurrentWindowEpiGyro = QuantiEpiGyro(begin1:begin1+Window,:);
        CurrentWindowEpiEMG = QuantiEpiEMG(floor(begin1*scale):floor((begin1+Window)*scale),:);
        CurrentWindowEpi2Acc = QuantiEpi2Acc(begin2:begin2+Window,:);
        CurrentWindowEpi2Gyro = QuantiEpi2Gyro(begin2:begin2+Window,:);
        CurrentWindowEpi2EMG = QuantiEpi2EMG(floor(begin2*scale):floor((begin2+Window)*scale),:);
    end
    if nbfen==3
        isCrisis = true;
    else 
        isCrisis = false;
    end
%     [PeaksRunGyro,PeaksRunEMG,PeaksRunAcc] = peakDetection(CurrentWindowRunGyro,CurrentWindowRunEMG,CurrentWindowRunAcc);
%     [PeaksBrushGyro,PeaksBrushEMG,PeaksBrushAcc] = peakDetection(CurrentWindowBrushGyro,CurrentWindowBrushEMG,CurrentWindowBrushAcc);
%     [PeaksBasketGyro,PeaksBasketEMG,PeaksBasketAcc] = peakDetection(CurrentWindowBasketGyro,CurrentWindowBasketEMG,CurrentWindowBasketEMG);
%     [PeaksPingGyro,PeaksPingEMG,PeaksPingAcc] = peakDetection(CurrentWindowPingGyro,CurrentWindowPingEMG,CurrentWindowPingAcc);


 
    clear begin1 begin2 scale CurrentWindowEpiAcc CurrentWindowEpiGyro CurrentWindowEpiEMG CurrentWindowRunGyro CurrentWindowRunEMG CurrentWindowRunAcc CurrentWindowBrushGyro CurrentWindowBrushEMG CurrentWindowBrushAcc CurrentWindowBasketGyro CurrentWindowBasketEMG CurrentWindowBasketEMG CurrentWindowPingGyro CurrentWindowPingEMG CurrentWindowPingAcc ;
end




