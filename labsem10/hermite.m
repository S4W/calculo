function Q = hermite(Xs,Ys, Ds)
    n = size(Xs);
    n = n(2);

    for i = 1:1:n
        z(2*i) = Xs(i);
        z(2*i+1) = Xs(i);
        Q(2*i,0) = Ys(i);
        Q(2*i+1,0) = Ys(i);
        Q(2*i+1,1) = Ds(i);

        if i != 1
            Q(2*i,0) = (Q(2*i,0)-Q(2*i-1,0))/(z(2*i) - z(2*i-1))
        end
    end

    for i = 3:1:2*n+1
        for j = 2:1:i
            Q(i,j) = (Q(i,j)-Q(i-1,j-1))/(z(i)-z(i-j))
        end
    end
end
