%PLEASE BE SURE TO BE IN THE MATLAB FOLDER OF THE PROJECT
actualpath = pwd;

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\pingpong\matlab32.mat')); %Getting the data of the ping pong 
PingGyro = mm.myoData.gyro_log(); %Gets the gyroscope data
PingEMG = mm.myoData.emg_log(); %Gets the emg data
PingAcc = mm.myoData.accel_log(); %Gets the accelerometer data
pingGyrox = PingGyro(:,1); %Gets only the X-axis of the gyroscope data

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\walking +eplibsy\matlab92.mat')); %Getting the data of the epilepsy with the walk
EpiGyro = mm.myoData.gyro_log();
EpiEMG = mm.myoData.emg_log();
EpiAcc = mm.myoData.accel_log();
epiGyrox = EpiGyro(:,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\run\matlab22.mat')); %Getting the data of the running
RunGyro = mm.myoData.gyro_log();
RunEMG = mm.myoData.emg_log();
RunAcc = mm.myoData.accel_log();
runGyrox = RunGyro(:,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\aspirateur\matlab52.mat')); %Getting the data of the aspirator
AspiGyro = mm.myoData.gyro_log();
AspiEMG = mm.myoData.emg_log();
AspiAcc = mm.myoData.accel_log();
aspiGyrox = AspiGyro(:,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\basketball\matlab83.mat')); %Getting the data of the basketball
BasketGyro = mm.myoData.gyro_log();
BasketEMG = mm.myoData.emg_log();
BasketAcc = mm.myoData.accel_log();
basketGyrox = BasketGyro(:,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\brush teeth\matlab42.mat')); %Getting the data of the brush teeth
BrushGyro = mm.myoData.gyro_log();
BrushEMG = mm.myoData.emg_log();
BrushAcc = mm.myoData.accel_log();
brushGyrox = BrushGyro(:,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%quantization using 1 threshold

threshold=150;

%%%% TREATMENT OF THE PING PONG DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nrows,ncols] = size(pingGyrox); %used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
pingquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if pingGyrox(i,1) > threshold
        pingquantix(floor(i/2)+1,1)=1;
       
    elseif pingGyrox(i,1) < -threshold
        pingquantix(floor(i/2)+1,1)=1;
       
    else
        pingquantix(floor(i/2)+1,1)=0;
        
    end 
end


pingquantix = pingquantix(3018:3926,1); %Only this part of the data is useful
[nrows,ncols] = size(pingquantix);

% %We get the number of 1 and 0 values 
% for i=1:nrows
%     if pingquantix(i,1)==1
%         nb1ping=nb1ping+1;
%     else
%         nb0ping=nb0ping+1;
%     end
% end

%freqping=nb1ping*100/nb0ping;  %calculates the frequency 
[peaksPingpong,locsPingpong] = findpeaks(pingquantix); %calculates the number of peaks
figure('Name','Ping Pong');plot(pingquantix); 

%%%% TREATMENT OF THE EPILEPSY DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%epiquantix=epiGyrox;
[nrows,ncols] = size(epiGyrox);%used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
epiquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if epiGyrox(i,1) > threshold
        epiquantix(floor(i/2)+1,1)=1;
        
    elseif epiGyrox(i,1) < -threshold
        epiquantix(floor(i/2)+1,1)=1;
       
    else
        epiquantix(floor(i/2)+1,1)=0;
        
    end  
end

epiquantix = epiquantix(4637:5544,1);%Only this part of the data is useful because the crisis is only there

[peaksEpilepsy,locsEpilepsy] = findpeaks(epiquantix); %calculates the number of peaks
figure('Name','Epilepsie');plot(epiquantix);


%%%% TREATMENT OF THE RUNNING DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nrows,ncols] = size(runGyrox);%used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
runquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if runGyrox(i,1) > threshold
        runquantix(floor(i/2)+1,1)=1;
        
    elseif runGyrox(i,1) < -threshold
        runquantix(floor(i/2)+1,1)=1;
       
    else
        runquantix(floor(i/2)+1,1)=0;
        
    end  
end

runquantix = runquantix(3829:4737,1);%Only this part of the data is useful because the crisis is only there

[peaksRunning,locsRunning] = findpeaks(runquantix); %calculates the number of peaks
figure('Name','Running');plot(runquantix);


%%%% TREATMENT OF THE ASPIRATOR DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nrows,ncols] = size(aspiGyrox);%used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
aspiquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if aspiGyrox(i,1) > threshold
        aspiquantix(floor(i/2)+1,1)=1;
        
    elseif aspiGyrox(i,1) < -threshold
        aspiquantix(floor(i/2)+1,1)=1;
       
    else
        aspiquantix(floor(i/2)+1,1)=0;
        
    end  
end

aspiquantix = aspiquantix(3459:4367,1); %Only this part of the data is useful because the crisis is only there

[peaksAspi,locsAspi] = findpeaks(aspiquantix); %calculates the number of peaks
figure('Name','Aspirator');plot(aspiquantix);


%%%% TREATMENT OF THE BASKET BALL DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nrows,ncols] = size(basketGyrox);%used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
basketquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if basketGyrox(i,1) > threshold
        basketquantix(floor(i/2)+1,1)=1;
        
    elseif basketGyrox(i,1) < -threshold
        basketquantix(floor(i/2)+1,1)=1;
       
    else
        basketquantix(floor(i/2)+1,1)=0;
        
    end  
end

basketquantix = basketquantix(1330:2238,1); %Only this part of the data is useful because the crisis is only there
[peaksBasket,locsBasket] = findpeaks(basketquantix); %calculates the number of peaks
figure('Name','Basketball');plot(basketquantix);
        
%%%% TREATMENT OF THE TEETH BRUSH DATA %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nrows,ncols] = size(brushGyrox);%used to get the number of rows
%We will get 1/2 of the data. If the number of rows is odd, we get the rounded upper. 
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end

%We create a new matrix which will contain the quantified data
brushquantix = zeros(nrows,ncols);

%Quantification
for i=1:2:nrows*2
    if brushGyrox(i,1) > threshold
        brushquantix(floor(i/2)+1,1)=1;
        
    elseif brushGyrox(i,1) < -threshold
        brushquantix(floor(i/2)+1,1)=1;
       
    else
        brushquantix(floor(i/2)+1,1)=0;
        
    end  
end

brushquantix = brushquantix(8298:9206,1); %Only this part of the data is useful because the crisis is only there
[peaksBrush,locsBrush] = findpeaks(brushquantix); %calculates the number of peaks
figure('Name','Brush Teeth');plot(brushquantix);        