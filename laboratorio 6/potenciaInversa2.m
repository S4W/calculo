function [autovalor, x] = potenciaInversa2(A,x,itmax,tol)
    [L,U] = factorizacionLU(A)
    for k=1:itmax

        z = sustitucionHaciaAdelante(L,x)
        y = sustitucionHaciaAtras(U,z)
        autovalor = phi(y)/phi(x)
        x = y/norm(y)
        if norm(x-y) < tol
            break
        end
    end
end

function phi(x)
