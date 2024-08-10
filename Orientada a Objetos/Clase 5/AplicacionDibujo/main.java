public class main{
    public static void main (String [] args){
        Dibujo dibujo = new Dibujo("La casa soleada","Gregorio",4);
        Punto p;
            p = new Punto(56,100);
            Triangulo tri = new Triangulo(71,71,71,"rojo","negro",p);
            dibujo.agregarFigura(tri);
            Punto p2= new Punto(149,82);
            Circulo cir= new Circulo(32,"naranja","negro",p2);
            dibujo.agregarFigura(cir);
            Punto p3 = new Punto(56,156);
            Cuadrado cuadrado1 = new Cuadrado(71,"amarillo","negra",p3);
            dibujo.agregarFigura(cuadrado1);
            Punto p4 = new Punto(56,177);
            Cuadrado cuadrado2 = new Cuadrado(26,"marron","negro",p4);
            dibujo.agregarFigura(cuadrado2);
            dibujo.dibujado();
        }
    }