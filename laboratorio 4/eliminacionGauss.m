% Rafael Cisneros
% 13-11156
% C.I: 24.759.502
function x = eliminacionGauss(A,b)
    [n,m] = size(A);
    C = eliminacionGaussSinPivoteo(A,b);
    U = C(:,1:n);
    b = C(:,n+1);
    x = sustitucionHaciaAtras(U,b);
end

function C = eliminacionGaussSinPivoteo(A,b)
    dimensionA = size(A);
    n = dimensionA(1);
    C = [A, b];

    for k = 1 : 1 : n-1

        if C(k,k) == 0
            i0 = k;
            for i = k+1 : 1 : n
                if abs(C(i0,k)) < abs(C(i,k))
                    i0 = i;
                end
            end
            for j = k : 1 : n
                S = C(i0,j);
                C(i0,j) = C(k,j);
                C(k,j) = S;
            end

            S = C(i0,n+1);
            C(i0,n+1) = C(k,n+1);
            C(k,n+1) = S;
        end

        for i = k+1 : 1 : n
            alpha = C(i,k) / C(k, k);
            for j = k : 1 : n
                C(i,j) = C(i,j) - alpha * C(k,j);
            end
            C(i,n+1) = C(i,n+1) - alpha * C(k,n+1);
        end
    end
end

function x = sustitucionHaciaAtras(U,b)
    dimensionU = size(U);
    n = dimensionU(1);

    for i=n:-1:1
        sum=0.;
        for j=i+1:n
            sum = sum + U(i,j)*x(j);
        end
        x(i) = (b(i) - sum) / U(i,i);
    end
end
