import javax.swing.JOptionPane;

public class Ejercicio2 {

  public static void main(String[] args) {
    Double a = new Double(0.0);
    Double b = new Double(0.0);

    String sa = JOptionPane.showInputDialog("Introduce número a:");
    a = Double.parseDouble(sa);
    
    String sb = JOptionPane.showInputDialog("Introduce número b:");
    b = Double.parseDouble(sb);

    if (a > b) {
      System.out.println("a es mayor que b");
    } else if (b > a) {
      System.out.println("b es mayor que s");
    } else {
      System.out.println("a y b son iguales");
    }
  }
}
