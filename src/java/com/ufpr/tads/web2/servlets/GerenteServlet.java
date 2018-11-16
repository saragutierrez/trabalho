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
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.beans.UsuarioBean;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
import com.ufpr.tads.web2.facade.UsuarioFacade;
import com.ufpr.tads.web2.exceptions.SessaoNaoEncontradaException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "GerenteServlet", urlPatterns = {"/GerenteServlet"})
public class GerenteServlet extends HttpServlet {

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
            try{
                HttpSession session = request.getSession();
                UsuarioBean logB = (UsuarioBean) session.getAttribute("loginBean");
                String action = request.getParameter("action");
                String nomeLog;
                try{
                    nomeLog = logB.getNome();
                }catch(NullPointerException e){
                    throw new SessaoNaoEncontradaException("Nenhum cadastro efetuado!");
                }
                if ((isNullOrEmpty(action)) || action.equals("list")) {
                    request.setAttribute("totAtendimentos", AtendimentoFacade.list().size());
                    request.setAttribute("totAtendimentosAbertos", AtendimentoFacade.buscarAtendimentosNaoResolvidos().size());
                    List<TipoAtendimento> atendimentosT = AtendimentoFacade.buscarTiposAtendimento();
                    request.setAttribute("atendimentosT", atendimentosT);
                    List<Integer> tot = new ArrayList<>();
                    List<Integer> totA = new ArrayList<>();
                    for (TipoAtendimento a : atendimentosT) {
                        int totalAberto = AtendimentoFacade.buscarAtendimentosNaoResolvidosPorTipo(a.getId_tipoAt()).size();
                        int total = AtendimentoFacade.buscarAtendimentosPorTipo(a.getId_tipoAt()).size();

                        totA.add(totalAberto);
                        tot.add(total);
                    }
                    request.setAttribute("tot", tot);
                    request.setAttribute("totA", totA);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicioGerente.jsp");
                    rd.forward(request, response);
                } else if (action.equals("remove")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    if (logB.getId() == id) {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/GerenteServlet?action=listFuncionarios");
                        request.setAttribute("msg", "PROIBIDO A EXCLUSAO DO USUARIO QUE ESTÁ LOGADO");
                        rd.forward(request, response);
                    } else {
                        UsuarioFacade.remove(id);
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/GerenteServlet?action=listFuncionarios");
                        rd.forward(request, response);
                    }
                } else if (action.equals("todosAtendimentosNaoResolvidos")) {
    //TODO Se o atendimento estiver há mais de uma semana em aberto, deve ser mostrado em vermelho, indicando criticidade.

                    List<Atendimento> atendimentos = AtendimentoFacade.buscarAtendimentosNaoResolvidos();
                    List<String> produtos = new ArrayList<>();
                    List<String> clientes = new ArrayList<>();
                    for (Atendimento a : atendimentos) {
                        String p = AtendimentoFacade.buscarProduto(a.getId_produto()).getNome_produto();
                        String c = UsuarioFacade.show(a.getId_cliente()).getNome();
                        produtos.add(p);
                        clientes.add(c);
                    }
                    request.setAttribute("atendimentos", atendimentos); //NAO RESOLVIDOS
                    request.setAttribute("produtos", produtos);
                    request.setAttribute("clientes", clientes);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicioFunc.jsp");
                    rd.forward(request, response);

                } else if (action.equals("todosAtendimentos")) {
    //TODO Se o atendimento estiver há mais de uma semana em aberto, deve ser mostrado em vermelho, indicando criticidade.
                    List<Atendimento> atendimentos = AtendimentoFacade.list();
                    List<String> produtos = new ArrayList<>();
                    List<String> clientes = new ArrayList<>();
                    for (Atendimento a : atendimentos) {
                        String p = AtendimentoFacade.buscarProduto(a.getId_produto()).getNome_produto();
                        String c = UsuarioFacade.show(a.getId_cliente()).getNome();
                        produtos.add(p);
                        clientes.add(c);
                    }
                    request.setAttribute("atendimentos", atendimentos);
                    request.setAttribute("produtos", produtos);
                    request.setAttribute("clientes", clientes);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicioFunc.jsp");
                    rd.forward(request, response);

                } else if (action.equals("formUpdate")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("form", "alterar");
                    UsuarioBean u = UsuarioFacade.show(id);
                    request.setAttribute("c", u);
                    List<EstadoBean> estados = UsuarioFacade.buscarEstados();
                    List<CidadeBean> cidades = UsuarioFacade.buscarCidades(u.getEstado().getId());
                    request.setAttribute("estados", estados);
                    request.setAttribute("cidades", cidades);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/usuarioForm.jsp");
                    rd.forward(request, response);

                } else if (action.equals("update")) {
                    UsuarioBean c = new UsuarioBean();
                    String idS = request.getParameter("id");
                    int convId = Integer.parseInt(idS.trim());
                    c.setId(convId);
                    c.setNome(request.getParameter("nome"));
                    c.setCpf(request.getParameter("cpf"));
                    c.setEmail(request.getParameter("email"));
                    c.setTel(request.getParameter("tel"));
                    c.setRua(request.getParameter("rua"));
                    String numS = request.getParameter("nr_cliente");
                    c.setComplemento(request.getParameter("complemento"));
                    c.setCep(request.getParameter("cep"));
                    int numI = Integer.parseInt(numS);
                    c.setNr_casa(numI);
                    CidadeBean cidade = new CidadeBean();
                    EstadoBean estado = new EstadoBean();
                    int city = Integer.parseInt(request.getParameter("cidade"));
                    cidade.setEstado(estado);
                    c.setId_cidade(city);
                    c.setTipo(request.getParameter("tipo"));
    //                c.setSenha(request.getParameter("senha"));
                    UsuarioFacade.update(c);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/GerenteServlet?action=listFuncionarios");
                    rd.forward(request, response);

                } else if (action.equals("listFuncionarios")) {
                    request.setAttribute("lista", UsuarioFacade.buscarTodosFuncionarios());
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/listFuncionarios.jsp");
                    rd.forward(request, response);

                } else if (action.equals("show")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("x", UsuarioFacade.show(id));
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/visualizarFunc.jsp");
                    rd.forward(request, response);

                } else if (action.equals("formNew")) {
                    List<EstadoBean> estados = UsuarioFacade.buscarEstados();
                    request.setAttribute("estados", estados);
                    request.setAttribute("form", null);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/usuarioForm.jsp");
                    rd.forward(request, response);

                } else if (action.equals("new")) {
                    UsuarioBean c = new UsuarioBean();
                    c.setNome(request.getParameter("nome"));
                    c.setCpf(request.getParameter("cpf"));
                    c.setEmail(request.getParameter("email"));
                    c.setTel(request.getParameter("tel"));
                    c.setRua(request.getParameter("rua"));
                    String numS = request.getParameter("nr_cliente");
                    c.setComplemento(request.getParameter("complemento"));
                    c.setCep(request.getParameter("cep"));
                    int numI = Integer.parseInt(numS);
                    c.setNr_casa(numI);
                    CidadeBean cidade = new CidadeBean();
                    EstadoBean estado = new EstadoBean();
                    int city = Integer.parseInt(request.getParameter("cidade"));
                    cidade.setEstado(estado);
                    c.setId_cidade(city);
                    c.setTipo(request.getParameter("tipo"));
                    c.setSenha(request.getParameter("senha"));
                    UsuarioFacade.inserir(c);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/GerenteServlet?action=listFuncionarios");
                    rd.forward(request, response);
                }
            }catch(SessaoNaoEncontradaException e){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", e.getLocalizedMessage());
                rd.forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(GerenteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GerenteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
