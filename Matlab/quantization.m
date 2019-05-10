function quantized = quantization(data,threshold)
    [nrows, ncols] = size(data);
    quantized = zeros(nrows,ncols);
    quantized(data>threshold | data<threshold)=1;
    quantized(data<threshold & data>-threshold)=0;
end 