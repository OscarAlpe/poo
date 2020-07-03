package ejercicio3;

import javax.swing.JOptionPane;

/**
 *
 * @author Oscar
 */
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String sTamano = JOptionPane.showInputDialog("Tamaño array:");
        int tamano = Integer.parseInt(sTamano);
        
        String sLongitud = JOptionPane.showInputDialog("Longitud passwords:");
        int longitud = Integer.parseInt(sLongitud);

        Password arrayPasswords[] = new Password[tamano];
        boolean arrayFuerte[] = new boolean[tamano];
        
        for (int i=0; i < arrayPasswords.length; i++) {
            arrayPasswords[i] = new Password(longitud);
            arrayFuerte[i] = arrayPasswords[i].esFuerte();
            System.out.println(arrayPasswords[i].getContrasena() + " " + arrayFuerte[i]);
        }
    }
    
}
