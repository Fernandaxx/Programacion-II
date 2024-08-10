public class Balanza {
    private double monto;
    private int items; 

    public Balanza(){

    }

    public Balanza(double unMonto,int unosItems){
        monto=unMonto;
        items=unosItems;
    }

    public double getMonto() {
        return monto;
    }

    public int getItems() {
        return items;
    }

    public void setMonto(double unMonto) {
        monto = unMonto;
    }
    
    public void setItems(int unosItems){
        items= unosItems;
    }
    
    public void registrarProducto(double peso, double precio){
        monto= monto + (peso*precio);
        items++;
    }
    
    public String toString(){
        String aux; 
        aux = "Total a pagar " + monto + " por la compra de " +items + " productos. ";
        return aux;
    }
    }
