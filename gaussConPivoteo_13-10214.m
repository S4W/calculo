function f = gaussConPivoteo(A, b)
    MatExt = [A, b];
    [n, ~] = size(A);
    for k = 1:n-1
        i0 = k;
        for i = k+1:n
            if abs(MatExt(i0, k)) < abs(MatExt(i, k))
                i0 = i;
            end
        end
        
        for j = 1:n+1
            s = MatExt(i0, j);
            MatExt(i0, j) = MatExt(k, j);
            MatExt(k, j) = s;
        end
        
        %Si el pivote es cero, cambiamos filas
        if MatExt(i, i) == 0
            for j = i+1:n 
                if MatExt(j,i) ~= 0
                    for c = i:n
                        aux = MatExt(i,c);
                        MatExt(i,c) = MatExt(j,c);
                        MatExt(j,c) = aux;
                    end
                    break
                end
            end
        end
        
        %Si el pivote sigue siendo 0, el Sistema no tiene solucion.
        if MatExt(i, i) == 0
            break
        end
        
        for i = k+1:n
            alpha = MatExt(i, k) / MatExt(k, k);
            
            for j = k:n+1
                MatExt(i, j) = MatExt(i, j) - alpha*MatExt(k, j);
            end
        end
    end
    
    f = MatExt;

        
