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

%PeakDetection Without Windows