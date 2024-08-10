public class Ej03QueImprimeA {
    public static void main(String[] args) {
        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2); // false tiene dif dereccion de memoria
        System.out.println(saludo1 != saludo2);// true 
        System.out.println(saludo1.equals(saludo2));// true compara el contenido
    } 
}
