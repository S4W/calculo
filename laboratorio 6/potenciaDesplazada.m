% Autovalor aproximado
function [autovalor,Error,n] = potenciaDesplazada(A)
    z = ones(length(A),1);
    w = zeros(length(A),1);
    n = 0;
    I = eye(length(A));
    while norm(z-w)>1e-14
        n = n+1;
        w = z;
        a = 1.5;

        % A-a*I
        [L,U] = factorizacionLU(A-a*I);
        y = sustitucionHaciaAdelante(L,w);
        z = sustitucionHaciaAtras(U,y);
        z = z';
        for i=1:1:length(A)
            if abs(z(i)) == max(abs(z))
                break
            end
        end
        z = z/z(i);
    end
    autovalor = (z'*A*z)/(z'*z);
    Error = norm(A*z-autovalor*z);
end
