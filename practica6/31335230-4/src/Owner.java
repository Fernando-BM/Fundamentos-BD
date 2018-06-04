package practica2;

import java.util.Scanner;
import java.util.Objects;

/**
 * @author daleman & fecho
 * 
 * <p>Clase que modela a los owners de las propiedades en el sistema</p>
 */
public class Owner {
    
    private int id;
    private String name;
    private int idPropiedad;
    private static int idOwner;
    
    /*
    * Constructor para crear owners
    */
    public Owner(String name, int idPropiedad) {
        id = ++idOwner;
        this.name = name;
        this.idPropiedad = idPropiedad;
    }
    
    /*
    * Constructor para crear owners a partir de un arreglo
    */
    public Owner(String[] s) {
        this.id = Integer.parseInt(s[0]);
        this.name = s[1];
        this.idPropiedad = Integer.parseInt(s[2]);
    }
    
    /*
    * Fabrica de objetos de tipo owner, un owner se crea sin propiedades
    * estas son agregados posteriormente.
    */
    public static Owner createOwner() {
        Scanner in = new Scanner(System.in);
        String tmp = "";
        int idP = -1;
        int aux = 1;
        
        System.out.print("Ingresa el nombre del propietario: ");
        String name = in.nextLine();
        do {
            if (aux == 1) {
                System.out.print("Ingresa el id de la propiedad: ");
                idP = Integer.parseInt(in.nextLine());
            }
            //if (idP == -1)
              //  break;
            System.out.println("Si el Owner tiene mas propiedades ingresa: Y / N");
            tmp = in.nextLine();
        } while(!tmp.equalsIgnoreCase("N"));

        
        return new Owner(name, idP);  
    }
       
    /*
    * <p>Metodo para determinar si una propiedad es del Owner</p>
    */
    public boolean isMyProperty(int idProperty) {
        return this.idPropiedad == idProperty;  
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdPropiedad() {
        return idPropiedad;
    }

    public void setIdPropiedad(int idPropiedad) {
        this.idPropiedad = idPropiedad;
    }
    
    public static int getIdOwner() {
        return Owner.idOwner;
    }
    
    public static void setIdOwner(int index) {
        Owner.idOwner = index;
    }

    /*
    * <p>Equals para comparar objetos de tipo Owner</p>
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
        final Owner other = (Owner) obj;
        if (this.id != other.id) {
            return false;
        }
        if (this.idPropiedad != other.idPropiedad) {
            return false;
        }
        return Objects.equals(this.name, other.name);
    }

    /*
    * <p>Representacion en cadena de un owner.</p>
    */
    @Override
    public String toString() {
        return "Owner { id= " + id + "  nombre= " + name + "  idPropiedad= " + idPropiedad + " }";
    }    

}
