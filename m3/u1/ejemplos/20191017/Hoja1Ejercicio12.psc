Algoritmo Hoja1Ejercicio12
	// XII - Selección
	horas <- 0
	minutos <- 0
	segundos <- 0
	Escribir "Introduce hora"
	Leer horas
	Escribir "Introduce minutos"
	Leer minutos
	Escribir "Introduce segundos"
	Leer segundos
	segundos <- segundos + 1
	Si segundos > 59 Entonces
		segundos <- 0
		minutos <- minutos + 1
		Si minutos > 59 Entonces
			minutos <- 0
			horas <- horas + 1
		FinSi
	FinSi
	Escribir horas, " horas ", minutos, " minutos ", segundos, " segundos"
FinAlgoritmo

