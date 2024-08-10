public class Producto {
    private String nombreProducto;
    private String descripcion;
    private String marca; 
    private int stock;
    private int codigo;

    public Producto( int codigoProd,String unNombreProducto, String unaDescripcion, String unaMarca, int cantStock){
        nombreProducto = unNombreProducto;
        codigo = codigoProd;
        descripcion = unaDescripcion;
        marca = unaMarca; 
        stock= cantStock;
    }

    public Producto(){

    }

    public int getCodigo (){
        return codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public int getStock() {
        return stock;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setCodigo(int codProd){
        codigo = codProd;
    }

    public void setDescripcion(String unaDescripcion) {
        descripcion = unaDescripcion;
    }

    public void setMarca(String unaMarca) {
        marca = unaMarca;
    }

    public void setNombreProducto(String unnombreProducto) {
        nombreProducto = unnombreProducto;
    }

    public void setStock(int cantstock) {
        stock=cantstock;
    }

    public String toString(){
        String aux; 
        aux = "Producto " + codigo +  " " + nombreProducto + ", Descripcipcion:  " + descripcion + " Marca " + marca + " Stock " + stock ;
        return aux;
    }
}
