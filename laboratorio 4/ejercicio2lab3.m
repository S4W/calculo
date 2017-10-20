function [tiempoCrout, tiempoCholesky] = ejercicio2lab3()
    % EJERCICIO 2
    a = -5;
    b = 5;
    Y = (b-a).*rand(250,250) + a;
    epsilon = 1e-4;          % Epsilon : 1e-12; 1e-8; 1e-4
    B = Y*Y';                 % B = Y*Yt
    minB = min(eig(B));       % Minimo autovalor de B
    I = eye(250,250);        % Matriz identidad 250x250
    A = B + (epsilon - minB)*I;
    e = zeros(250,1);
    for i=1:1:250
        e(i,1) = (-1)^i;      %ei = (-1)^i.
    end
    b = A*e;                  % b = Ae

    tiempo1 = cputime;
    [L,U] = factorizacionLU(A);
    y = sustitucionHaciaAdelante(L,b);
    x = sustitucionHaciaAtras(U,y);
    tiempoCrout = cputime - tiempo1;

    tiempo2 = cputime;
    L = descomposicionCholesky(A);
    y = sustitucionHaciaAdelante(L,b);
    x = sustitucionHaciaAtras(L',y);
    tiempoCholesky = cputime-tiempo2;

end
