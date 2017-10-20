function x = reschol(M,b)
    L = descCholesky(M);
    Lt = transpose(L);
    
    y = sustAdelante([Lt,b]);
    x = sustAtras([L,y]);