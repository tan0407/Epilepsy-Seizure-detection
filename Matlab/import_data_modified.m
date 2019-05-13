%This script replays the data to have more values and removes the begin and
%the end which are noise. Also readjusting the data to match each axis

%PLEASE BE SURE TO BE IN THE MATLAB FOLDER OF THE PROJECT
actualpath = pwd;

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\pingpong\matlab32.mat')); %Getting the data of the ping pong 
PingGyro = mm.myoData.gyro_log(); %Gets the gyroscope data
PingGyro = PingGyro(4506:40370,:);
PingGyro = PingGyro-mean(PingGyro,1);
PingEMG = mm.myoData.emg_log(); %Gets the emg data
PingEMG = PingEMG(18007:161325,:);
PingEMG = PingEMG-mean(PingEMG,1);
PingAcc = mm.myoData.accel_log(); %Gets the accelerometer data
PingAcc = PingAcc(4506:40370,:);
PingAcc = PingAcc-mean(PingAcc,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\walking +eplibsy\matlab92.mat')); %Getting the data of the epilepsy with the walk
EpiGyro = mm.myoData.gyro_log();
EpiWalkGyro = repmat(EpiGyro(3500:13900,:),3,1);
EpiWalkGyro = EpiWalkGyro-mean(EpiWalkGyro,1);
EpiGyro = repmat(EpiGyro(9274:11088,:),18,1);
EpiGyro = EpiGyro-mean(EpiGyro,1);
EpiEMG = mm.myoData.emg_log();
EpiWalkEMG = repmat(EpiEMG(13984:55538,:),3,1);
EpiWalkEMG = EpiWalkEMG - mean(EpiWalkEMG,1);
EpiEMG = repmat(EpiEMG(37054:44302,:),18,1);
EpiEMG = EpiEMG-mean(EpiEMG,1);
EpiAcc = mm.myoData.accel_log();
EpiWalkAcc = repmat(EpiAcc(3500:13900,:),3,1);
EpiWalkAcc = EpiWalkAcc-mean(EpiWalkAcc,1);
EpiAcc = repmat(EpiAcc(9274:11088,:),18,1);
EpiAcc = EpiAcc-mean(EpiAcc,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\run\matlab22.mat')); %Getting the data of the running
RunGyro = mm.myoData.gyro_log();
RunGyro = RunGyro(6125:36120,:);
RunGyro = RunGyro-mean(RunGyro,1);
RunEMG = mm.myoData.emg_log();
RunEMG = RunEMG(24472:144313,:);
RunEMG = RunEMG-mean(RunEMG,1);
RunAcc = mm.myoData.accel_log();
RunAcc = RunAcc(6125:36120,:);
RunAcc = RunAcc-mean(RunAcc,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\aspirateur\matlab52.mat')); %Getting the data of the aspirator
AspiGyro = mm.myoData.gyro_log();
AspiGyro = AspiGyro(2764:32220,:);
AspiGyro = AspiGyro-mean(AspiGyro,1);
AspiEMG = mm.myoData.emg_log();
AspiEMG = AspiEMG(11046:128760,:);
AspiEMG = AspiEMG-mean(AspiEMG,1);
AspiAcc = mm.myoData.accel_log();
AspiAcc = AspiAcc(2764:32220,:);
AspiAcc = AspiAcc-mean(AspiAcc,1);


load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\basketball\matlab83.mat')); %Getting the data of the basketball
BasketGyro = mm.myoData.gyro_log();
BasketGyro = BasketGyro(1809:31100,:);
BasketGyro = BasketGyro-mean(BasketGyro,1);
BasketEMG = mm.myoData.emg_log();
BasketEMG = BasketEMG(7230:124299,:);
BasketEMG = BasketEMG-mean(BasketEMG,1);
BasketAcc = mm.myoData.accel_log();
BasketAcc = BasketAcc(1809:31110,:);
BasketAcc = BasketAcc-mean(BasketAcc,1);

load(strcat(actualpath,'\Data\Simulations-20190219T113602Z-001\Simulations\brush teeth\matlab42.mat')); %Getting the data of the brush teeth
BrushGyro = mm.myoData.gyro_log();
BrushGyro = BrushGyro(2137:31130,:);
BrushGyro = BrushGyro-mean(BrushGyro,1);
BrushEMG = mm.myoData.emg_log();
BrushEMG = BrushEMG(8539:124386,:);
BrushEMG = BrushEMG-mean(BrushEMG,1);
BrushAcc = mm.myoData.accel_log();
BrushAcc = BrushAcc(2137:31130,:);
BrushAcc = BrushAcc-mean(BrushAcc,1);

clear ans mm
