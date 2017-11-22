<%-- 
    Document   : listadoUsuarios
    Created on : 20-11-2017, 17:14:48
    Author     : ricar
--%>

<%@page import="model.Data"%>
<%@page import="model.Privilegio"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data d = new Data();
%>
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
        <title>Listado de Usuarios</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        
        <h1 align="center">Administración de Cuentas "Banco Masones"</h1>
        <hr>
        <table id="unico" class="table table-striped table-bordered dt-responsive nowrap" border="1">
            <tr>
                <td>ID</td>
                <td>Rut</td>
                <td>Nombre</td>
                <td>Dirección</td>
                <td>Saldo</td>
                <td>Contraseña</td>
                <td>Privilegio</td>
                <td>Eliminar</td>
                <td>Actualizar</td>

                <%
                    List<Usuario> usuarios = null;
                    int auxId = 0;
                    usuarios = d.getAllUsuarios();
                    if (request.getParameter("btnActualizar") != null) {
                        auxId = Integer.parseInt(request.getParameter("idActualizar"));
                        //out.println("<td>" + auxId + "</td>");
                    }

                    for (Usuario usu : usuarios) {
                        if (auxId != usu.getId()) {
                            out.println("<tr>");
                            out.println("<td>" + usu.getId() + "</td>");
                            out.println("<td>" + usu.getRut() + "</td>");
                            out.println("<td>" + usu.getNombre() + "</td>");
                            out.println("<td>" + usu.getDireccion() + "</td>");
                            out.println("<td>" + usu.getSaldo() + "</td>");
                            out.println("<td>" + usu.getPass() + "</td>");
                            out.println("<td>" + usu.getPrivilegio() + "</td>");
                            // Boton Eliminar
                            out.println("<td colspan='1'>");
                            out.println("<form action='eliminarUsuario.do' method='GET'>");
                            out.println("<input type='hidden' value='" + usu.getId() + "' name='id'>");
                            out.println("<input type='submit' name='btnEliminar' value='Eliminar'>");
                            out.println("</form>");
                            out.println("</td>");
                            // Boton Actualizar
                            out.println("<td colspan='1'>");
                            out.println("<form action='listadoUsuarios.jsp' method='POST'>");
                            out.println("<input type='hidden' value='" + usu.getId() + "' name='idActualizar'>");
                            out.println("<input type='submit' name='btnActualizar' value='Actualizar'>");
                            out.println("</form>");
                            out.println("</td>");

                            out.println("</tr>");
                        } else {
                            out.println("<tr>");
                            out.println("<form action='actualizarUsuario.do' method='POST'>");

                            out.println("<td>");
                            out.println("<input type='hidden' name='txtIdAct' value='" + usu.getId() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<input type='text' name='txtRutAct' value='" + usu.getRut() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<input type='text' name='txtNombreAct' value='" + usu.getNombre() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<input type='text' name='txtDireccionAct' value='" + usu.getDireccion() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<input type='text' name='txtSaldoAct' value='" + usu.getSaldo() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<input type='text' name='txtPassAct' value='" + usu.getPass() + "'>");
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<select name='cboPrivilegio'>");
                            for (Privilegio auxPriv : d.allPrivilegios()) {
                                out.print("<option value='" + auxPriv.getId() + "'>" + auxPriv.getDescripcion() + "</option>");
                            }
                            out.println("</select>");
                            out.println("</td>");

                            // Boton Guardar dentro de la celda
                            out.println("<td>");
                            out.println("<input type='submit' name='btnGuardar' value='Guardar'>");
                            out.println("</form>");
                            out.println("</td>");

                            //cancelar
                            out.println("<td>");
                            out.println("<a href='index.jsp'>Cancelar</a>");
                            out.println("</td>");

                            out.println("</tr>");
                        }
                    }
                %>
            </tr>
        </table>
        <a href="menu.jsp">Volver</a>
    </body>
</html>
