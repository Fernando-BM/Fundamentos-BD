package practica2;

import java.util.Objects;
import java.util.Scanner;

/*
* @author daleman & fercho
*
* <p>Clase que sirve para guardar los datos de las direccion de una propiedad.</p>
*/
public class Address {

    private String calle;
    private int numCalle;
    private String colonia;
    private String municipio;
    private String estado;
    private int cp;

    /*
    * Constructor vacio
    */
    public Address() {}
    
    /*
    * Constructor 
    */
    public Address(String s) {
        String[] tmp = s.split(" ");
        this.calle = tmp[0];
        this.numCalle = Integer.parseInt(tmp[1]);
        this.colonia = tmp[2];
        this.municipio = tmp[3];
        this.estado = tmp[4];
        this.cp = Integer.parseInt(tmp[5]);
    }
    
    /*
    * Constructor para crear direcciones de propiedades.
    */
    public Address(String calle, int numCalle, String colonia, String municipio, String estado, int cp) {
        this.calle = calle;
        this.numCalle = numCalle;
        this.colonia = colonia;
        this.municipio = municipio;
        this.estado = estado;
        this.cp = cp;
    }
    
    /*
    * Fabrica de objetos de tipo direccion
    */
    public static Address createAddress() {
        String calle, colonia, municipio, estado;
        int numCalle, cp;
        
        try {
            Scanner in = new Scanner(System.in);
            System.out.println("Ingresa los siguiente datos:");
            System.out.print("Calle: ");
            calle = in.nextLine();
            System.out.print("\nNumero de calle: ");
            numCalle = Integer.parseInt(in.nextLine());
            System.out.print("\nColonia: ");
            colonia = in.nextLine();
            System.out.print("\nMunicipio: ");
            municipio = in.nextLine();
            System.out.print("\nEstado: ");
            estado = in.nextLine();
            System.out.print("\nCodigo Postal: ");
            cp = Integer.parseInt(in.nextLine());
            
            return new Address(calle, numCalle, colonia, municipio, estado, cp);
            
        } catch(NumberFormatException e) {
            System.err.println("Error al ingresar los datos de la direccion!"); 
        }
        
        return new Address();
    }
    
    /*
    * <p>Metodos getters y setters</p>
    */
    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumCalle() {
        return numCalle;
    }

    public void setNumCalle(int numCalle) {
        this.numCalle = numCalle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }

    /*
    * <p>Equals para comparar objetos de tipo Direccion</p>
    */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Address other = (Address) obj;
        if (this.numCalle != other.numCalle) {
            return false;
        }
        if (this.cp != other.cp) {
            return false;
        }
        if (!Objects.equals(this.calle, other.calle)) {
            return false;
        }
        if (!Objects.equals(this.colonia, other.colonia)) {
            return false;
        }
        if (!Objects.equals(this.municipio, other.municipio)) {
            return false;
        }
        return Objects.equals(this.estado, other.estado);
    }

    /*
    * <p>Representacion en cadena de una direccion.</p>
    */
    @Override
    public String toString() {
        return calle + " " + numCalle + " " + colonia + " " + municipio + " " + estado + " " + cp ;
    }


}
