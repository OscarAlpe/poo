Algoritmo HojaDeEjercicios4_Ejercicio3
	// Escribe porcentaje descontado en una compra, introduciendo por teclado el precio de la tarifa y el precio pagado
	Tarifa <- 0
	Precio <- 0
	Dto <- 0
	Pd <- 0
	Escribir "Introduce tarifa:"
	Leer Tarifa
	Escribir "Introduce precio:"
	Leer Precio
	Dto=Tarifa-Precio
	Pd=Dto*100/Tarifa
	Escribir "Porcentaje de descuento:", Pd
FinAlgoritmo

