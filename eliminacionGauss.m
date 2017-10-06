function C = eliminacionGauss(A,b)
	dimensionA = size(A)
	n = dimensionA(1)
	C = crearMatrizExtendida(A, b)

	for k = 2 : 1 : n
		i0 = k-1
		for i = k : 1 : n
			if abs(C(i0,k-1) < abs(C(i,k-1)))
				i0 = i
			end
		end
		for j = 1 : 1 : n+1
			S = C(i0,j)
			C(i0,j) = C(k-1,j)
			C(k-1,j) = S
		end
		for i = k : 1 : n
			alpha = C(i,k-1) / C(k-1, k-1)
			for j = k : 1 : n+1
				C(i,j) = C(i,j) - alpha * C(k-1,j)
			end
		end
	end
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
