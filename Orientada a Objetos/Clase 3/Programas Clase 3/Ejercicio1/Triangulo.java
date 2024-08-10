public class Triangulo {
    private String relleno;
    private String linea;
    private double lado1;
    private double lado2; 
    private double lado3;

    public Triangulo(){

    }

    public Triangulo(String unRelleno, String unaLinea, double unLado1, double unLado2, double unLado3){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        relleno = unRelleno;
        linea = unaLinea;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getLinea() {
        return linea;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double unLado1) {
        lado1 = unLado1;
    }

    public void setLado2(double unLado2) {
        lado2 = unLado2;
    }

    public void setLado3(double unLado3) {
        lado3 = unLado3;
    }

    public void setRelleno(String unRelleno) {
        relleno = unRelleno;
    }

    public void setLinea(String unaLinea) {
        linea = unaLinea;
    }

    public double getArea() {
        double area; 
        double s=(lado1+lado2+lado3)/2.0;
        area= Math.sqrt((s*(s - lado1)*(s - lado2)*(s - lado3)));
        return area;
    }
    
    public double getPerimetro(){
        double perimetro= lado1+lado2+lado3;
        return perimetro;
    }
    }
    