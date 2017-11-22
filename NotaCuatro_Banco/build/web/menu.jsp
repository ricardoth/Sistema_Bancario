<%-- 
    Document   : menu
    Created on : 19-11-2017, 4:46:43
    Author     : ricar
--%>

<%@page import="model.Privilegio"%>
<%@page import="model.Data"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data d = new Data();
    Usuario u = (Usuario) session.getAttribute("user");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <title>Menú</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Menú Principal</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="http://www.valor-dolar.cl/">Banco Masones<span class="sr-only">(current)</span></a>
                    <h3 class="text-white">
                        <%
                            out.print("Bienvenido Señor: " + u.getNombre());
                            out.print("<br>");
                        %>
                    </h3>
                </div>
            </div>
        </nav>


        <%
            if (u == null) {
                //HACKERMAN
                response.sendRedirect("error.jsp");
            } else {
                out.print("<hr>");
                out.print("Rut: " + u.getRut());
                out.print("<br>");
                out.print("Nombre: " + u.getNombre());
                out.print("<br>");

                Privilegio p = d.getPrivilegio(Integer.parseInt(u.getPrivilegio()));
                out.print("Privilegio: " + p.getDescripcion());

                out.print("<hr>");

                switch (p.getId()) {
                    case 1: {
                        out.println("Menú Ejecutivo");
                        out.print("<br>");
                        out.println("Opciones:");
                        out.print("<br>");

                        out.println("<ul>");
                        out.println("<li>");
                        out.println("<a href='crearUsuario.jsp'>Crear Usuario</a>");
                        out.println("</li>");
                        out.print("<br>");
                        /*
                        out.println("<li>");
                        out.println("<a href=''>Actualizar Usuario</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("<li>");
                        out.println("<a href=''>Eliminar Usuario</a>");
                        out.println("</li>");
                        out.print("<br>");
                        */
                        out.println("<li>");
                        out.println("<a href='listadoUsuarios.jsp'>Listado de Usuarios</a>");
                        out.println("</li>");
                        out.println("</ul>");

                        break;
                    }
                    case 2: {
                        out.println("Menú Simple Mortal");
                        out.print("<br>");
                        out.println("Opciones:");
                        out.print("<br>");

                        out.println("<ul>");
                        out.println("<li>");
                        out.println("<a href='depositar.jsp'>Transferir</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("<li>");
                        out.println("<a href='girar.jsp'>Girar</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("</ul>");
                        break;
                    }
                    case 3: {
                        out.println("Menú Dios");
                        out.print("<br>");
                        out.println("Opciones:");
                        out.print("<br>");

                        out.println("<ul>");
                        out.println("<li>");
                        out.println("<a href='crearUsuario.jsp'>Crear Usuario</a>");
                        out.println("</li>");
                        out.print("<br>");
                        /*
                        out.println("<li>");
                        out.println("<a href=''>Eliminar Usuario</a>");
                        out.println("</li>");
                        out.print("<br>");
                        */
                        out.println("<li>");
                        out.println("<a href='listadoUsuarios.jsp'>Listado de Usuarios</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("<li>");
                        out.println("<a href='depositar.jsp'>Transferir</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("<li>");
                        out.println("<a href='girar.jsp'>Girar</a>");
                        out.println("</li>");
                        out.print("<br>");
                        out.println("</ul>");
                        break;
                    }
                }
            }


        %>
        <hr>
        <a href="cerrarSesion.do">Cerrar Sesión</a>
    </body>
</html>
