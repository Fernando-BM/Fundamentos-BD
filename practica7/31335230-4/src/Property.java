package practica2;

import java.util.Objects;
import java.util.Scanner;

/**
* @author daleman & fecho
* 
* <p>Clase que modela propiedades (edificio, terreno, casa).</p>
*/
public class Property {

    private int id;
    private TypeOfProperty type;
    private int ancianity;
    private double size;
    private Address address;
    private int numOfOwners;
    private static int idProperty;
    
    /*
    * Constructor vacio
    */
    public Property() {
        this.id = ++idProperty;
    }
    
    /*
    * Constructor para crear propiedades
    */
    public Property(TypeOfProperty type, int ancianity, double size, Address address) {
        this.id = ++idProperty;
        this.type = type;
        this.ancianity = ancianity;
        this.size = size;
        this.address = address;
        this.numOfOwners = 0;
    }
    
     /*
    * Constructor para crear propiedades a partir de un arreglo
    */
    public Property(String[] s) {
        this.id = Integer.parseInt(s[0]);
        switch(s[1]) {
            case "Edificio":
                this.type = TypeOfProperty.EDIFICIO;
                break;
            case "Terreno":
                this.type = TypeOfProperty.TERRENO;
                break;
            case "Casa":
                this.type = TypeOfProperty.CASA;
                break;
            default:
                this.type = TypeOfProperty.NONE;
                
        }

        this.ancianity = Integer.parseInt(s[2]);
        this.size = Double.parseDouble(s[3]);
        this.address = new Address(s[4]);
        this.numOfOwners = Integer.parseInt(s[5]);
    }
    
    /*
    * Fabrica de objetos de tipo propiedad
    */
    public static Property createProperty() {
        int tipo, antiguedad, tmp;
        double tam;
        Address ad;
               
        try {
            Scanner in = new Scanner(System.in);
            
            System.out.println("Ingresa los siguiente datos:");
            System.out.print("Tipo de la casa: \n\t1.-Edificio \n\t2.-Terreno \n\t3.-Casa\n\tEntrada: ");
            tmp = Integer.parseInt(in.nextLine());
            System.out.print("Antiguedad de la propiedad: ");
            antiguedad = Integer.parseInt(in.nextLine());
            System.out.print("\nMetros cuadrados de la propiedad: ");
            tam =  Double.parseDouble(in.nextLine());
            ad = Address.createAddress();
            
            switch (tmp) {
                case 1:
                    return new Property(TypeOfProperty.EDIFICIO, antiguedad, tam, ad);
                case 2:
                    return new Property(TypeOfProperty.TERRENO, antiguedad, tam, ad);
                case 3:
                    return new Property(TypeOfProperty.CASA, antiguedad, tam, ad);
                default:
                    return new Property(TypeOfProperty.NONE, antiguedad, tam, ad);
            }
        } catch(NumberFormatException e) {
            System.err.println("Error al ingresar los datos!"); 
        }
        
        return new Property();
    }
    
    /*
    * <p>Metodos getters y setters</p>
    */
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TypeOfProperty getType() {
        return type;
    }

    public void setType(TypeOfProperty type) {
        this.type = type;
    }

    public int getAncianity() {
        return ancianity;
    }

    public void setAncianity(int ancianity) {
        this.ancianity = ancianity;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getNumOfOwners() {
        return numOfOwners;
    }

    public void setNumOfOwners(int numOfOwners) {
        this.numOfOwners = numOfOwners;
    }
    
    public static int getIdProperty() {
        return Property.getIdProperty();
    }
    
    public static void setIdProperty(int index) {
        Property.idProperty = index;
    }
    
    /*
    * <p>Equals para comparar objetos de tipo Propiedad</p>
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
        final Property other = (Property) obj;
        if (this.id != other.id) {
            return false;
        }
        if (this.ancianity != other.ancianity) {
            return false;
        }
        if (this.size != other.size) {
            return false;
        }
        if (this.numOfOwners != other.numOfOwners) {
            return false;
        }
        if (this.type != other.type) {
            return false;
        }
        if (!Objects.equals(this.address, other.address)) {
            return false;
        }
        return true;
    }
    
    /*
    * <p>Representacion en cadena de una propiedad.</p>
    */
    @Override
    public String toString() {
        return "Propiedad{ " + "id= " + id + "  tipo= " + type.toString() + "  antiguedad= " + ancianity + "  tamanio= " + size + "  " + address.toString() + "  numeroOwners= " + numOfOwners + " }";
    }


}
        