function autovalor = potenciaSimple2(A,x,itmax,tol)
    for k=1 : itmax
        y = x;
        x = A*x;
        if norm(x,2) == 0
            break
        end
        x =  x/norm(x,2);

        if norm(y-x,2) < tol
            autovalor = dot(A*x,x);
    end
end
