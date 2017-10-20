function l = descCholesky(A)
    [n, ~] = size(A);
    l = zeros(n,n);
    for k = 1:n
        sum = 0;
        for s = 1:k-1
            sum = sum + l(k,s)*l(k,s);
        end
        l(k,k) = sqrt(A(k,k) - sum);
        
        for i = k+1:n
            sum = 0;
            for s = 1:k-1
                sum = sum + l(i,s)*l(k,s);
            end
            l(i, k) = (A(i,k) - sum) / l(k,k);
        end
    end