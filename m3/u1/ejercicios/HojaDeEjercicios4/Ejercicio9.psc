Algoritmo HojaDeEjercicios4_Ejercicio9
	// Suma todos números leídos mientras no sean negativos
	suma=0
	numero=0
	
	Mientras numero >= 0
		Escribir "Introduce número"
		Leer numero
		
		Si numero > 0
			suma = suma + numero
		FinSi
	FinMientras
	
	Escribir "La suma es:", suma
FinAlgoritmo
