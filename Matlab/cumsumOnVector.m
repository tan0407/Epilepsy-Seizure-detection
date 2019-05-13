function [C, isCrisis] = cumsumOnVector(X,TS,w)
    %X is a vector
    n = size(X);
    S=0;
    C=zeros(n);
    isCrisis=0;
    for i=1:n
        S= max (0,S+X(i)-w);
        C(i)=S;
        if S>TS
            isCrisis= 1;
            break
        end    
    end  
end

