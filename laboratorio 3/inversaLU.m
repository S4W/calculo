function inversa = inversaLU(L,U)
    dimension = size(L);
    n = dimension(1);
    inversa = L;

    for i=1:n
        b=zeros(n,1);
        b(i)=1;
        y = sustitucionHaciaAdelante(L,b);
        x = sustitucionHaciaAtras(U,y);
        inversa(:, i) = x;
    end
end
