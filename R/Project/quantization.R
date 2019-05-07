#Quantification

# s1=150;
# pingquantix = pingpongGyr[1];
# nrow(pingquantix);
# 
# for (i in 1:nrow(pingquantix)){
#   if (pingquantix[i,1] > s2){
#     pingquantix[i,1]=1;
#   }
#   else if (pingquantix[i,1] > s1 && pingquantix[i,1]< s2){
#     pingquantix[i,1]=0.5;
#   }
#   else if (pingquantix[i,1] < -s2){
#     pingquantix[i,1]=-1;
#   }
#   else if (pingquantix[i,1] > -s2 && pingquantix[i,1]< -s1){
#     pingquantix[i,1]=-0.5;
#   }
#   else
#     pingquantix[i,1]=0;
# }
#   
quantization <- function (data,threshold){
  if (nrow(data)%%2 == 1){
    nrows = floor(nrow(data/2)+1);
  }
  else{
    nrows = nrow(data)/2;
  }
  mat = matrix(0,nrow = nrows,ncol=ncol(data));
  mat[data>threshold]=1;
  mat[data<-threshold]=-1;
  mat[data<threshold && data>-threshold]=0;
  # for(i in 1:nrows){
  #   if (data[i,]>threshold){
  #     mat[i,]=1;
  #   }
  #   else if (data[i,]<-threshold){
  #     mat[i,]=-1;
  #   }
  #   else{
  #     mat[i,]=0;
  #   }
  # }
  return(mat);
}

threshold = 150
pingpongAcc[3018:3926,]
quantiPingPongQuantGyro = quantization(pingpongGyr,threshold)
quantiPingPongQuantGyro= quantiPingPongQuantGyro[3018:3926,]
quantiPingPongQuantGyro
plot(quantiPingPongQuantGyro)
# plot(quantiPingPongAccGyro)
