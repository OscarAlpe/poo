import javax.swing.JOptionPane;

public class Ejercicio1 {

  public static void main(String[] args) {
    Double a = new Double(0.0);
    Double b = new Double(0.0);

    String sa = JOptionPane.showInputDialog("Introduce un número:");
    a = Double.parseDouble(sa);
    
    String sb = JOptionPane.showInputDialog("Introduce otro número:");
    b = Double.parseDouble(sb);
    
    System.out.println("La suma es " + (a + b));
    System.out.println("La resta es " + (a - b));
    System.out.println("La multiplicación es " + (a * b));
    System.out.println("La división es " + (a / b));
    System.out.println("El módulo es " + (a % b));
  }
}
