function y = calcularTiempo(P, y)
    n = length(P);
    x = 0;
    for i = 0:n-1
        x = x + 1/(P(i+1) * log(y)/log(i+1));
    end
end
