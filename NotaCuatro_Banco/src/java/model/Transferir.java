/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ricar
 */
public class Transferir {
    private int id;
    private int idUsuario;
    private String usuarioCuenta;
    private int idTipoCuenta;
    private int monto;
    private String detalle;

    public Transferir() {
    }

    public Transferir(int id, int idUsuario, String usuarioCuenta, int idTipoCuenta, int monto, String detalle) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.usuarioCuenta = usuarioCuenta;
        this.idTipoCuenta = idTipoCuenta;
        this.monto = monto;
        this.detalle = detalle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuarioCuenta() {
        return usuarioCuenta;
    }

    public void setUsuarioCuenta(String usuarioCuenta) {
        this.usuarioCuenta = usuarioCuenta;
    }

    public int getIdTipoCuenta() {
        return idTipoCuenta;
    }

    public void setIdTipoCuenta(int idTipoCuenta) {
        this.idTipoCuenta = idTipoCuenta;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }
    //Depositar
    public int depositar(int montoDeposito){
        monto = monto + montoDeposito;
        return monto;
    }
    //Girar
    public int girar(int montoGiro){
        monto = monto - montoGiro;
        return monto;
    }
    public void Transferir(int cantidad, Transferir destino){
        monto = monto - cantidad;
        destino.depositar(cantidad);
        
    }
}
