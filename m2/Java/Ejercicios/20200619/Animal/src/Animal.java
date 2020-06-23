import javax.swing.JOptionPane;

public class Animal {
  String especie;
  String alimentacion;
  int longevidad;
  int maxpeso;

  Animal(String especie, String alimentacion, int longevidad, int maxpeso) {
    this.especie = especie;
    this.alimentacion = alimentacion;
    this.longevidad = longevidad;
    this.maxpeso = maxpeso;
  }

  void fijaEspyAli(String especie, String alimentacion) {
    this.especie = especie;
    this.alimentacion = alimentacion;
  }

  void fijaLongPeso(int longevidad, int maxpeso) {
    this.longevidad = longevidad;
    this.maxpeso = maxpeso;
  }

  String obtenEspecie() {
    return this.especie;
  }

  String obtenAlimentacion() {
    return this.alimentacion;
  }
  
  int obtenLongevidad() {
    return this.longevidad;
  }
  
  int obtenMaxpeso() {
    return this.maxpeso;
  }
  
  public static void main(String[] args) {
    Animal perro, gato;

    String especiePerro = JOptionPane.showInputDialog("Introduce la especie del perro:");

    String alimentacionPerro = JOptionPane.showInputDialog("Introduce la alimentación del perro:");

    String textoLongevidadPerro = JOptionPane.showInputDialog("Introduce la longevidad del perro:");
    int longevidadPerro = Integer.parseInt(textoLongevidadPerro);

    String textoMaxpesoPerro = JOptionPane.showInputDialog("Introduce el peso máximo del perro:");
    int maxpesoPerro = Integer.parseInt(textoMaxpesoPerro);
    
    perro = new Animal(especiePerro, alimentacionPerro, longevidadPerro, maxpesoPerro);

    String especieGato = JOptionPane.showInputDialog("Introduce la especie del gato:");

    String alimentacionGato = JOptionPane.showInputDialog("Introduce la alimentación del gato:");

    String textoLongevidadGato = JOptionPane.showInputDialog("Introduce la longevidad del gato:");
    int longevidadGato = Integer.parseInt(textoLongevidadGato);

    String textoMaxpesoGato = JOptionPane.showInputDialog("Introduce el peso máximo del gato:");
    int maxpesoGato = Integer.parseInt(textoMaxpesoGato);

    gato = new Animal(especieGato, alimentacionGato, longevidadGato, maxpesoGato);
    
    System.out.println("El perro es de la especie: " + perro.obtenEspecie());
    System.out.println("El perro es de alimentación: " + perro.obtenAlimentacion());
    System.out.println("El perro es de longevidad: " + perro.obtenLongevidad());
    System.out.println("El perro tiene peso máximo: " + perro.obtenMaxpeso());

    System.out.println("");

    System.out.println("El gato es de la especie: " + gato.obtenEspecie());
    System.out.println("El gato es de alimentación: " + gato.obtenAlimentacion());
    System.out.println("El gato es de longevidad: " + gato.obtenLongevidad());
    System.out.println("El gato tiene peso máximo: " + gato.obtenMaxpeso());
  }
}
