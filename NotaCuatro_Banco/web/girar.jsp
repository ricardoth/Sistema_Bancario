<%-- 
    Document   : girar
    Created on : 20-11-2017, 22:15:15
    Author     : ricar
--%>

<%@page import="model.TipoCuenta"%>
<%@page import="java.util.List"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
            //Importa la tabla desde la libreria de bootstrap
            $(document).ready(function () {
                $('#unico').DataTable();
            });
        </script>
        <title>Giros</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>


        <h1 align="center">Giros Masones</h1>
        <hr>
        <table id="unico" class="table table-striped table-bordered dt-responsive nowrap" border="1">
            <form action="girar.do" method="POST">
                <tr>
                    <td>
                        Rut: 
                        <input type="text" name="txtRutGiro" placeholder="Ingrese Rut: ">
                    </td>
                    <td>
                        Tipo de Cuenta:
                        <select name="cboTipoCuenta">
                            <%
                                Data d = new Data();
                                List<TipoCuenta> tp = d.getTipoCuentas();

                                for (TipoCuenta tipo : tp) {
                                    out.println("<option value='" + tipo.getId() + "'>" + tipo.getDescripcion() + "</option>");
                                }
                            %>
                        </select>
                    </td>
                <br>
                <td>
                    Ingrese Monto a Girar:
                    <input type="number" name="txtMontoDeposito" placeholder="Cantidad a girar: ">
                    <br>
                </td>
                <br>
                <td>
                    Detalle:
                    <textarea name="txtDetalle" placeholder="Ingrese algún comentario del giro"></textarea>
                </td>
                <br>
                <td>
                    <!--<input type="textarea" name="txtDetalle" placeholder="Detalle del deposito">-->
                    <input type="submit" name="btnGirar" value="Girar">
                </td>
                </tr>
            </form>
        </table>
        <hr>
        <a href="menu.jsp" align="center">Volver</a>
    </body>
</html>
