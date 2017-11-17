function r = minimosCuadrados(x, y, grado)
    n = length(x);
    sum_x = zeros(n,1);
    sum_xy = zeros(n, 1);
    for i = 0:n-1
       for j = 1:n
            sum_x(i+1) = sum_x(i+1) + x(j)^i;
            sum_xy(i+1) = sum_xy(i+1) + y(j)*(x(j)^i);
       end
    end
   
    A = zeros(grado+1, grado+1);
    for i = 1:grado+1
        A(:, i) = sum_x(i:grado+i);
    end
    
    [l, u] = descomposicionCrout(A);
    z = sustitucionHaciaAdelante(l,sum_xy(1:grado+1));
    r = sustitucionHaciaAtras(u,z)';
    
end
    
        
            