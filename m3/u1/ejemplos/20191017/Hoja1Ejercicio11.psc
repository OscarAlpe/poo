Algoritmo Hoja1Ejercicio11
	// XI - Selección múltiple
	nota <- 0
	Escribir "Introduce la nota "
	Leer nota
	Si (nota >= 0) Y (nota < 3) Entonces
		Escribir "muy deficiente"
	SiNo
		Si nota >= 3 Y nota < 5 Entonces
			Escribir "suspenso"
		SiNo
			Si nota >= 5 Y nota < 6 Entonces
				Escribir "suficiente"
			SiNo
				Si nota >= 6 Y nota < 7 Entonces
					Escribir "bien"
				SiNo
					Si nota >= 7 Y nota < 9 Entonces
						Escribir "notable"
					SiNo
						Si nota >= 9 Y nota <= 10 Entonces
							Escribir "sobresaliente"
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo

