function result = sustAtras(M)
    [h,l] = size(M);
    for i = 1 : h
        for j = 1 : i
            if j < i
                M(i,l) = M(i,l) - M(i,j);
            else
                M(i,l) = M(i,l) / M(i,j);
            end
        end
    
        if i < h
            for k = i : h
                M(k,i) = M(k,i) * M(i,l);
            end
        end
    end
    
    result = M(:, l);