% Rafael Cisneros, Carnet: 13-11156
% Calculo Númerico
% Septiembre-Diciembre 2017

function resultado = cosTaylor(x, n)
	resultado = 0;
	for i = 0 : 1 : n
		resultado = resultado + (((-1)^n)*(x^(2*n)) / factorial(2*n));
	end

function resultado = factorial(n)
	if n == 2 || n == 1
		resultado = n;
	elseif n > 2
		resultado = n * factorial(n-1);
	elseif n == 0
		resultado = 1
	end
echo off
