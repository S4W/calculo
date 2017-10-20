function x = rescrout(M,b)
    [L,U] = croutlu(M);
    
    y = sustAdelante([U,b]);
    x = sustAtras([L,y]);
 