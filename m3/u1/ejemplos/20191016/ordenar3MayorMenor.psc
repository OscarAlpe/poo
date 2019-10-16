Algoritmo ordenar3MayorMenor
	// introduzco tres números y los muestro ordenados ascendentemente
	num1 <- 0
	num2 <- 0
	num3 <- 0
	Dimension salida[3]
	indice <- 3
	ordenado <- Falso
	cambio <- Falso
	Escribir 'escribe el primer numero'
	Leer num1
	Escribir 'escribe el segundo numero'
	Leer num2
	Escribir 'escribe el tercer numero'
	Leer num3
	salida[1] <- num1
	salida[2] <- num2
	salida[3] <- num3
	Mientras (!ordenado) Hacer
		Si salida[indice]>salida[indice-1] Entonces
			temporal <- salida[indice-1]
			salida[indice-1]<-salida[indice]
			salida[indice] <- temporal
			cambio <- Verdadero
		FinSi
		indice <- indice-1
		Si indice<2 Entonces
			Si cambio=Falso Entonces
				ordenado <- Verdadero
			SiNo
				indice <- 3
				cambio <- Falso
			FinSi
		FinSi
	FinMientras
	Escribir 'Los números ordenados de mayor a menor son ',salida[1],', ',salida[2],', ',salida[3]
FinAlgoritmo

