Algoritmo HojaDeEjercicios3_X_Bucles
	// Pedir 10 notas por teclado y calcular nota media
	Dimension nota[10]
	suma <- 0
	i <- 0
	media = 0
	Escribir 'Introduce nota 1'
	Leer nota[0]
	Escribir 'Introduce nota 2'
	Leer nota[1]
	Escribir 'Introduce nota 3'
	Leer nota[2]
	Escribir 'Introduce nota 4'
	Leer nota[3]
	Escribir 'Introduce nota 5'
	Leer nota[4]
	Escribir 'Introduce nota 6'
	Leer nota[5]
	Escribir 'Introduce nota 7'
	Leer nota[6]
	Escribir 'Introduce nota 8'
	Leer nota[7]
	Escribir 'Introduce nota 9'
	Leer nota[8]
	Escribir 'Introduce nota 10'
	Leer nota[9]
	Mientras i<10 Hacer
		suma <- suma+nota[i]
		i <- i+1
	FinMientras
	media = suma/10
	Escribir 'La media es ',media
FinAlgoritmo

