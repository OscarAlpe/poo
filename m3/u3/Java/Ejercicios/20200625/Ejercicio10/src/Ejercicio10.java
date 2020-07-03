/*
 *
 * Ejercicio 10.- Haz el mismo ejercicio anterior con un bucle for.
 *
 */

public class Ejercicio10 {
  
  public static void main(String[] args) {
    
    for (int contador = 1; contador <= 100; contador++) {
      if (contador == 100) {
        System.out.println(contador);
      } else {
        System.out.print(contador + ", ");
      }
    }
    
  }

}
