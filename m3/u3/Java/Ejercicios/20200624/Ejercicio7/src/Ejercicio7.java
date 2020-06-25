/*
 *
 * Ejercicio 7.- Lee un número por teclado que pida el precio de un producto (puede tener
 * decimales) y calcule el precio final con IVA. El IVA será una constante que será del 21%.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio7 {
  
  public static void main(String[] args) {
    
    Double precio = new Double(0);
    
    Double IVA = new Double(21);
    
    String sPrecio = JOptionPane.showInputDialog("Precio del producto:");
    
    precio = Double.parseDouble(sPrecio);

    Double precioIVA = precio * (IVA / 100);
    
    Double precioFinal = precio + precioIVA;
    
    System.out.println("El precio final es " + precioFinal);
  }

}
