function resultado = sinPivoteo(M, b)
    pivote = [0,0];
    
    MatrizExt = [M, b];
    [h, l] = size(MatrizExt);
    for j = 1 : 1 : l-2
        pivote = [pivote(1) + 1, pivote(2) + 1];
        pival = MatrizExt(pivote(1), pivote(2));
        for k = pivote(1) + 1 : 1 : h
            alpha = -(MatrizExt(k, pivote(2))/pival);
            MatrizExt(k, pivote(2)) = 0;
            for m = pivote(2) + 1 : 1 : l
                MatrizExt(k,m)= MatrizExt(pivote(1),m)*alpha+MatrizExt(k,m);
            end
        end
    end
    resultado = MatrizExt;