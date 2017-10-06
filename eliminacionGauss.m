function x = eliminacionGauss(A,b)
	matrizExtendida = crearMatrizExtendida(A, b)
	x = matrizExtendida

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
