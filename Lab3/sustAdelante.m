function result = sustAdelante(M)
    [h, l] = size(M);
    for i = h : -1 : 1
        for j = l-1 : -1: i
            if j > i
                M(i,l) = M(i,l) - M(i,j);
            else
                M(i,l) = M(i,l) / M(i,j);
            end
        end
        
        if i > 1
            for k = i: -1: 1
                M(k,i) = M(k,i) * M(i,l);
            end
        end
    end
    
    result = M(:, l);