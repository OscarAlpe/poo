Algoritmo HojaDeEjercicios4_Ejercicio8
	// Dados 3 números, determinar si la suma de cualquier pareja es igual al tercer número.
	A=0
	B=0
	C=0
	
	Escribir "Introduce A,B,C"
	Leer A, B, C
	
	si a+b=c
		Escribir "Iguales"
	SiNo
		si a+c=b
			Escribir "Iguales"
		SiNo
			si B+C=A
				Escribir "Iguales"
			SiNo
				Escribir "Distintas"
			FinSi
		FinSi
	FinSi
	
FinAlgoritmo
