function quantized = quantization(feature,features_threshold)
    [nrows, ncols] = size(feature);
    quantized = zeros(nrows,ncols);
    quantized(feature>features_threshold | feature<-features_threshold)=1;
end 

