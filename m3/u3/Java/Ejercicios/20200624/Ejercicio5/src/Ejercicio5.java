/*
 *
 * Ejercicio 5.- Haz una aplicación que calcule el área de un círculo(pi*R2). El radio se pedirá
 * por teclado (recuerda pasar de String a double con Double.parseDouble). Usa la
 * constante PI y el método pow de Math.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio5 {
  
  public static void main(String[] args) {
    
    Double radio = new Double(0);
    Double area = new Double(0);
    
    String sRadio = JOptionPane.showInputDialog("Radio:");
    
    radio = Double  .parseDouble(sRadio);
    
    area = Math.PI * 2 * radio;
    
    System.out.println("El area es " + area);
  }

}
