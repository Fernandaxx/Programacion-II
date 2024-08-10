public class Editorial {
    private String nombre;
    private int premios;
    private Libro [] libros;
    private int dim;

    public Editorial (String nombre, int premios){
        libros = new Libro[5];
        dim =0;
        this.nombre= nombre;
        this.premios= premios;
    }

    public Editorial(){

    }

    public boolean librosCompletos (){
        boolean aux = false;
        if (dim == libros.length){
            aux= true;
        }
        return aux;
    }
    
    public void agregarLibro(Libro libro){
        if (!librosCompletos()){
            libros[dim] = libro;
            dim++;
        }
    }
    public String toString(){
        String aux = "nombre " + this.nombre + " premios " + this.premios + "\n";
        for(int i = 0; i<dim ; i++){
            aux += "\t" + libros[i].toString() + "\n\n";
        }
        return aux;
    }
    public double montoTotal(){
        double total=0;
        for(int i = 0; i< libros.length ; i++){
            libros[i].CalcularDescuento();
            total+= libros[i].getPrecio();
        }
        return total;
    }
}
    