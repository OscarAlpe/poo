/*
 *
 * Ejercicio 9.- Muestra los números del 1 al 100 (ambos incluidos). Usa un bucle while.
 *
 */

public class Ejercicio9 {
  
  public static void main(String[] args) {
    
    int contador = 0;
    
    while (contador++ < 99) {
      System.out.print(contador + ", ");
    }
    
    System.out.println(contador);
  }

}
