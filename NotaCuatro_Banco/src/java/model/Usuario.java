
package model;

/**
 *
 * @author ricar
 */
public class Usuario {
    private int id;
    private String rut;
    private String nombre;
    private String direccion;
    private int saldo;
    private String pass;
    private String privilegio;

    public Usuario(int saldo) {
        this.saldo = saldo;
    }
    
    

    public Usuario() {
    }

    public Usuario(int id, String rut, String nombre, String direccion, int saldo, String pass, String privilegio) {
        this.id = id;
        this.rut = rut;
        this.nombre = nombre;
        this.direccion = direccion;
        this.saldo = saldo;
        this.pass = pass;
        this.privilegio = privilegio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

    public int getSaldo(int saldo) {
        return saldo;
    }

    
    
    
}
