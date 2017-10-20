function [L,u] = croutlu(A)
[n,m]=size(A);

for k=1:n
    u(k,k)=1;
    suma=0;
    for p=1:k-1
        suma=suma+L(k,p)*u(p,k);
    end
    L(k,k)=(A(k,k)-suma);

    for i=k+1:n
        suma=0;
        for r=1:k-1
            suma=suma+L(i,r)*u(r,k);
        end
    L(i,k)=(A(i,k)-suma);
    end
    
    for j=k+1:n
        suma=0;
    for s=1:k-1
        suma=suma+L(k,s)*u(s,j);
    end
        u(k,j)=(A(k,j)-suma)/L(k,k);
    end
end