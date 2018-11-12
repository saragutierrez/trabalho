/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Funcionario;
import com.ufpr.tads.web2.dao.FuncionarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sa
 */
@WebServlet(name = "PortalServlet", urlPatterns = {"/PortalServlet"})
public class PortalServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            HttpSession session = request.getSession();
//            String nomee = (String) session.getAttribute("nomee");
//            if (nomee == null || nomee.isEmpty()) {
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ErroServlet");
//                request.setAttribute("msg", "Erro acessando a Servlet");
//                request.setAttribute("page","index.html");
//                rd.forward(request, response);
//            } else {
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">");
//                out.println("<title>Servlet PortalServlet</title>");
//                out.println("</head>");
//                out.println("<body>");
//                out.println(nomee);
//                out.println("<form action=\"CadastrarUsuarioServlet1\" method=\"POST\">");
//                out.println("<div class=\"form-group\">");
//                out.println("<label for=\"name\">Nome</label>");
//                out.println("<input type=\"text\" class=\"form-control\" name=\"nome\" placeholder=\"nome\">");
//                out.println("</div>");
//                out.println("<div class=\"form-group\">");
//                out.println("<label for=\"login\">Login</label>");
//                out.println("<input type=\"text\" class=\"form-control\" name=\"login\" placeholder=\"login\">");
//                out.println("</div>");
//                out.println("<div class=\"form-group\">");
//                out.println("<label for=\"sexo\">Sexo</label>");
//                out.println("<input type=\"text\" class=\"form-control\" name=\"sexo\" placeholder=\"sexo\">");
//                out.println("</div>");
//                out.println("<div class=\"form-group\">");
//                out.println("    <label for=\"senha\">Senha</label>");
//                out.println("    <input type=\"senha\" class=\"form-control\" name=\"senha\" aria-describedby=\"senhaHelp\" placeholder=\"senha\">");
//                out.println("</div>");
//                out.println("<br/>");
//                out.println("<button type=\"submit\" class=\"btn btn-primary\">Submit</button>");
//                out.println("</form>");
//                out.println("<br/>");
//                out.println("<br/>");
//
//                out.println("<table class=\"table\">");
//                out.println("<thead>");
//                out.println("    <tr>");
//                out.println("        <th scope=\"col\">#</th>");
//                out.println("        <th scope=\"col\">NOME</th>");
//                out.println("        <th scope=\"col\">LOGIN</th>");
//                out.println("        <th scope=\"col\">SENHA</th>");
//                out.println("        <!--<th scope=\"col\">Handle</th>-->");
//                out.println("    </tr>");
//                out.println("</thead>");
//                out.println("<tbody>");
//                FuncionarioDao usuario = new FuncionarioDao();
//
//                List<Funcionario> listaResultado = usuario.buscarTodos();
//                int cont=1;
//                for (Funcionario p : listaResultado) {
//                    out.println("<tr>");
//                    out.println("<td>" + cont++ + "</td>");
//                    out.println("<td>" + p.getNome() + "</td>");
//                    out.println("<td>" + p.getLogin() + "</td>");
//                    out.println("<td>" + p.getSenha() + "</td>");
//                    out.println("</tr>");
//                }
//                out.println("</tbody>");
//                out.println("</table>");
//                out.println("<br/>");
//                out.println("<br/>");
//                out.println("<a href=\"LogoutServlet\" class=\"btn btn-primary\">SAIR</a></br>");
//                out.println("</body>");
//                out.println("</html>");
//            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PortalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PortalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
