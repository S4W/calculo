function [M,b] = megamatrix(s)
    M = zeros(s,s);
    
    for i = 1 : s
        for j = 1 : s
            if i == j
                M(i,j) = -500000;
            else
                M(i,j) = min(i,j);
            end
        end
    end
    
    b = zeros(s,1);
    count = 1;
    for i = 1: s
        b(i, 1) = count;
        count = count + 1;
    end