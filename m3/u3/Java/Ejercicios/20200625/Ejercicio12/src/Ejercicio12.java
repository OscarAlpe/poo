/*
 *
 * Ejercicio 12.- Realiza una aplicación que nos pida un número de ventas a introducir,
 * después nos pedirá tantas ventas por teclado como número de ventas se hayan
 * indicado. Al final mostrara la suma de todas las ventas. Piensa que es lo que se repite y
 * lo que no.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio12 {
  
  public static void main(String[] args) {
    
    int numeroVentas, tVentas = 0;
    
    String sNumeroVentas = JOptionPane.showInputDialog("Número de ventas a introducir:");
    
    numeroVentas = Integer.parseInt(sNumeroVentas);
    
    for (int contador = 1; contador <= numeroVentas; contador++) {
      String sVenta = JOptionPane.showInputDialog("Venta " + contador + ":");
      
      tVentas += Integer.parseInt(sVenta);
    }

    System.out.println("El total de ventas es:" + tVentas);  
  }

}
