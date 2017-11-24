function r = metodoHorner(coef, x)
    n = length(coef);
    r = coef(1);
    
    for i = 2:n
        r = r * x + coef(i);
    end
end

    
    