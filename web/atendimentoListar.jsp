<%-- 
    Document   : atendimentoListar
    Created on : 02/11/2018, 22:24:00
    Author     : sa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <c:choose>
        <c:when test = "${not empty loginBean.nome}">
            <body>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">data/hora</th>
                            <th scope="col">produto</th>
                            <th scope="col">cliente</th>
                            <th scope="col">x</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${atendimentos}" var="x" varStatus="theCount">
                            <tr>
                                <td><fmt:formatDate value="${x.dt_hr_atendimento}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td>${produtos[theCount.index]}</td>
                                <td>${clientes[theCount.index]}</td>
                                <td><a href="AtendimentoServlet?action=show&id_atendimento=${x.id_atendimento}"><button class="btn btn-primary">Detalhes</button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="portal.jsp" class="btn btn-danger"> Voltar </a>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
        <br/>
        <br/>        
    </body>
</html>-->
