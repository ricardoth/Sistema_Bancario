package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ricar
 */
public class Data {

    private Conexion con;
    private String query;
    private ResultSet rs;
    private List<Usuario> usuarios;
    private List<Privilegio> privilegios;
    private List<TipoCuenta> tipoCuentas;

    public Data() {
        try {
            con = new Conexion("localhost", "bd_banco", "root", "");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //INICIAR SESION
    public Usuario iniciarSesion(String rut, String pass) {
        Usuario u = null;
        query = "SELECT * FROM usuario where rut = '" + rut + "' AND pass = '" + pass + "'";

        try {
            rs = con.ejecutarSelect(query);

            while (rs.next()) {
                u = new Usuario();

                u.setId(rs.getInt(1));
                u.setRut(rs.getString(2));
                u.setNombre(rs.getString(3));
                u.setDireccion(rs.getString(4));
                u.setSaldo(rs.getInt(5));
                u.setPass(rs.getString(6));
                u.setPrivilegio(rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    //CRUD USUARIO
    //CREAR
    public void crearUsuario(Usuario u) {
        query = "insert into usuario values(null,'" + u.getRut() + "', "
                + "'" + u.getNombre() + "','" + u.getDireccion() + "', "
                + "'" + u.getSaldo() + "','" + u.getPass() + "','" + u.getPrivilegio() + "')";
        try {
            con.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //ELIMINAR
    public void eliminarUsuario(int id) {
        query = "delete from usuario where id = " + id;
        try {
            con.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //ACTUALIZAR
    public void actualizarUsuario(Usuario nuevo) {
        query = "update usuario set rut = '" + nuevo.getRut() + "', "
                + "nombre = '" + nuevo.getNombre() + "', direccion = '" + nuevo.getDireccion() + "', "
                + "saldo = '" + nuevo.getSaldo() + "', pass = '" + nuevo.getPass() + "', "
                + "privilegio = '" + nuevo.getPrivilegio() + "' where id = '" + nuevo.getId() + "'";
        try {
            con.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //LISTAR TODOS USUARIOS
    public List<Usuario> getAllUsuarios() {
        usuarios = new ArrayList<>();
        Usuario u;
        query = "SELECT usuario.id, usuario.rut, usuario.nombre, usuario.direccion, "
                + "usuario.saldo, usuario.pass, privilegio.descripcion "
                + "FROM usuario "
                + "INNER JOIN privilegio ON usuario.privilegio = privilegio.id;";
        
        try {
            rs = con.ejecutarSelect(query);
            
            while(rs.next()){
                int id, saldo;
                String rut, nombre, direccion, pass, privilegio;
                
                id = rs.getInt(1);
                rut = rs.getString(2);
                nombre = rs.getString(3);
                direccion = rs.getString(4);
                saldo = rs.getInt(5);
                pass = rs.getString(6);
                privilegio = rs.getString(7);
                
                u = new Usuario(id, rut, nombre, direccion, saldo, pass, privilegio);
                usuarios.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(query);
        return usuarios;
    }
    //CONSULTAR SALDO
    public Usuario getSaldo(String rut){
        query = "select usuario.saldo from usuario where rut= "+rut;
        Usuario u = null;
        
        try {
            rs = con.ejecutarSelect(query);
            if (rs.next()) {
                u = new Usuario();
                
                u.getSaldo(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
    
    
    //CRUD PRIVILEGIO
    //Todos
    public List<Privilegio> allPrivilegios(){
        privilegios = new ArrayList<>();
        Privilegio p;
        
        query = "select * from privilegio";
        
        try {
            rs = con.ejecutarSelect(query);
            while(rs.next()){
                p = new Privilegio();
                
                p.setId(rs.getInt(1));
                p.setDescripcion(rs.getString(2));
                
                privilegios.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return privilegios;
    }
    
    //Por id
    public Privilegio getPrivilegio(int id) {
        query = "select * from privilegio where id = " + id;

        Privilegio p = null;

        try {
            rs = con.ejecutarSelect(query);
            if (rs.next()) {
                p = new Privilegio();

                p.setId(rs.getInt(1));
                p.setDescripcion(rs.getString(2));

            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }
    
    //Listar todos tipocuenta
    public List<TipoCuenta> getTipoCuentas(){
        tipoCuentas = new ArrayList<>();
        TipoCuenta tc;
        
        query = "select * from tipoCuenta";
        
        try {
            rs = con.ejecutarSelect(query);
            
            while(rs.next()) {
                tc = new TipoCuenta();
                
                tc.setId(rs.getInt(1));
                tc.setDescripcion(rs.getString(2));
                
                tipoCuentas.add(tc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tipoCuentas;
    }
    
    //DEPOSITAR
    public void depositar(int cantidad, String rut){
        query = "UPDATE usuario SET saldo = saldo + '"+cantidad+"' WHERE rut = '"+rut+"'";
        try {
            con.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //GIRAR
    public void girar(int cantidad, String rut){
        query = "UPDATE usuario SET saldo = saldo - '"+cantidad+"' WHERE rut = '"+rut+"'";
        try {
            con.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
