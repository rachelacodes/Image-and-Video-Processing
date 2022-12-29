function [ J ] = GrayThreshold( J, I,seed )


[M,N] = size(I);

count=1;
threshold=0.15;
while count>0
    count=0;
    for i=1:M 
    for j=1:N
        if J(i,j)==1 
        if (i-1)>1 & (i+1)<M & (j-1)>1 & (j+1)<N 
            for u=-1:1 
            for v=-1:1
                if J(i+u,j+v)==0 & abs(I(i+u,j+v)-seed)<=threshold
                    J(i+u,j+v)=1;
                    count=count+1;  
                end
            end
            end
        end
        end
    end
    end
end

end

