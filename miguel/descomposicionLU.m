function f = descomposicionLU(A)
    [n, ~] = size(A);
    
    for k = 2:n
        for i = k:n
            A(i, k-1) = A(i, k-1)/ A(k-1, k-1);
            for j = k:n
                A(i,j) = A(i,j)- A(i, k-1)*A(k-1,j);
            end
        end
    end
    
    f = A;

