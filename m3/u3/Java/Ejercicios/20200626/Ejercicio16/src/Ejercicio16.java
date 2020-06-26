/*
 *
 * Ejercicio 16.- Crea una aplicación que nos pida un día de la semana y que nos diga si es
 * un día laboral o no. Si el día no se reconoce, mostrar el mensaje “Día incorrecto”. Usa
 * un switch para ello.
 *
 */

import javax.swing.JOptionPane;

public class Ejercicio16 {

  public static void main(String[] args) {

    String sInput = JOptionPane.showInputDialog("Introduce día:");

    switch(sInput) {
      case "Lunes":
      case "Martes":
      case "Miercoles":
      case "Jueves":
      case "Viernes":
        System.out.println("Día laborable");
        break;
      case "Sabado":
      case "Domingo":
        System.out.println("Día festivo");
        break;
      default:
        System.out.println("Día incorrecto");
        break;
    }

  }

}
