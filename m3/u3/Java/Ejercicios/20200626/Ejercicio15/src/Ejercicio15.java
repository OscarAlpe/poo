/*
 *
 * Ejercicio 15.- Escribe una aplicación con un String que contenga una contraseña
 * cualquiera. Después se te pedirá que introduzcas la contraseña, con 3 intentos. Cuando
 * aciertes ya no pedirá más la contraseña y mostrará un mensaje diciendo “Enhorabuena”.
 * Piensa bien en la condición de salida (3 intentos y si acierta sale, aunque le queden
 * intentos).
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio15 {
  
  public static void main(String[] args) {
    
    final String contrasena = new String("abracadabra");
    
    for (int i=1; i < 4; i++) {
      String sInput = JOptionPane.showInputDialog("Introduce la contraseña:");
      if (sInput.equals(contrasena)) {
        System.out.println("Enhorabuena");
        break;
      }
    }


  }

}
