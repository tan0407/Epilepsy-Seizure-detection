#Quantification

s1=150;
s2=460;
pingquantix = pingpongGyr[1];
nrow(pingquantix);

for (i in 1:nrow(pingquantix)){
  if (pingquantix[i,1] > s2){
    pingquantix[i,1]=1;
  }
  else if (pingquantix[i,1] > s1 && pingquantix[i,1]< s2){
    pingquantix[i,1]=0.5;
  }
  else if (pingquantix[i,1] < -s2){
    pingquantix[i,1]=-1;
  }
  else if (pingquantix[i,1] > -s2 && pingquantix[i,1]< -s1){
    pingquantix[i,1]=-0.5;
  }
  else
    pingquantix[i,1]=0;
}
  
