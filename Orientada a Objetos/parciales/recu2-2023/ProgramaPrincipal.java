import java.util.Scanner;
public class ProgramaPrincipal{
    public static void main (){
        Scanner in = new Scanner (System.in);
        CuentaBancaria [] cuentas = new CuentaBancaria[4]; 
        for (int i = 0; i < cuentas.length; i++){
            cuentas [i] = ingresoCuenta(in);
        }
        for (int i = 0; i<cuentas.length; i++){
            System.out.println(cuentas [i].toString());
            System.out.println("\n"+"El BNA percibira un impuesto por esta cuenta de: "+ cuentas[i].CalculoCostoMensual());
        }
    }
    
    private static CuentaBancaria ingresoCuenta(Scanner in){
        CuentaBancaria aux = null; //aca almacenare la nueva cuenta ingresada
        System.out.println("Ingrese nombre del Propietario");
        String nombre = in.next();
        System.out.println("Ingrese apellido del Propietario");
        String apellido = in.next();
        System.out.println("Ingrese CUIT");
        int cuit = in.nextInt();
        Propietario propietario = new Propietario (cuit, nombre, apellido);
        System.out.println("Ingrese el numero de cuenta");
        int numCuenta = in.nextInt();
        System.out.println("Ingrese CBU");
        int cbu = in.nextInt();
        System.out.println("Ingrese alias");
        String alias = in.next();
        System.out.println("Ingrese el dinero que posee en la cuenta");
        double dinero = in.nextDouble();
        System.out.println("Ingrese el tipo de cuenta 1:CAJA DE AHORRO 2:CUENTA CORRIENTE");
        int choice = in.nextInt();
        while (choice<1 || choice>2) { //me aseguro que el valor ingresado sea valido
            System.out.println("ERROR. NUMERO INGRESADO INVALIDO");
            System.out.println("Ingrese el tipo de cuenta 1:CAJA DE AHORRO 2:CUENTA CORRIENTE");
            choice = in.nextInt();
        }
        switch (choice){
            case 1: aux = ingresoCDA(in,numCuenta, cbu, alias, dinero, propietario);
                    break;
            case 2: aux =ingresoCC(in, numCuenta, cbu, alias, dinero, propietario);
                    break;
        }
        return aux;
    }
    
    private static CajaAhorro ingresoCDA (Scanner in, int numCuenta, int cbu, String alias, double dinero, Propietario propietario){
        System.out.println("Ingrese la cantidad de tarjetas de credito que posee");
        int tarjetas = in.nextInt();
        while (tarjetas<0 || tarjetas > 2) {
            System.out.println("ERROR. CANTIDAD DE TARJETAS INVALIDA");
            System.out.println("Por favor, ingrese cuantas tarjetas de credito posee");
            tarjetas = in.nextInt();
        }
        System.out.println("Ingrese si tiene un plazo fijo constituido (true/false)");
        boolean plazoFijo = in.nextBoolean();
        CajaAhorro aux = new CajaAhorro(numCuenta, cbu, alias, dinero, propietario, plazoFijo, tarjetas);
        boolean flag; //este booleano lo utilizare para saber cuando ya no pueda cargar mas transacciones
        System.out.println("INGRESO DE SUS ULTIMAS TRANSACCIONES");
        System.out.println("Ingrese concepto de la transaccion");
        String concepto = in.next();
        System.out.println("Ingrese monto de la transaccion");
        double monto = in.nextDouble();
        flag = true;
        while (flag) {
            flag = aux.ingresoTransacciones(concepto,monto);
            if (flag) {
                System.out.println("Ingrese concepto de la transaccion");
                concepto = in.next();
                System.out.println("Ingrese monto de la transaccion");
                monto = in.nextDouble();
            }
        }
        return aux;
    }
    
    private static CuentaCorriente ingresoCC(Scanner in, int numCuenta, int cbu, String alias, double dinero, Propietario propietario){
        System.out.println("Ingrese el limite descubierto");
        double limiteDescubierto = in.nextDouble();
        System.out.println("Ingrese la cantidad de cheques depositados en el ultimo mes");
        int cheques = in.nextInt();
        return (new CuentaCorriente(numCuenta, cbu, alias, dinero, propietario, limiteDescubierto, cheques));
    }
}