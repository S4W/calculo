function  Q = metodoNeville(x,Xs, Ys)
    n = size(Ys)
    n = n(2)

    for i = 1:1:n
        Q(i,1)= Ys(i)
    end

    for i = 1:1:n
        for j=1:1:i
            Q(i,j) = ((x-Xs(i-j))*Q(i,j-1))-((x-Xs(i))*Q(i-1,j-1))/(Xs(i)-Xs(i-j))
        end
    end
end
