function [quantized] = quantization(data,threshold)
    [nrows,ncols] = size(data);  
    quantized = zeros(nrows,ncols);
    
    quantized(data>threshold | data<threshold)=1;
    quantized(data<threshold & data>-threshold)=0;

endfunction

function[]=frameDetection(data,frameLength)
    i = 0; //if freq = 200 Hz , 1 val/5ms   -> 1000 = 5s
    nbframesTooHigh = 0; //nb conscutif de frames qui depassent le seuil
    curr = data(i,i+1000);
//    prev = data(i-1000,i);

    //Peakdetection on frame 
    //if npeaks > threshold , nbframesTooHigh ++
    //else nbframesTooHigh = 0
    //
endfunction

function[peaks] = peakdetectionOnQuantized(data)
    [r c] =size(data);
    peaks = [];
    for i=1:c
        peaks=[peaks,find(data(:,i)==1)'];
    end;
endfunction
