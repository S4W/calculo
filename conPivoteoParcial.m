function resultado = conPivoteoParcial(M, b)
    pivote = [0,0];
    MatrizExt = [M, b];
    [h, l] = size(MatrizExt);
    
    for j = 1 : 1 : l-2
        mayor = 0;
        filam = j;
        
        for camb = j:h
            if mayor < abs(MatrizExt(camb, j))
                mayor = abs(MatrizExt(camb, j));
                filam = camb;
            end
        end
        
        if mayor ==0
            break
            
        else
            if filam ~= j
                for s = 1: l
                    aux=MatrizExt(j,s);
                    MatrizExt(j,s)=MatrizExt(filam,s);
                    MatrizExt(filam,s)=aux;
                end
            end
        end
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
        
                