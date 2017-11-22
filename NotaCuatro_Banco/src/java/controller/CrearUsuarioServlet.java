
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Data;
import model.Usuario;

/**
 *
 * @author ricar
 */
@WebServlet(name = "CrearUsuarioServlet", urlPatterns = {"/crearUsuario.do"})
public class CrearUsuarioServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Data d = new Data();
            Usuario nuevo = new Usuario();
            
            nuevo.setRut(request.getParameter("txtRutUsuario"));
            nuevo.setNombre(request.getParameter("txtNombreUsuario"));
            nuevo.setDireccion(request.getParameter("txtDireccion"));
            nuevo.setSaldo(Integer.parseInt(request.getParameter("txtSaldo")));
            nuevo.setPass(request.getParameter("txtPassUsuario"));
            nuevo.setPrivilegio(request.getParameter("cboPrivilegio"));
            
            d.crearUsuario(nuevo);
            response.sendRedirect("menu.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
