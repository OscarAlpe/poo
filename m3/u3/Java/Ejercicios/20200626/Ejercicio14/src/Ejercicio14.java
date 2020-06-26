/*
 *
 * Ejercicio 14.- Lee un número por teclado y comprueba que este número es mayor o igual
 * que cero, si no lo es lo volverá a pedir (do while), después muestra ese número por
 * consola.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio14 {
  
  public static void main(String[] args) {
    
    double numero;
    
    do {
      String sNumero = JOptionPane.showInputDialog("Introduce a:");
      numero = Double.parseDouble(sNumero);
    } while (numero < 0);

    System.out.println("El numero es:" + numero);
  }

}
