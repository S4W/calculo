function [ML, MU] = descLU(M)
    [h, l] = size(M);
    for k = 2 : h
        for i = k : h
            M(i, k-1) = M(i, k-1) / M(k-1,k-1);
            for j = k : h
                M(i,j) = M(i,j) - M(i, k-1) * M(k-1, j);
            end
        end
    end
    
    ML = M;
    MU = M;
    
    for i = 1: h
        for j = 1: h
            if j > i
                MU(i,j) = M(i,j);
                ML(i,j) = 0;
            else
                if j == i
                    ML(i,j) = 1;
                    MU(i,j) = M(i,j);
                else
                    ML(i,j) = M(i, j);
                    MU(i,j) = 0;
                end
            end
        end
    end
                
                