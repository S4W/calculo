function inv = calcularInversaLU(lu)
    [n,~]=size(lu);
    l = tril(lu, -1) + eye(n, n);
    u = triu(lu);
    inv = zeros(n, n);
    
    for i=1:n
        b = zeros(n,1);
        for j=1:n
            if j == i
                b(j) = 1;
            else
                b(j) = 0;
            end
        end
        
        
        % Sustitucion regresiva
        z = zeros(n,1);
        z(1) = b(1)/l(1,1);
        for k=2:n
            sum = 0;
            for j=1:k-1
                sum = sum + l(k,j)*z(j);
            end
            z(k) = (b(k)- sum)/l(k,k);
        end
        
        % Sustitucion progresiva
        x = zeros(n,1);
        x(n) = z(n)/u(n,n);
        for k=n-1:-1:1
            sum = 0;
            for j=k+1:n
                sum = sum + u(k,j)*x(j);
            end
            x(k) = (z(k) - sum) / u(k,k);
        end
        
       inv(:,i) = x;
    end