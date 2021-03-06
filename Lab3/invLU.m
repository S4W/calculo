function result = invLU(L, U)
    [h, l] = size(L);
    result = L;
    for i = 1 : h
        Lcol = L;
        Lcol(i, l+1) = 1;
        
        Z = sustAtras(Lcol);
        Ucol = [U,Z];
        
        X = sustAdelante(Ucol);
        result(:, i) = X;
    end
        
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