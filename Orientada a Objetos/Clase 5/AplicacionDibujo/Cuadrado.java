public class Cuadrado extends Figura{
    private double lado;
    
    public Cuadrado(double lado, String relleno, String linea, Punto p){
        super(relleno,linea,p);
        this.lado = lado;
    }
    
    public Cuadrado(){
        
    }
    
    public double calcularPerimetro(){
        return (4*lado);
    }
    
    public double calcularArea(){
        return (lado*lado);
    }
    
    public void dibujar(){
        System.out.println("Cuadrado: " );
        super.dibujar();
        System.out.println("lados: " + lado );
    }
}