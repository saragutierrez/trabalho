/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import static com.mysql.jdbc.StringUtils.isNullOrEmpty;
import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.CidadeBean;
import com.ufpr.tads.web2.beans.EstadoBean;
import com.ufpr.tads.web2.beans.UsuarioBean;
import com.ufpr.tads.web2.dao.UsuarioDao;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
import com.ufpr.tads.web2.facade.ClientesFacade;
import com.ufpr.tads.web2.facade.UsuarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            UsuarioBean logB = (UsuarioBean) session.getAttribute("loginBean");
            String action = request.getParameter("action");
            if (logB.getNome() == null || logB.getNome().isEmpty()) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
            } else {
                if ((isNullOrEmpty(action)) || action.equals("list")) {
                    System.out.println(logB.getId());
                    List<Atendimento> atendimentos = AtendimentoFacade.listAtendimentosCli(logB.getId());
                    List<String> produtos = new ArrayList<>();
                    List<String> clientes = new ArrayList<>();
                    for (Atendimento a : atendimentos) {
                        String p = AtendimentoFacade.buscarProduto(a.getId_produto()).getNome_produto();
                        String c = UsuarioFacade.show(a.getId_cliente()).getNome();
                        produtos.add(p);
                        clientes.add(c);
                    }
                    request.setAttribute("atendimentos", atendimentos);//NaoResolvidos
                    request.setAttribute("produtos", produtos);
                    request.setAttribute("clientes", clientes);
                    request.setAttribute("atendimentos", AtendimentoFacade.listAtendimentosCli(logB.getId()));
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicioFunc.jsp");
                    rd.forward(request, response);
//                } else if (action.equals("show")) {
//                    int id = Integer.parseInt(request.getParameter("id"));
//                    request.setAttribute("c", ClientesFacade.show(id));
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/clientesVisualizar.jsp");
//                    rd.forward(request, response);
//                } else if (action.equals("formUpdate")) {
//                    int id = Integer.parseInt(request.getParameter("id"));                                      
//                    request.setAttribute("form","alterar");
//                    Cliente cli = ClientesFacade.show(id);
//                    request.setAttribute("c", cli);
////                    cli.getId_cidade();
//                    List<EstadoBean> estados = ClientesFacade.buscarEstados();  
//                    List<CidadeBean> cidades = ClientesFacade.buscarCidades(cli.getEstado().getId());
//                    request.setAttribute("estados", estados);
//                    request.setAttribute("cidades", cidades);
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/clientesForm.jsp");
//                    rd.forward(request, response);
//                } else if (action.equals("remove")) {
//                    int id = Integer.parseInt(request.getParameter("id"));
//                    ClientesFacade.remove(id);
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
//                    rd.forward(request, response);
//                } else if (action.equals("update")) {
//                    UsuarioDao cDao = new UsuarioDao();
//                    Cliente c = new Cliente();
//                    String idS = request.getParameter("id");
//                    int convId = Integer.parseInt(idS.trim());
//                    c.setId(convId);
//                    c.setNome(request.getParameter("nome"));
//                    c.setEmail(request.getParameter("email"));
//                    String str = request.getParameter("data");
//                    Date data = null;
//                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//                    data = format.parse(str);
//                    String numS = request.getParameter("nr_cliente");
//                    int numI = Integer.parseInt(numS);
//                    c.setNr_cliente(numI);
//                    c.setRua(request.getParameter("rua"));
//                    c.setCpf(request.getParameter("cpf"));
////                    System.out.println(c.getCpf());
//                    c.setCep(request.getParameter("cep"));
//                    int city = Integer.parseInt(request.getParameter("cidade"));
//                    c.setId_cidade(city);
//                    c.setData(data);
//                    out.println(ClientesFacade.update(c));
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
//                    rd.forward(request, response);
//                } else if (action.equals("formNew")) {
//                    List<EstadoBean> estados = ClientesFacade.buscarEstados();
//                    request.setAttribute("estados", estados);
//                    request.setAttribute("form",null);
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/clientesForm.jsp");
//                    rd.forward(request, response);
//                } else if (action.equals("new")) {
////                    UsuarioDao cDao = new UsuarioDao();
//                    Cliente c = new Cliente();
//                    c.setNome(request.getParameter("nome"));
//                    c.setEmail(request.getParameter("email"));
//                    String str = request.getParameter("data");
//                    Date data = null;
//                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//                    data = format.parse(str);
//                    String numS = request.getParameter("nr_cliente");
//                    int numI = Integer.parseInt(numS);
//                    c.setNr_cliente(numI);
//                    c.setRua(request.getParameter("rua"));
//                    CidadeBean cidade = new CidadeBean();
//                    EstadoBean estado = new EstadoBean();
////                    c.setCidade(request.getParameter("cidade"));
////                    c.setUf(request.getParameter("uf"));
//                    int city = Integer.parseInt(request.getParameter("cidade"));
//                    int est = Integer.parseInt(request.getParameter("estado"));
////                    out.println(city);
////                    out.println(est);                    
////                    cidade.setId(city);
////                    estado.setId(est);
////                    cidade.setEstado(estado);                    
////                    c.setId_cidade(city);
//                    c.setId_cidade(city);
////                    out.println(c.getId_cidade());
//                    c.setCpf(request.getParameter("cpf"));
//                    c.setCep(request.getParameter("cep"));
//                    c.setData(data);
////                    out.println(c.getNome());
//                    ClientesFacade.inserir(c);
//                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
//                    rd.forward(request, response);
//                } else {
//                    out.print("aff  " + action);
//                }
//            }
                }
            }
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

        } catch (SQLException | ParseException ex) {
            Logger.getLogger(ClientesServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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

        } catch (SQLException | ParseException ex) {
            Logger.getLogger(ClientesServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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
