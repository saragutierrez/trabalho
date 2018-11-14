<%-- 
    Document   : atendimentoDetalhes
    Created on : 02/11/2018, 22:25:18
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="erro.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>    
        <c:choose>
            <c:when test = "${not empty loginBean.nome}"> 
                <c:choose>
                    <c:when test =  "${loginBean.tipo == 'F'}">
                        <c:if test= "${resolver == 'resolver'}">
                            <h1 style="text-align: center; color: red">RESOLVER</h1>
                        </c:if>
                        <c:if test= "${resolver == null}">
                            <h1 style="text-align: center; color: red">VISUALIZAR DETALHES</h1>
                        </c:if>
                    </c:when>
                </c:choose>
                <c:if test= "${loginBean.tipo == 'C'}">
                    <h1 style="text-align: center; color: red">VISUALIZAR DETALHES</h1>
                </c:if>                
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">data/hora</th>
                            <th scope="col">cliente</th>
                            <th scope="col">situacao</th>
                            <th scope="col">descricao</th>
                            <th scope="col">solucao</th>                            
                            <th scope="col">produtos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><fmt:formatDate value="${x.dataHora}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                            <td>${cliente}</td>
                            <td>${x.situacao}</td>
                            <td>${x.descricao}</td>
                            <td>${x.solucao}</td>
                            <td>${produto}</td>                            
                        </tr>              
                    </tbody>
                </table>
                <c:choose>
                    <c:when test =  "${loginBean.tipo == 'F'}">
                        <c:if test= "${resolver == 'resolver'}">
                            <form class="form-group" action="AtendimentoServlet?action=resolver&id=${x.id_atendimento}" method="POST"> 
                                <div class="row">
                                    <label for="solucao"> Solucao</label>
                                    <input type="text" class="form-control" name="solucao" value="">
                                </div> 
                                 <input type="submit" class="btn btn-primary" value="RESOLVER">
                            </form>
                        </c:if>
                    </c:when>
                </c:choose>
                <br/>
                <br/> 
                <c:if test= "${loginBean.tipo == 'C'}">
                    <a href="ClientesServlet?action=list"><button class="btn btn-primary">VOLTAR</button></a>
                </c:if>
                <c:if test= "${loginBean.tipo == 'F'}">
                    <a href="FuncionarioServlet?action=list"><button class="btn btn-primary">VOLTAR</button></a>
                </c:if>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
