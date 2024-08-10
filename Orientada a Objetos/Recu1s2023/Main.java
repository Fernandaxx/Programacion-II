import java.util.Scanner;
public class Main{
    public static void main (String [] args){
        Scanner in = new Scanner(System.in);
        CuentaBancaria[] cuenta = new CuentaBancaria[2];
        Propietario propCA= new Propietario("Lucia",443793273);
        Transacciones transaccion1=new Transacciones("iuhashj",600000);
        Transacciones transaccion2=new Transacciones("DEB.CPRA.VTA",500000);
        CajaAhorro CA= new CajaAhorro(2,313,8757,"lu.acuña",20000,propCA);
        CA.agregarTransaccion(transaccion1);
        CA.agregarTransaccion(transaccion2);
        Propietario propCO= new Propietario("Otto",443709273);
        CuentaCorriente CO= new CuentaCorriente(100000,9,314,8758,"lu.acuña",20000,propCO);
        cuenta[0]=CA;
        cuenta[1]=CO;
        System.out.println(cuenta[0].toString());
        System.out.println(cuenta[1].toString());
    }
}