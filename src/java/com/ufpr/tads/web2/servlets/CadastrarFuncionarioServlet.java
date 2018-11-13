///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ufpr.tads.web2.servlets;
//
//import com.ufpr.tads.web2.beans.Funcionario;
//import com.ufpr.tads.web2.dao.FuncionarioDao;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.io.UnsupportedEncodingException;
//import java.security.NoSuchAlgorithmException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// *
// * @author sa
// */
//@WebServlet(name = "CadastrarUsuarioServlet1", urlPatterns = {"/CadastrarUsuarioServlet1"})
//public class CadastrarFuncionarioServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
////            out.println("<!DOCTYPE html>");
////            out.println("<html>");
////            out.println("<head>");
////            out.println("<title>Servlet CadasatrarUsuarioServlet</title>");
////            out.println("</head>");
////            out.println("<body>");
////            String login = request.getParameter("login");
////            String senha = request.getParameter("senha");
////            String nome = request.getParameter("nome");
////            String sexo = request.getParameter("sexo");
////
////            Funcionario p = new Funcionario();
////            FuncionarioDao pDao = new FuncionarioDao();
////            p.setNome(nome);
////            p.setLogin(login);
////            p.setSenha(senha);
////            p.setSexo(sexo);
////          
////            try {
////                pDao.adiciona(p);
////            } catch (NoSuchAlgorithmException ex) {
////                Logger.getLogger(CadastrarFuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
////            } catch (UnsupportedEncodingException ex) {
////                Logger.getLogger(CadastrarFuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
////            }
////            out.println("<h1>CADASTRADO COM SUCESSO</h1>");
////
////            out.println("<a href=\"PortalServlet\" class=\"btn btn-primary\">Ir para o portal</a></br>");
////            out.println("</body>");
////            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
