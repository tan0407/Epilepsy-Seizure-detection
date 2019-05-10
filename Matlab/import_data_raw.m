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
