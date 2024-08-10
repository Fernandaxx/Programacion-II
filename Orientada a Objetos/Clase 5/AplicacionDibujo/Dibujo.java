public class Dibujo{
    private String titulo;
    private String nombreAutor;
    private Figura [] figuras;
    private int diml;

    public Dibujo(String titulo, String nombreAutor, int maxFig){
        this.titulo=titulo;
        this.nombreAutor = nombreAutor;
        this.diml=0;
        figuras = new Figura[maxFig];
    }

    public Dibujo(){

    }

    public boolean dibujoCompleto (){
        boolean aux = false;
        if ( diml == figuras.length){
            aux= true;
        }
        return aux;
    }

    public void agregarFigura (Figura fig){
        if (!dibujoCompleto()){
            figuras[diml] = fig;
            diml++;
         }
    }

    public void dibujado(){
        System.out.println("Titulo:" + titulo);
        System.out.println("Autor: " + nombreAutor);
        System.out.println("Dibujo: ");
        for(int i=0; i<figuras.length; i++){
            figuras[i].dibujar();
        }
    }
}