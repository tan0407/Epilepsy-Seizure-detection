threshold = 150;
pingGyroQuanti = quantization(PingGyro);


scf(0);clf(0);plot(pingGyroQuanti(:,1));
scf(1);clf(1);plot(pingGyroQuanti(:,2));
scf(2);clf(2);plot(pingGyroQuanti(:,3));

clear ncols nrows i
