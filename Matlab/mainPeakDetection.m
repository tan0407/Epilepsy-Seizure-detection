thresholdGyro = 150;
thresholdAcc = 0.4;
thresholdEMG = 0.8;

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

choix = 1;

%PeakDetection Without Windows
if choix == 0
    [TSGyro,TSEMG,TSAcc] = peakDetection(QuantiEpiGyro,QuantiEpiEMG,QuantiEpiAcc);
    [PeaksRunGyro,PeaksRunEMG,PeaksRunAcc] = peakDetection(QuantiRunGyro,QuantiRunEMG,QuantiRunAcc);
    [PeaksBrushGyro,PeaksBrushEMG,PeaksBrushAcc] = peakDetection(QuantiBrushGyro,QuantiBrushEMG,QuantiBrushAcc);
    [PeaksPingGyro,PeaksPingEMG,PeaksPingAcc] = peakDetection(QuantiPingGyro,QuantiPingEMG,QuantiPingAcc);
    [PeaksBasketGyro,PeaksBasketEMG,PeaksBasketAcc] = peakDetection(QuantiBasketGyro,QuantiBasketEMG,QuantiBasketAcc);

    if(PeaksRunGyro>0.9*TSGyro || PeaksRunEMG>0.9*TSEMG || PeaksRunAcc > 0.9*TSAcc)
        isCrisis = true;
    else isCrisis = false;
    end

%PeakDetection Windowed
elseif choix ==1
    
    Window = 8000;
    begin = floor(rand()*10000);
    scale = size(QuantiEpiEMG,1)/size(QuantiEpiAcc,1);

    CurrentWindowEpiAcc = QuantiEpiAcc(begin:begin+Window,:);
    CurrentWindowEpiGyro = QuantiEpiGyro(begin:begin+Window,:);
    CurrentWindowEpiEMG = QuantiEpiEMG(floor(begin*scale):floor((begin+Window)*scale),:);

    begin = floor(rand()*10000);
    scale = size(QuantiRunEMG,1)/size(QuantiRunAcc,1);

    CurrentWindowRunAcc = QuantiRunAcc(begin:begin+Window,:);
    CurrentWindowRunGyro = QuantiRunGyro(begin:begin+Window,:);
    CurrentWindowRunEMG = QuantiRunEMG(floor(begin*scale):floor((begin+Window)*scale),:);
    
    begin = floor(rand()*10000);
    scale = size(QuantiBrushEMG,1)/size(QuantiBrushAcc,1);

    CurrentWindowBrushAcc = QuantiBrushAcc(begin:begin+Window,:);
    CurrentWindowBrushGyro = QuantiBrushGyro(begin:begin+Window,:);
    CurrentWindowBrushEMG = QuantiBrushEMG(floor(begin*scale):floor((begin+Window)*scale),:);
    
    begin = floor(rand()*10000);
    scale = size(QuantiBasketEMG,1)/size(QuantiBasketAcc,1);

    CurrentWindowBasketAcc = QuantiBasketAcc(begin:begin+Window,:);
    CurrentWindowBasketGyro = QuantiBasketGyro(begin:begin+Window,:);
    CurrentWindowBasketEMG = QuantiBasketEMG(floor(begin*scale):floor((begin+Window)*scale),:);
    
    begin = floor(rand()*10000);
    scale = size(QuantiPingEMG,1)/size(QuantiPingAcc,1);

    CurrentWindowPingAcc = QuantiBasketAcc(begin:begin+Window,:);
    CurrentWindowPingGyro = QuantiBasketGyro(begin:begin+Window,:);
    CurrentWindowPingEMG = QuantiBasketEMG(floor(begin*scale):floor((begin+Window)*scale),:);
    

    [TSGyro,TSEMG,TSAcc] = peakDetection(CurrentWindowEpiGyro,CurrentWindowEpiEMG,CurrentWindowEpiAcc);
    [PeaksRunGyro,PeaksRunEMG,PeaksRunAcc] = peakDetection(CurrentWindowRunGyro,CurrentWindowRunEMG,CurrentWindowRunAcc);
    [PeaksBrushGyro,PeaksBrushEMG,PeaksBrushAcc] = peakDetection(CurrentWindowBrushGyro,CurrentWindowBrushEMG,CurrentWindowBrushAcc);
    [PeaksBasketGyro,PeaksBasketEMG,PeaksBasketAcc] = peakDetection(CurrentWindowBasketGyro,CurrentWindowBasketEMG,CurrentWindowBasketEMG);
    [PeaksPingGyro,PeaksPingEMG,PeaksPingAcc] = peakDetection(CurrentWindowPingGyro,CurrentWindowPingEMG,CurrentWindowPingAcc);

    if(PeaksPingGyro>0.9*TSGyro || PeaksPingEMG>0.9*TSEMG || PeaksPingAcc > 0.9*TSAcc)
        isCrisis = true;
    else isCrisis = false;
    end
    clear begin scale CurrentWindowEpiAcc CurrentWindowEpiGyro CurrentWindowEpiEMG CurrentWindowRunGyro CurrentWindowRunEMG CurrentWindowRunAcc CurrentWindowBrushGyro CurrentWindowBrushEMG CurrentWindowBrushAcc CurrentWindowBasketGyro CurrentWindowBasketEMG CurrentWindowBasketEMG CurrentWindowPingGyro CurrentWindowPingEMG CurrentWindowPingAcc ;
end




