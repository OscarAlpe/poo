public class Cuenta {
  private String titular;
  private double cantidad;

  Cuenta(String titular) {
    this.titular = titular;
    this.cantidad = 0.0;
  }

  Cuenta(String titular, double cantidad) {
    this.titular = titular;
    this.cantidad = cantidad;
  }

  public String getTitular() {
    return this.titular;
  }

  public void setTitular(String titular) {
    this.titular = titular;
  }

  public double getCantidad() {
    return this.cantidad;
  }

  public void setCantidad(double cantidad) {
    this.cantidad = cantidad;
  }
  
  public String toString() {
    return getTitular() + " tiene " + getCantidad() + " euros en la cuenta";
  }

  public void ingresar(double cantidad) {
    if (cantidad > 0) {
      this.cantidad += cantidad;
    }
  }

  public void retirar(double cantidad) {
    this.cantidad -= cantidad;
    
    if (this.cantidad < 0) {
      this.cantidad = 0;
    }
  }

}
