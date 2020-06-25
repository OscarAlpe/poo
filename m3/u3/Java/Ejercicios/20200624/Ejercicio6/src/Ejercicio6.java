/*
 *
 * Ejercicio 6.- Lee un número por teclado e indica si es divisible entre 2 (resto = 0). Si no
 * lo es, también debemos indicarlo.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio6 {
  
  public static void main(String[] args) {
    
    Integer numero = new Integer(0);
    
    String sNumero = JOptionPane.showInputDialog("Número:");
    
    numero = Integer.parseInt(sNumero);
   
    if (numero % 2 == 0) {
      System.out.println(numero + " es divisible por 2");
    } else {
      System.out.println(numero + " no es divisible por 2");
    }
  }

}
