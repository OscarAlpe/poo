Algoritmo Hoja1Ejercicio6
	// VI - Selección simple
	num1 <- 0
	num2 <- 0
	num3 <- 0
	salida <- 0
	Escribir "Introduce número 1"
	Leer num1
	Escribir "Introduce número 2"
	Leer num2
	Escribir "Introduce número 3"
	Leer num3
	salida <- num3
	Si num1 < num2 Entonces
		Si num1 < num3 Entonces
			salida <- num1
		FinSi
	SiNo
		Si num2 < num3 Entonces
			salida <- num2
		FinSi
	FinSi
	Escribir salida
FinAlgoritmo

