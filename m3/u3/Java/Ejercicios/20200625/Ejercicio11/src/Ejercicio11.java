/*
 *
 * Ejercicio 11.- Muestra los números del 1 al 100 (ambos incluidos) divisibles entre 2 y 3.
 * Utiliza el bucle que desees.
 *
 */

public class Ejercicio11 {
  
  public static void main(String[] args) {
    
    for (int contador = 1; contador <= 100; contador++) {
      if ( (contador % 2 == 0) || (contador % 3 == 0) ) {
        System.out.print(contador + ", ");
      }
    }

    System.out.println();
    
  }

}
