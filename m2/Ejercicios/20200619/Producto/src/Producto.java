  public class Producto {
    int codigo;
    String descripcion;
    double precio;
    // Vamos a definir un constructor
    Producto(int codigo, String descripcion, double precio) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    // fija el precio del producto
    void fijarPrecio(double precioNuevo) {
        precio = precioNuevo;
    }

    // devuelve el precio del producto
    double obtenerPrecio() {
        return precio;
    }

    public static void main(String[] args) {
        Producto sal, azucar;
        sal = new Producto(80005355, "Sal", 0.60);
        azucar = new Producto(80005388, "Azúcar", 0.81);
        System.out.println("Precio del paquete de sal: " +
        sal.obtenerPrecio() + " EUR");
        System.out.println("Precio del paquete de azúcar: " +
        azucar.obtenerPrecio() + " EUR");
    }
}
