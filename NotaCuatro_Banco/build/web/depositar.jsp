<%-- 
    Document   : depositar
    Created on : 20-11-2017, 22:14:34
    Author     : ricar
--%>

<%@page import="model.Data"%>
<%@page import="model.TipoCuenta"%>
<%@page import="java.util.List"%>
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
                //$('#tablaServlet').DataTable();
            });
        </script>
        <title>Depositos</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <h1 align="center">Depositos Masones</h1>
        <hr>

        <table id="unico" class="table table-striped table-bordered dt-responsive nowrap" border="1">
            <form action="depositar.do" method="post" align="center">
                <tr>
                    <td>
                        Rut: 
                        <input type="text" name="txtRutDeposito" placeholder="Ingrese Rut: ">
                    </td>
                <br>
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
                    Ingrese Monto:
                    <input type="number" name="txtMontoDeposito" placeholder="Cantidad a depositar: ">
                    <br>
                </td>
                <td>
                    Detalle:
                    <textarea name="txtDetalle" placeholder="Ingrese algún comentario del deposito"></textarea>
                </td>
                <td>
                <!--<input type="textarea" name="txtDetalle" placeholder="Detalle del deposito">-->
                <input type="submit" name="btnDepositar" value="Depositar">
                </td>
            </form>
        </table>

        <br>
        <a href="menu.jsp" align="center">Volver</a>
    </table>

</body>
</html>
