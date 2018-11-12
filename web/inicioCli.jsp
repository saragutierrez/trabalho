<%-- 
    Document   : x
    Created on : 11/11/2018, 22:22:32
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <body>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">data/hora</th>
                            <th scope="col">cliente</th>
                            <th scope="col">situacao</th>
                            <th scope="col">descricao</th>
                            <th scope="col">solucao</th>                            
                            <th scope="col">produtos</th>                            
                            <th scope="col">x</th>
                            <th scope="col">x</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${atendimentos}" var="x" varStatus="theCount">
                            <tr>
                                <td><fmt:formatDate value="${x.dataHora}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td>${clientes[theCount.index]}</td>
                                <td>${x.situacao}</td>
                                <td>${x.descricao}</td>
                                <td>${x.solucao}</td>
                                <td>${produtos[theCount.index]}</td>                                
                                    <td><a href="algumaServlet?action=show&id=${x.id_atendimento}"><button class="btn btn-primary">tela de resolucao</button></a></td>
              <!--SEABERTO-->       <td><a href="algumaServlet?action=remover&id=${x.id_atendimento}"><button class="btn btn-primary">remover</button></a></td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                    <a href="GerenteServlet?action=todosAtendimentos"><button class="btn btn-primary">ALTERAR DADOS</button></a>
                    <a href="FuncionarioServlet?action=listCat"><button class="btn btn-primary">CRIAR ATENDIMENTO</button></a>
                    <!--<a href="ClientesServlet?action=list"><button class="btn btn-danger">VOLTAR</button></a>-->
               
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
