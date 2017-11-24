function coefNewton = coefNewton(Xs,Ys)
    n = size(Xs);
    n = n(2);

    for i = 1:1:n
        c(i) = Ys(i)
        dif(i,1) = Ys(i)
    end



    for j = 2:1:n
        for i = n:-1:j
            c(i) = (c(i)-c(i-1))/(x(u)-x(i-j+1))
        end
    end

end
