% function activites = getActivities(activities,file)
%     append(activities,mm.myoData.emg_log());
% end
function data = filetodata(namefile)
    donnees = load(namefile);
    data=donnees.mm.myoData;
end

function emgData = getEMGData(data)
    emgData = data.emg_log();
end

function accelData = getAccelData(data)
    accelData = data.accel_log();
end

function gyroData = getGyroData(data)
    gyroData = data.gyro_log();
end