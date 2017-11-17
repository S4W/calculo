function MatrizVandermonde = matrizVandermonde(V)
    n = size(V);
    n = n(2);

    for i=1:1:n
        for j=1:1:n
            MatrizVandermonde(i,j) = V(i)^(j-1);
        end
    end
end
