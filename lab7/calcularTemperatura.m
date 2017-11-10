function y = calcularTemperatura(P, x)
    n = length(P);
    y = 0;
    for i = 0:n-1
        y = y + P(i+1) * x^i;
    end
end
