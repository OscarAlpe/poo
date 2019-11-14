Algoritmo HojaDeEjercicios4_Ejercicio11
	// Resolución de ecuación cuadrática ax2 +bx + c = 0
	Escribir 'Introduzca los valores de parámetros a,b,c'
	Leer a,b,c
	d = b ^ 2 - 4 * a * c
	e = 2 * a
	si d = 0 
		Mostrar "x1 = x2 = ", -b/e
	SiNo
		Si d > 0
			Mostrar "x1 = ", (-b+RC(d))/e
			Mostrar "x2 = ", (-b-RC(d))/e
		SiNo
			Mostrar "x1 = ", -b/d,"+",RC(-d)/e,"i"
			Mostrar "x2 = ", -b/d,"-",RC(-d)/e,"i"
		FinSi
	FinSi
FinAlgoritmo

