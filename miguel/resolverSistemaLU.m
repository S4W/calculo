function r = resolverSistemaLU(lu, b)
    [n, ~] = size(lu);
    x(1) = b(1);
    for i=2:n
        sum = 0;
        for j=1:i-1
            sum = sum + lu(i,j)*x(j);
        end
        x(i) = b(i)- sum;
    end
    
    x(n) = x(n)/lu(n,n);
    for i=n-1:-1:1
        sum = 0;
        for j=i+1:n
            sum = sum + lu(i,j)*x(j);
        end
        x(i) = (x(i) - sum) / lu(i,i);
    end
    r = x';