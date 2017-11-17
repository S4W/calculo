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
