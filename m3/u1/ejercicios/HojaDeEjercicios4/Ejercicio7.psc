Algoritmo HojaDeEjercicios4_Ejercicio7
	// Cálculo de los salarios mensuales. Si horas > 40, hora extraordinaria * 1.5
	horas = 0
	precioHora = 0
	nombre = ""
	salario = 0
	masDatos = ""
	
	mientras masDatos <> "n"
		Escribir "Introduzca horas "
		Leer horas
		Escribir "Introduzca precio hora "
		Leer precioHora
		Escribir "Introduzca nombre "
		Leer nombre
		
		si horas <= 40
			salario = horas * precioHora
		SiNo
			salario = (40 * precioHora) + (1.5 * precioHora * (horas - 40))
		FinSi
		
		Escribir "Salario ", salario
		
		Escribir "Mas datos? (s/n) "
		Leer masDatos
	FinMientras
FinAlgoritmo
