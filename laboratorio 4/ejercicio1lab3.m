function [tiempoGauss, tiempoCrout] = ejercicio1lab3()

    % EJERCICIO 1
    A = zeros(1000,1000);
    b = zeros(1000,1);
    for i = 1:1:1000
        for j = 1:1:1000
            if i ~= j
                A(i,j) = min(i,j);
            elseif i == j
                A(i,j) = -500000;
            end
        end
        b(i,1) = i;
    end
    tiempo1 = cputime;
    x = eliminacionGauss(A,b);
    tiempoGauss = cputime-tiempo1;

    tiempo2 = cputime;
    [L,U] = factorizacionLU(A);
    y = sustitucionHaciaAdelante(L,b);
    x2 = sustitucionHaciaAtras(U,y);
    tiempoCrout = cputime-tiempo2;
end
