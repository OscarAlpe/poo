/* Este codigo ha sido generado por el modulo psexport 20180802-w32 de PSeInt.
Es posible que el codigo generado no sea completamente correcto. Si encuentra
errores por favor reportelos en el foro (http://pseint.sourceforge.net). */

// En java, el nombre de un archivo fuente debe coincidir con el nombre de la clase que contiene,
// por lo que este archivo debería llamarse "SIN_TITULO.java."

import java.io.*;

public class sin_titulo {

	public static void main(String args[]) throws IOException {
		BufferedReader bufEntrada = new BufferedReader(new InputStreamReader(System.in));
		double num1;
		double num2;
		// introduzco dos numeros y me devuelve el mayor
		num1 = 0;
		num2 = 0;
		System.out.println("escribe el primer numero");
		num1 = Double.parseDouble(bufEntrada.readLine());
		System.out.println("escribe el segundo numero");
		num2 = Double.parseDouble(bufEntrada.readLine());
		if (num1>num2) {
			System.out.println(num1);
		} else {
			System.out.println(num2);
		}
	}


}

