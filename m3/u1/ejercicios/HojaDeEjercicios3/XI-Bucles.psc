Algoritmo XI_Bucles
	// Pedir n�mero entero. Ese n�mero son las notas que se van a pedir para calcular la nota media.
	Dimension nota[100]
	num_notas <- 0
	suma = 0
	media = 0
	Escribir 'Introduce el n�mero de notas'
	Leer num_notas
	Para i<-1 Hasta num_notas Hacer
		Escribir 'Introduce nota ',i
		Leer nota[i-1]
		suma = suma + nota[i-1]
	FinPara
	media = suma / num_notas
	Escribir "La media es ", media
FinAlgoritmo

