<%-- 
    Document   : crearUsuario
    Created on : 20-11-2017, 17:14:48
    Author     : ricar
--%>

<%@page import="model.Data"%>
<%@page import="model.Privilegio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data d = new Data();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

        <title>Crear Usuario</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <h1 align="center">Crear Usuario</h1>
        <table id="unico" class="table table-striped table-bordered dt-responsive nowrap" border="1">
            <form action="crearUsuario.do" method="POST">
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput">Rut</label>
                    <input type="text" class="form-control" name="txtRutUsuario" id="formGroupExampleInput" placeholder="Rut: ">
                </div>
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput2">Nombre</label>
                    <input type="text" class="form-control" name="txtNombreUsuario" id="formGroupExampleInput2" placeholder="Nombre: ">
                </div>
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput2">Dirección</label>
                    <input type="text" class="form-control" name="txtDireccion" id="formGroupExampleInput2" placeholder="Dirección: ">
                </div>
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput2">Saldo</label>
                    <input type="text" class="form-control" name="txtSaldo" id="formGroupExampleInput2" placeholder="Saldo: ">
                </div>
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput2">Contraseña</label>
                    <input type="text" class="form-control" name="txtPassUsuario" id="formGroupExampleInput2" placeholder="Contraseña: ">
                </div>
                <div class="form-group">
                    <label class="col-form-label" for="formGroupExampleInput2">Privilegio</label>
                    <br>
                    <!--
                    <label class="col-form-label">1. Ejecutivo | 2. Simple Mortal | 3. Dios</label>
                    <input type="text" class="form-control" name="txtPrivilegio" id="formGroupExampleInput2" placeholder="Privilegio: ">
                    -->
                    <select name="cboPrivilegio">
                        <%
                            // Llena el combo con los valores de la bd
                            List<Privilegio> pri = d.allPrivilegios();

                            for (Privilegio perfil : pri) {
                                out.println("<option value='" + perfil.getId() + "'>" + perfil.getDescripcion() + "</option>");
                            }
                        %>
                    </select>
                </div>
                <div class="col-auto">
                    <button type="submit" name="btnCrearUsuario" class="btn btn-primary">Registrar</button>
                </div>
            </form>
            <a href="menu.jsp">Volver</a>
        </table>
    </body>
</html>
