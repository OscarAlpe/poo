/*
 *
 * Ejercicio 13.- Realiza una aplicación que nos calcule una ecuación de segundo grado.
 * Debes pedir las variables a, b y c por teclado y comprobar antes que el discriminante
 * (operación en la raíz cuadrada). Para la raíz cuadrada usa el método sqlrt de Math. Te
 * recomiendo que uses mensajes de traza.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio13 {
  
  public static void main(String[] args) {
    
    double a, b, c, x;
    
    String sA = JOptionPane.showInputDialog("Introduce a:");
    a = Double.parseDouble(sA);
    
    String sB = JOptionPane.showInputDialog("Introduce b:");
    b = Double.parseDouble(sB);

    String sC = JOptionPane.showInputDialog("Introduce a:");
    c = Double.parseDouble(sC);

    x = (-b + Math.sqrt((b*b)-(4*a*c))) / 2*a;

    System.out.println("El resultado es:" + x);
  }

}
