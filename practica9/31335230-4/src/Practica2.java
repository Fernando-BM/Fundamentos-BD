package practica2; 

import java.util.Scanner;
import java.util.ArrayList;
import java.io.FileReader;
import java.io.File;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import com.csvreader.CsvWriter;
import java.io.FileNotFoundException;

/*
* @author daleman & fercho
* @sice 23/Feb/18
*
* Clase principal de la practica 1
*/
public class Practica2 {

    private static int flag;
    private static ArrayList<Owner> ownersList;
    private static ArrayList<Property> propertiesList;
    
    private static final char SEPARADOR = ',';
    private static final char COMILLAS = '"';

    /*
    * <p>Practica 1: Programa que simula ser un SMBD.</p>
    */
    public static void main(String[] args) {
        System.out.println("loremd\nerwrftw\nwbygsbfybysw\njhfdujhsu");
        
        
        readOwnwers();
        readProperties();

	do {
            cleanScreen();
            System.out.println("Bienvenido al sistema administrador de propiedades.");
            showMenu();
	} while(flag != 0);                
            
        writeOwners();
        writeProperties();
        writeMetadata();
    }
    
    /*
    * <p>Limpia la consola.</p>
    */
    private static void cleanScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
    
    /*
    * <p>Muestra el 1er menu con el que interactua el usuario</p>
    */
    private static void showMenu() {
        Scanner in = new Scanner(System.in);
        
        System.out.println("Ingresa el numero del tipo de entidad co la que quieres trabajar.");
        System.out.println("\t(0) -> Salir");
        System.out.println("\t(1) -> Propietarios");
        System.out.println("\t(2) -> Propiedades");
        System.out.print("Ingresa la opcion: ");
        try {
            switch (Integer.parseInt(in.nextLine())) {
                case 0:
                System.out.println("Gracias por usar el sistema administrador de propiedades.");
                System.exit(0);
                break;
                case 1:
                    showMenuOwner();
                    break;
                case 2:
                    showMenuProperty();
                    break;
                default:
                    System.out.println("Opcion no valida!");
                    break;
            }
        } catch (NumberFormatException e) {
            
        }
        
    }
    
    /*
    * <p>Muestra el menu con las acciones que se pueden realizar 
    * sobre los owners</p>
    */
    private static void showMenuOwner() {
        Scanner in = new Scanner(System.in);
        
        System.out.println("Ingresa el numero de la accion a realizar");
        System.out.println("\t(0) -> Salir");
        System.out.println("\t(1) -> Capturar propietario");
        System.out.println("\t(2) -> Eliminar propietario");
        System.out.println("\t(3) -> Listar todos los propietarios");
        System.out.println("\t(4) -> Buscar propietario");
        System.out.print("Ingresa la opcion: ");

        try {
            Practica2.flag = Integer.parseInt(in.nextLine());
            executeOperationOwner();
        } catch(NumberFormatException e) {
            System.err.println("Debiste pasarme el \"numero\" de la accion a realizar");
        }
        
    }
    
    /*
    * <p>Realiza acciones sobre el conjunto de Owners</p>
    */
    private static void executeOperationOwner() {
        Scanner in = new Scanner(System.in);
        
        switch (Practica2.flag) {
            case 0:
                System.out.println("Gracias por usar el sistema administrador de propiedades.");
                System.exit(0);
                break;
            case 1:
                Owner.createOwner();
                break;
            case 2:
                System.out.print("Ingresa el id del propietario a eliminar: ");
                try {
                    deleteOwner(Integer.parseInt(in.nextLine()));
                } catch(NumberFormatException e) {
                    System.err.println("Id no valido!");
                }
                break;
            case 3:
                ownersList.forEach((o) -> { System.out.println(o); });
                break;
            case 4:
                System.out.print("Ingresa el nombre del propietario a buscar: ");
                try {
                    searchOwnwer(in.nextLine());
                    /*if (o == null || o.isEmpty())
                        System.out.println("No se encontro ninguna coincidencia.");
                    else
                        o.forEach((owner) -> {System.out.print(owner);}); */
                } catch(NumberFormatException e) {
                    System.err.println("Id no valido!");
                }
                break;
            default:
                System.out.println("Opcion no valida!");

        }
    }
    
    /*
    * <p>Muestra el menu con las acciones que se pueden realizar 
    * sobre las propiedades.</p>
    */
    private static void showMenuProperty() {
        Scanner in = new Scanner(System.in);
        
        System.out.println("Qué operación desea realiazar?");
        System.out.println("\t(0) -> Salir");
        System.out.println("\t(1) -> Capturar propiedad");
        System.out.println("\t(2) -> Eliminar propiedad");
        System.out.println("\t(3) -> Buscar propiedad");
        System.out.println("\t(4) -> Listar todas las propiedades");
        System.out.print("Ingresa la opcion: ");

        try {
            Practica2.flag = Integer.parseInt(in.nextLine());
            executeOperationProperty();
        } catch(NumberFormatException e) {
            System.err.println("Debiste pasarme el \"numero\" de la p");
        }
    }
    
    /*
    * <p>Realiza acciones sobre el conjunto de Propiedades</p>
    */
    private static void executeOperationProperty() {
        Scanner in = new Scanner(System.in);
        
        switch (Practica2.flag) {
            case 0:
                System.out.println("Gracias por usar el sistema administrador de propiedades.");
                System.exit(0);
                break;
            case 1:
                if (Practica2.ownersList.isEmpty()) {
                    System.out.println("Para poder agregar una propiedad necesitan" 
                            + "existir owners, pero no hay ninguno registrado.");
                }
                Practica2.propertiesList.add(Property.createProperty());
                break;
            case 2:
                System.out.print("Ingresa el id del propietario a eliminar: ");
                try {
                    deleteProperty(Integer.parseInt(in.nextLine()));
                } catch(NumberFormatException e) {
                    System.err.println("Id no valido!");
                }
                break;
            case 3:
                propertiesList.forEach((p) -> {
                    System.out.println(p);
                });
                break;
            case 4:
                System.out.print("Ingresa el Id de la propiedad a burcar: ");
                searchProperty(Integer.parseInt(in.nextLine()));
                break;
            default:
                System.out.println("Opcion no valida!");
        }
    }

    /*
    * <p>Realiza una busqueda de Owners por nombre.</p>
    */
    private static void searchOwnwer(String name) {
        ArrayList<Owner> tmp = new ArrayList<>();
         
        Practica2.ownersList.stream().filter((o) -> (o.getName().equals(name))).map((Owner o) -> {
            Practica2.propertiesList.stream().filter((p) -> (o.getIdPropiedad() == p.getId())).forEachOrdered((p) -> {
                System.out.println(p);
            });
            return o;
        }).forEachOrdered(tmp::add);
    }
    
    /*
    * <p>Elimina una propiedad e=de la base de datos.</p>
    */
    private static void deleteProperty(int id) {
        for (Property p : Practica2.propertiesList) {
            if (p.getId() == id) {
                Practica2.ownersList.stream().filter((o) -> (o.getIdPropiedad() == id)).forEachOrdered((o) -> {
                    Practica2.ownersList.remove(o);
                });
                Practica2.propertiesList.remove(p);
                return;
            }
        }
    }
    
    
    /*
    * <p>Realiza una busqueda de Propiedades por id.</p>
    */
    private static void searchProperty(int id) {    
        Practica2.propertiesList.stream().filter((p) -> (p.getId() == id)).forEachOrdered((Property p) -> {
            Practica2.ownersList.stream().filter((o) -> (p.getId() == o.getIdPropiedad())).map((o) -> {
                System.out.println("El dueño asociado al identificado de la propiedad es: ");
                return o;
            }).forEachOrdered((o) -> {
                System.out.println(o);
            });
        });
    }
    
    /*
    * <p>Elimina una propiedad e=de la base de datos.</p>
    */
    private static void deleteOwner(int id) {
        Practica2.ownersList.stream().filter((o) -> (o.getId() == id)).forEachOrdered((Owner o) -> {
            Practica2.propertiesList.stream().filter((p) -> (p.getId() == o.getIdPropiedad())).forEachOrdered((p) -> {
                Practica2.propertiesList.remove(p);
            });
            Practica2.ownersList.remove(o);
        });
    }   
    
    /*
    * <p>Lee las Propiedades de un archivo csv.</p>
    */
    private static void readProperties() {
        Practica2.propertiesList = new ArrayList<>();
        try {
            BufferedReader br = new BufferedReader(new FileReader(new File("./csv/Properties.csv")));
            String line;
            
            while ((line = br.readLine()) != null) {
                Property p = new Property(line.split(",")); 
                Practica2.propertiesList.add(p); 
            }
        } catch(FileNotFoundException e) {
            System.out.println("No se encontro el archivo Properties.csv");
            return;
        }  catch (IOException e) {
            System.out.println("Hubo un error al leer el archivo Properties.csv");
            return;
        }
        System.out.println("Se leyeron con exito las Propiedades.");
    }
    
    /*
    * <p>Lee los Owners de un archivo csv.</p>
    */
    private static void readOwnwers() {
        Practica2.ownersList = new ArrayList<>();
        try {
            BufferedReader br = new BufferedReader(new FileReader(new File("./csv/Owners.csv")));
            String line;
            
            while ((line = br.readLine()) != null) {
                Owner o = new Owner(line.split(",")); 
                Practica2.ownersList.add(o); 
            }
        } catch(FileNotFoundException e) {
            System.out.println("No se encontro el archivo Owners.csv");
            return;
        } catch (IOException e) {
            System.out.println("Hubo un error al leer el archivo Owners.csv");
            return;
        }
        System.out.println("Se leyeron con exito los Owners.");
    }    
    
    /*
    * <p>Escribe las Propiedades de un archivo csv.</p>
    */
    private static void writeProperties() {
        File f = new File("Properties.csv");
        try {
            CsvWriter writer = new CsvWriter(new FileWriter("Properties.csv", true), ',');
        
            if (!f.exists()) {
                writer.write("Id");
                writer.write("Tipo");
                writer.write("Antiguedad");
                writer.write("Tamanio");
                writer.write("Direccion");
                writer.write("Numero de Owners");
                writer.endRecord();
            } 
            
            for (Property p : Practica2.propertiesList) {
                writer.write(Integer.toString(p.getId()));
                writer.write(p.getType().toString());
                writer.write(Integer.toString(p.getAncianity()));
                writer.write(Double.toString(p.getSize()));
                writer.write(p.getAddress().toString());
                writer.write(Integer.toString(p.getNumOfOwners()));
                writer.endRecord();
            }

            writer.close();
        }catch(IOException e){
            System.out.println("No se pudieron guardar cambios en el archivo Properties.csv");
        }      
        System.out.println("Se escribio con exito en el archivo Properties.csv");
    }
   
    /*
    * <p>Escribe los Owners de un archivo csv.</p>
    */ 
    private static void writeOwners() {
        File f = new File("Owners.csv");
        try {
            CsvWriter writer = new CsvWriter(new FileWriter("Owners.csv", true), ',');
        
            if (!f.exists()) {
                writer.write("Id");  
                writer.write("Nombre");
                writer.write("Id Propiedad");
                writer.endRecord();
            } 
            
            for (Owner o : Practica2.ownersList) {
                writer.write(Integer.toString(o.getId()));
                writer.write(o.getName());
                writer.write(Integer.toString(o.getIdPropiedad()));
                writer.endRecord();
            }

            writer.close();
        }catch(IOException e){
            System.out.println("No se pudieron guardar cambios en el archivo Owners.csv");
        }  
        System.out.println("Se escribio con exito en el archivo Properties.csv");
    }
    
    /*
    * <p>Lee los metadatos de la bases de datos de un archivo txt.</p>
    */
    private static void readMetadata() {
        try {
            BufferedReader br = new BufferedReader(new FileReader("metadata.txt"));
            Owner.setIdOwner(Integer.parseInt(br.readLine()));
            Property.setIdProperty(Integer.parseInt(br.readLine()));
        } catch(NumberFormatException | IOException e) {
            System.out.println("Error leyendo metadata.txt");
        }   
        System.out.println("Se leyo con exito en el archivo metadata.txt");
    }
    
    /*
    * <p>Escribe los metadatos de la bases de datos de un archivo txt.</p>
    */
    private static void writeMetadata() {
        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("./../csv/metadata.txt"));
            bw.write(String.valueOf(Owner.getIdOwner()));
            bw.write(String.valueOf(Property.getIdProperty()));
        } catch(IOException io) {
            System.err.println("Hubo un error al escribir en el archivo metadata.txt");
        }
        System.out.println("Se escribio con exito en el archivo metadata.txt");
    }
    
    
}

