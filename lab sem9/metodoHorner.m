function p = metodoHorner(coef, pto)
    n = size(coef)
    n = n(2)

    p = coef(n)
    for i=n-1:-1:1
        p = p * pto + coef(i)
    end
end
