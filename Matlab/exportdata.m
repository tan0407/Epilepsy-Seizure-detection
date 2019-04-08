%Aspi
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\aspirateur\matlab52.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\AspiGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\AspiAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\AspiEMG.csv',EMG);

%Basket
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\basketball\matlab83.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BasketGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BasketAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BasketEMG.csv',EMG);

%BrushTeeth
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\brush teeth\matlab42.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BrushGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BrushAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\BrushEMG.csv',EMG);

%PingPong
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\pingpong\matlab32.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\PingPongGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\PingPongAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\PingPongEMG.csv',EMG);

%Run
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\run\matlab22.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\RunGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\RunAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\RunEMG.csv',EMG);

%Walk
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\walk\matlab123.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkEMG.csv',EMG);

%Walk+Epilepsy
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\walking +eplibsy\matlab92.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkEpiGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkEpiAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\WalkEpiEMG.csv',EMG);

%Watching TV
load('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\Simulations-20190219T113602Z-001\Simulations\Wating TV\matlab52.mat');
Gyro = mm.myoData.gyro_log();
EMG = mm.myoData.emg_log();
Acc = mm.myoData.accel_log();
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\TVGyro.csv',Gyro);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\TVAcc.csv',Acc);
csvwrite('C:\Users\lebre\OneDrive\Documents\Fac\M1\Projet_M1\Matlab\Data\TVEMG.csv',EMG);