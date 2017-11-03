function x = sustitucionHaciaAdelante(L,b)
    dimensionL = size(L);
    n = dimensionL(1);

    for i=1:1:n
        sum=0.;
        for j=i-1:-1:1
            sum = sum + L(i,j)*x(j);
        end
        x(i) = (b(i) - sum) / L(i,i);
    end
end
