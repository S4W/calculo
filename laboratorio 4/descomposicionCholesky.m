function L = descomposicionCholesky(A)
    [n,m] = size(A);
    for k = 1 : 1 : n
        sum = 0;
        for s = 1: 1: k-1
            sum = sum + L(k,s)^2;
        end
        L(k,k) = sqrt(A(k,k) - sum);
        for i = k+1 : 1 : n
            sum = 0;
            for s = 1: 1: k-1
                sum = sum + (L(i,s)*L(k,s));
            end
            L(i,k) = (A(i,k) - sum) / L(k,k);
        end
    end

end
