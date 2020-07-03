package ejercicio3;

import java.util.Random;

/**
 *
 * @author Oscar
 */
public class Password {
    private int longitud = 8;
    private String contrasena;
    
    public Password() {
    }

    public Password(int longitud) {
        this.longitud = longitud;
        this.contrasena = generarContrasena();
    }

    private String generarContrasena() {
        Random objRandom = new Random();
        String ret = "";
        char c;

        for (int i=0; i < this.longitud; i++) {
          int numeroAleatorio = objRandom.nextInt(127 - 32) + 32;
          c = (char) numeroAleatorio;
          ret += c;
        }
        
        return ret;
    }
    
    public boolean esFuerte() {
        boolean ret = false;
        int mayusculas = 0, minusculas = 0, numeros = 0;

        for (int i=0; i < this.contrasena.length(); i++) {
            if (this.contrasena.charAt(i) >= 65
                    && this.contrasena.charAt(i) <= 90) {
                mayusculas++;
            }
            if (this.contrasena.charAt(i) >= 97
                    && this.contrasena.charAt(i) <= 122) {
                minusculas++;
            }
            if (this.contrasena.charAt(i) >= 48
                    && this.contrasena.charAt(i) <= 57) {
                numeros++;
            }
        }

        if ( (mayusculas > 2) && (minusculas > 1) && (numeros > 5) ) {
            ret = true;
        }

        return ret;
    }

    public int getLongitud() {
        return longitud;
    }

    public void setLongitud(int longitud) {
        this.longitud = longitud;
    }

    public String getContrasena() {
        return contrasena;
    }

}
