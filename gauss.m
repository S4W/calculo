%@author: Carlos Perez 13-11089
%Ultima modificacion: 10/5/2017  9:31 pm

function answer = gauss(a, b, p) %si p es igual a 1 entonces se hace con pivoteo parcial
    temp = size(b);
    n = temp(1);
    b = b'; %transponemos para trabajar con el vector
    
    for i = 1:n-1 %Con el i se va a indicar la posicion en la diagonal principal
        
        if p == 1; %si el valor que pasan a la funcion es 1, se hace con pivoteo parcial
            
            pos = i;
            max = a(i,i);
            
            for j = i+1:n  %Con este for se busca el mayor elemento de la columna (valor absoluto)
                if abs(a(j,i)) > max 
                   max = a(j,i);
                   pos = j;
                end
            end
            
            if pos ~= i %Si es encontrado una mayor que el inicial se procede a hacer el cambio
                for c = i:n
                    aux = a(i,c);
                    a(i,c) = a(pos,c);
                    a(pos,c) = aux;
                end
                
                aux = b(i);
                b(i) = b(pos);
                b(pos) = aux;
                
            end
                
        end
        
        if a(i,i) == 0 %Verificamos si el pivote es 0, en caso de serlo se procede al cambio
           for j = i+1:n %Buscamos el siguiente numero dentro de esa columna que no es 0
              if a(j,i) ~= 0
                  for c = i:n
                     aux = a(i,c);
                     a(i,c) = a(j,c);
                     a(j,c) = aux;
                  end
                  break
              end
           end
           if a(i,i) == 0 %si no se encuuentra ninguna fila que funcione, el programa termina
               a = 0
              return
           end
        end
        
        for f = i+1:n %El f representa las filas por debajo de el elemento con el que estamos trabajando de la diagonal principal
            rest = 1:1:n-i+1; %Creamos un arreglo con el tamano de la fila
            alfa = a(f,i)/a(i,i); %El alfa a multiplicar la fila de la diagonal que trabaja para hacer 0 los que estan por debajo de el
            valor = 1; %Utilizamos este valor para recorrer rest
            
            for e = i:n %Con esto encontraremos el valor de cada uno de los elementos de la fila del elemento de la diagonal principal multiplicados por el alfa
                rest(valor) = a(i,e)*alfa; %Llenamos este arreglo con la fila multiplicada por el alfa
                valor = valor + 1;
            end
            
            valor = 1; %Utilizamos este valor para recorrer rest
            
            for r = i:n %Utilizaremos este for para realizar los cambios en la matriz
                a(f,r) = a(f, r) - rest(valor);
                valor = valor + 1;
            end
            
            b(f) = b(f)-(b(i)*alfa); %Realizamos lo mismo de arriba pero en el de resultados

        end
        
    end
    
    b = b'; %transponemos el vector 
    
    answer = [a,b];