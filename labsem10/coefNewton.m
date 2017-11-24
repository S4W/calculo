function [dif,c] = coefNewton(Xs,Ys)
    n = size(Xs);
    n = n(2);

    for i = 1:1:n
        c(i) = Ys(i);
        dif(i,1) = Ys(i);
    end

    for j=2:n
        for i=1:n-j+1
            dif(i,j) = (dif(i+1,j-1)-dif(i,j-1))/(Xs(i+j-1)-Xs(i));
        end
    end


    for j = 2:1:n
        for i = n:-1:j
            c(i) = (c(i)-c(i-1))/(Xs(i)-Xs(i-j+1));
        end
    end

end
