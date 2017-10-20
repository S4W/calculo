% Rafael Cisneros
% 13-11156
% C.I: 24.759.502
function C = eliminacionGauss(A,b, pivoteo)
	if pivoteo == 0
		C = eliminacionGaussSinPivoteo(A,b)
	else
		C = eliminacionGaussConPivoteo(A,b)
	end
	
function C = eliminacionGaussSinPivoteo(A,b)
	dimensionA = size(A)
	n = dimensionA(1)
	C = crearMatrizExtendida(A, b)

	for k = 1 : 1 : n-1

		if C(k,k) == 0
			i0 = k
			for i = k+1 : 1 : n
				if abs(C(i0,k)) < abs(C(i,k))
					i0 = i
				end
			end
			for j = k : 1 : n
				S = C(i0,j)
				C(i0,j) = C(k,j)
				C(k,j) = S
			end

			S = C(i0,n+1)
			C(i0,n+1) = C(k,n+1)
			C(k,n+1) = S
		end
		
		for i = k+1 : 1 : n
			alpha = C(i,k) / C(k, k)
			for j = k : 1 : n
				C(i,j) = C(i,j) - alpha * C(k,j)
			end
			C(i,n+1) = C(i,n+1) - alpha * C(k,n+1)
		end
	end


function C = eliminacionGaussConPivoteo(A,b)
	dimensionA = size(A)
	n = dimensionA(1)
	C = crearMatrizExtendida(A, b)

	for k = 1 : 1 : n-1
		i0 = k
		for i = k+1 : 1 : n
			if abs(C(i0,k)) < abs(C(i,k))
				i0 = i
			end
		end
		for j = k : 1 : n
			S = C(i0,j)
			C(i0,j) = C(k,j)
			C(k,j) = S
		end

		S = C(i0,n+1)
		C(i0,n+1) = C(k,n+1)
		C(k,n+1) = S
		
		for i = k+1 : 1 : n
			alpha = C(i,k) / C(k, k)
			for j = k : 1 : n
				C(i,j) = C(i,j) - alpha * C(k,j)
			end
			C(i,n+1) = C(i,n+1) - alpha * C(k,n+1)
		end
	end


% Funcion que crea la matriz extendida a partir del vector b y la matriz A
function matrizExtendida = crearMatrizExtendida(A, b)
	dimensionA = size(A)

	for i = 1: 1 : dimensionA(1)
		for j = 1 : 1 : dimensionA(1)
			matrizExtendida(i,j) = A(i,j)
		end
	end
	
	for i = 1: 1 : dimensionA(1)
		matrizExtendida(i, dimensionA(1)+1) = b(i)
	end
	echo off
