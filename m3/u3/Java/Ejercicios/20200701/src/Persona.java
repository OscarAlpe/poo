/*
 *
 * Ejercicio 2.- Haz una clase llamada Persona que siga las siguientes condiciones:
 * Sus atributos son: nombre, edad, DNI, sexo (H hombre, M mujer), peso y altura. No
 * queremos que se accedan directamente a ellos. Piensa que modificador de acceso es el
 * más adecuado, también su tipo. Si quieres añadir algún atributo puedes hacerlo.
 * Por defecto, todos los atributos menos el DNI serán valores por defecto según su tipo (0
 * números, cadena vacía para String, etc.). Sexo será hombre por defecto, usa una
 * constante para ello.
 * Se implantarán varios constructores:
 *   ➢ Un constructor por defecto.
 *   ➢ Un constructor con el nombre, edad y sexo, el resto por defecto.
 *   ➢ Un constructor con todos los atributos como parámetro.
 * Los métodos que se implementaran son:
 *   ➢ calcularIMC(): calculara si la persona está en su peso ideal (peso en
 * kg/(altura^2 en m)), si esta fórmula devuelve un valor menor que 20, la función
 * devuelve un -1, si devuelve un número entre 20 y 25 (incluidos), significa que
 * está por debajo de su peso ideal la función devuelve un 0 y si devuelve un valor
 * mayor que 25 significa que tiene sobrepeso, la función devuelve un 1. Te
 * recomiendo que uses constantes para devolver estos valores.
 *   ➢ esMayorDeEdad(): indica si es mayor de edad, devuelve un booleano.
 *   ➢ comprobarSexo(char sexo): comprueba que el sexo introducido es correcto. Si
 * no es correcto, será H. No será visible al exterior.
 *   ➢ toString(): devuelve toda la información del objeto.
 *   ➢ generaDNI(): genera un número aleatorio de 8 cifras, genera a partir de este su
 * número su letra correspondiente. Este método será invocado cuando se
 * construya el objeto. Puedes dividir el método para que te sea más fácil. No será
 * visible al exterior.
 *   ➢ Métodos set de cada parámetro, excepto de DNI.
 * Ahora, crea una clase ejecutable que haga lo siguiente:
 *   ➢ Pide por teclado el nombre, la edad, sexo, peso y altura.
 *   ➢ Crea 3 objetos de la clase anterior, el primer objeto obtendrá las anteriores
 * variables pedidas por teclado, el segundo objeto obtendrá todos los anteriores
 * menos el peso y la altura y el último por defecto, para este último utiliza los
 * métodos set para darle a los atributos un valor.
 *   ➢ Para cada objeto, deberá comprobar si está en su peso ideal, tiene sobrepeso o
 * por debajo de su peso ideal con un mensaje.
 *   ➢ Indicar para cada objeto si es mayor de edad.
 *   ➢ Por último, mostrar la información de cada objeto.
 *
 */

import java.util.Random;

public class Persona {
  private String nombre;
  private int edad;
  private String DNI;
  private char sexo;
  private double peso;
  private double altura;
  private final char SEXO_DEFECTO = 'H';

  public Persona() {
    this.nombre = "";
    this.edad = 0;
    this.DNI = generaDNI();
    this.sexo = SEXO_DEFECTO;
    this.peso = 0.0;
    this.altura = 0.0;
  }

  public Persona(String nombre, int edad, char sexo) {
    this();

    setNombre(nombre);
    setEdad(edad);
    setSexo(sexo);
  }

  public Persona(String nombre, int edad, char sexo, double peso, double altura) {
    setNombre(nombre);
    setEdad(edad);
    this.DNI = generaDNI();
    setSexo(sexo);
    setPeso(peso);
    setAltura(altura);
  }

  public int calcularIMC() {
    int ret = 0;
    double imc = 0.0;
    final int INFRAPESO = -1;
    final int DEBAJO_PESO_IDEAL = 0;
    final int SOBREPESO = 1;
    
    imc = this.peso / (Math.pow(altura, 2));

    if (imc < 20) {
      ret = INFRAPESO;
    } else if (imc >= 20 && imc <= 25) {
      ret = DEBAJO_PESO_IDEAL;
    } else {
      ret = SOBREPESO;
    }

    return ret;
  }

  public boolean esMayorDeEdad() {
    if (this.edad >= 18) {
      return true;
    } else {
      return false;
    }
  }

  private char comprobarSexo(char sexo) {
    if (!(sexo == 'H' || sexo == 'M')) {
      return 'H';
    } else {
      return sexo;
    }
  }

  public String toString() {
    return "Nombre:" + this.nombre + " Edad:" + this.edad + " DNI:" + DNI +
           " Sexo:" + sexo + " Peso:" + peso + " Altura:" + altura;
  }

  private String generaDNI() {
    Random objRandom = new Random();
    int ochoDigitos = 0;
    int resto = 0;
    char letra;

    for (int i=0; i < 8; i++) {
      int randomNum09 = objRandom.nextInt(9) + 1;
      ochoDigitos += randomNum09 * Math.pow(10, i);
    }

    resto = ochoDigitos % 23;
    
    switch (resto) {
      case 0:
        letra = 'T';
        break;
      case 1:
        letra = 'R';
        break;
      case 2:
        letra = 'W';
        break;
      case 3:
        letra = 'A';
        break;
      case 4:
        letra = 'G';
        break;
      case 5:
        letra = 'M';
        break;
      case 6:
        letra = 'Y';
        break;
      case 7:
        letra = 'F';
        break;
      case 8:
        letra = 'P';
        break;
      case 9:
        letra = 'D';
        break;
      case 10:
        letra = 'X';
        break;
      case 11:
        letra = 'B';
        break;
      case 12:
        letra = 'N';
        break;
      case 13:
        letra = 'J';
        break;
      case 14:
        letra = 'Z';
        break;
      case 15:
        letra = 'S';
        break;
      case 16:
        letra = 'Q';
        break;
      case 17:
        letra = 'V';
        break;
      case 18:
        letra = 'H';
        break;
      case 19:
        letra = 'L';
        break;
      case 20:
        letra = 'C';
        break;
      case 21:
        letra = 'K';
        break;
      case 22:
        letra = 'E';
        break;
      default:
        letra = '*';
        break;
    }
    
    return String.valueOf(ochoDigitos) + letra;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public void setEdad(int edad) {
    this.edad = edad;
  }

  public void setSexo(char sexo) {
    this.sexo = comprobarSexo(sexo);
  }

  public void setPeso(double peso) {
    this.peso = peso;
  }

  public void setAltura(double altura) {
    this.altura = altura;
  }

}
