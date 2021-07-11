function [zmax,x]=mylinprog_1505041(f,A,b)

[m,n]=size(A);
D=zeros(m,m);

for i=1:m
    D(i,i)=1;
end

soln_Mat=zeros(m+1,2+n+m);

soln_Mat(1,1)=1;
soln_Mat(1,2:1+n)=f;
soln_Mat(2:1+m,2:1+n)=A;
soln_Mat(2:1+m,2+n+m)=b;
soln_Mat(2:1+m,n+2:1+n+m)=D;

hasNeg=1;

while hasNeg==1
    rowindex=0;
    colindex=0;
    fmin=9999999999999999;
    for i=2:1+n
        if soln_Mat(1,i)<fmin
            fmin=soln_Mat(1,i);
            colindex=i;
        end
    end
    
    minratio=9999999999999;
    
    for i=2:1+m
        %ratio=abs(soln_Mat(i,2+n+m)/soln_Mat(i,colindex));
        ratio=(soln_Mat(i,2+n+m)/soln_Mat(i,colindex));
        if ratio<minratio
            minratio=ratio;
            rowindex=i;
        end
    end
    
    d=soln_Mat(rowindex,colindex);
    
    for i=2:2+n+m
        soln_Mat(rowindex,i)=(soln_Mat(rowindex,i)/d);
    end
    
    for i=1:m+1
        factor=soln_Mat(i,colindex);
        
        if i~=rowindex
            
            for j=2:2+n+m
                soln_Mat(i,j)=soln_Mat(i,j)-factor*soln_Mat(rowindex,j);
            end
            
        end
        
    end
    
    hasNeg=0;
    
    for i=2:1+n
        
        if soln_Mat(1,i)<0
            hasNeg=1;
            break
        end
        
    end
    
end
zmax=soln_Mat(1,2+n+m);
x=zeros(n,1);
for j=2:n+1
    for i=2:m+1
        if soln_Mat(i,j)==1
            x(j-1,1)=soln_Mat(i,2+n+m);
        end
    end
end

end


