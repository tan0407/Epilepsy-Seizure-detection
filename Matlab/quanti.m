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

%Used after to know the frequency
nb1ping=0;
nb0ping=0;

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

%We get the number of 1 and 0 values 
for i=1:nrows
    if pingquantix(i,1)==1
        nb1ping=nb1ping+1;
    else
        nb0ping=nb0ping+1;
    end
end
figure('Name','Ping Pong');plot(pingquantix); 
freqping=nb1ping*100/nb0ping;  %calculates the frequency 

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

%Used after to know the frequency
nb1epi=0;
nb0epi=0;

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
[nrows,ncols] = size(epiquantix);
%We get the number of 1 and 0 values 
for i=1:nrows
    if epiquantix(i,1)==1
        nb1epi=nb1epi+1;
    else
        nb0epi=nb0epi+1;
    end
end
freqepi = nb1epi*100/nb0epi; %calculates the frequency 
figure('Name','Epilepsie');plot(epiquantix);
        