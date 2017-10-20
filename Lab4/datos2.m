function [B, A, mineig, e, b] = datos2(epsilon)
    Y = rand(250)*10 - 5;
    B = Y * transpose(Y);
    mineig = min(eig(B));
    A = B + (epsilon - mineig) * eye(250);
    e = zeros(250,1);
    for i = 1:250
        e(i,1) = (-1)^i;
    end
    b = A*e;
    