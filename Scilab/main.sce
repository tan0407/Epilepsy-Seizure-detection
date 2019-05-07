threshold = 150;
pingGyroQuanti = quantization(PingGyro,threshold);


figure("Figure_name", "Ping pong Gyroscope X-Axis");plot(pingGyroQuanti(:,1));
figure("Figure_name", "Ping pong Gyroscope Y-Axis");plot(pingGyroQuanti(:,2));
figure("Figure_name", "Ping pong Gyroscope Z-Axis");plot(pingGyroQuanti(:,3));

clear ncols nrows i
