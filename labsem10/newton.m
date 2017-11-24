function [divmatrix, newtonres] = newton(x,fx,point)
    n = length(x);
    a = zeros(n,1);
    a(1) = fx(1);
    divmatrix = zeros(n-1,n-1);
    
    for k = 1 : n - 1
       divmatrix(k, 1) = (fx(k+1) - fx(k))/(x(k+1) - x(k));
    end
    
    for j = 2 : n - 1
       for k = 1 : n - j
          divmatrix(k, j) = (divmatrix(k+1, j - 1) - divmatrix(k, j - 1))/(x(k+j) - x(k));
       end
    end
    
    for j = 2 : n
       a(j) = divmatrix(1, j-1);
    end
    
    Df = zeros(n,1);
    c = zeros(n,1);
    
    Df(1) = 1;
    c(1) = a(1);
    
    for j = 2 : n
       Df(j)=(point - x(j-1)) .* Df(j-1);
       c(j) = a(j) .* Df(j);
    end
    
    newtonres = sum(c);
    