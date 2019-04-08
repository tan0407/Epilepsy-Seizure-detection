load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\pingpong\matlab32.mat');
PingGyro = mm.myoData.gyro_log();
PingEMG = mm.myoData.emg_log();
PingAcc = mm.myoData.accel_log();
pingGyrox = PingGyro(:,1);

load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\walking +eplibsy\matlab92.mat');
EpiGyro = mm.myoData.gyro_log();
EpiEMG = mm.myoData.emg_log();
EpiAcc = mm.myoData.accel_log();
epiGyrox = EpiGyro(:,1);

% %quantization using 2 thresholds
% s1=150;
% s2=300;
% 
% %pingquantix=pingGyrox;
% 
% [nrows,ncols] = size(pingGyrox);
% if mod(nrows,2)== 1
%     nrows = floor(nrows/2)+1;
% else 
%     nrows=nrows/2;
% end
% pingquantix = zeros(nrows,ncols);
% 
% for i=1:2:nrows*2
%     if pingGyrox(i,1) >s2
%         pingquantix(floor(i/2)+1,1)=1;
%     elseif pingGyrox(i,1) >s1 && pingGyrox(i,1)<s2
%         pingquantix(floor(i/2)+1,1)=0.5;
%     elseif pingGyrox(i,1) < -s2
%         pingquantix(floor(i/2)+1,1)=-1;
%     elseif pingGyrox(i,1) >-s2 && pingGyrox(i,1)<-s1
%         pingquantix(floor(i/2)+1,1)=-0.5;
%     else
%         pingquantix(floor(i/2)+1,1)=0;
%     end 
% end
% figure;plot(pingquantix);
%         
% %epiquantix=epiGyrox;
% [nrows,ncols] = size(epiGyrox);
% if mod(nrows,2)== 1
%     nrows = floor(nrows/2)+1;
% else 
%     nrows=nrows/2;
% end
% epiquantix = zeros(nrows,ncols);
% for i=1:2:nrows*2
%     if epiGyrox(i,1) >s2
%         epiquantix(floor(i/2)+1,1)=1;
%     elseif epiGyrox(i,1) >s1 && epiGyrox(i,1)<s2
%         epiquantix(floor(i/2)+1,1)=0.5;
%     elseif epiGyrox(i,1) < -s2
%         epiquantix(floor(i/2)+1,1)=-1;
%     elseif epiGyrox(i,1) >-s2 && epiGyrox(i,1)<-s1
%         epiquantix(floor(i/2)+1,1)=-0.5;
%     else
%         epiquantix(floor(i/2)+1,1)=0;
%     end  
% end
% figure;plot(epiquantix);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%quantization using 1 threshold
s1=150;


%pingquantix=pingGyrox;

[nrows,ncols] = size(pingGyrox);
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end
pingquantix = zeros(nrows,ncols);
nb1ping=0;
nb0ping=0;
for i=1:2:nrows*2
    if pingGyrox(i,1) > s1
        pingquantix(floor(i/2)+1,1)=1;
        nb1ping=nb1ping+1;
    elseif pingGyrox(i,1) < -s1
        pingquantix(floor(i/2)+1,1)=1;
        nb1ping=nb1ping+1;
    else
        pingquantix(floor(i/2)+1,1)=0;
        nb0ping=nb0ping+1;
    end 
end
pingquantix = pingquantix(3018:3926,1);
figure;plot(pingquantix);
        
%epiquantix=epiGyrox;
[nrows,ncols] = size(epiGyrox);
if mod(nrows,2)== 1
    nrows = floor(nrows/2)+1;
else 
    nrows=nrows/2;
end
epiquantix = zeros(nrows,ncols);
nb1epi=0;
nb0epi=0;

for i=1:2:nrows*2
    if epiGyrox(i,1) > s1
        epiquantix(floor(i/2)+1,1)=1;
        nb1epi=nb1epi+1;
    elseif epiGyrox(i,1) < -s1
        epiquantix(floor(i/2)+1,1)=1;
        nb1epi=nb1epi+1;
    else
        epiquantix(floor(i/2)+1,1)=0;
        nb0epi=nb0epi+1;
    end  
end
epiquantix = epiquantix(4637:5544,1);
figure;plot(epiquantix);
        