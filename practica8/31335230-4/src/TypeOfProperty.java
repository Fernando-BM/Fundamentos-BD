package practica2;

/**
* @author daleman & fercho
* 
* <p>Enumeración de los diferentes tipos de propiedades</p>
*/
public enum TypeOfProperty {
    EDIFICIO,
    TERRENO,
    CASA,
    NONE;

    @Override
    public String toString() {
        switch(this) {
            case EDIFICIO: return "Edificio";
            case TERRENO: return "Terreno";
            case CASA: return "Casa";
            default: return "None";
        }
    }
    
    
}
