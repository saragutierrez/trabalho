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
                <h1 style="text-align: center; color: red">VISUALIZAR DETALHES</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">data/hora</th>
                            <th scope="col">Descricao</th>
                            <th scope="col">CLIENTE</th>
                            <th scope="col">Res Atendimento</th>
                            <th scope="col">Produto</th>
                            <th scope="col">Tipo atendimento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><fmt:formatDate value="${c.dt_hr_atendimento}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                            <td>${c.dsc_atendimento}</td>
                            <td>${cliente}</td>
                            <td>${c.res_atendimento}</td>
                            <td>${produto}</td>
                            <td>${tipoA}</td>                                  
                        </tr>              
                    </tbody>
                </table>
                <br/>
                <br/>        
                <a href="AtendimentoServlet?action=list"><button class="btn btn-primary">VOLTAR</button></a>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
