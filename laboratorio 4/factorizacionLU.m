function [L,U] = factorizacionLU(A)
    dimensionA = size(A);
    n = dimensionA(1);

    for k=2:1:n
        for i=k:1:n
            A(i,k-1) = A(i,k-1) / A(k-1,k-1);
            for j=k:1:n
                A(i,j) = A(i,j)- A(i,k-1) * A(k-1,j);
            end
        end
    end

    for i=1:1:n
        for j=1:1:n
            if i < j
               U(i,j) = A(i,j);
            elseif i >= j
                L(i,j) = A(i,j);
                if i==j
                  U(i,j) = 1;
                end
            end
        end
    end
end
