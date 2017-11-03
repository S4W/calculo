function [iter, vector, eigvalue] = powermethod(matrix, vector, maxiter, epsilon)
    lastvector = vector;
    tempvector = matrix * vector;
    eigvalue = tempvector(2) / vector(2);
    vector = tempvector / norm(tempvector, 'inf');
    iter = 1;
    
    for iter = 2 : maxiter
        if norm((lastvector - tempvector)/ norm(tempvector,'inf'), 'inf') < epsilon
            break
        end
        lastvector = vector;
        tempvector = matrix * vector;
        eigvalue = tempvector(2) / vector(2);
        vector = tempvector / norm(tempvector, 'inf');
    end