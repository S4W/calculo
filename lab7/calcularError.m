function [P, E] = calcularError(x, y, a, grado)
    n = grado + 1;
    m = length(x);
    P = zeros(m,1);
    
    for i = 0:m-1
        for j = 0:n-1
            P(i+1) = P(i+1) + a(j+1) * x(i+1)^j;
        end
    end
    
    E = 0;
    for i = 1:n
        E = E + (y(i)-P(i))^2;
    end
end
