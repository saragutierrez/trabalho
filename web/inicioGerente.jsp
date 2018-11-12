<%-- 
    Document   : inicioGerente
    Created on : 10/11/2018, 23:28:50
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<!DOCTYPE html>
<!--TODO 1 A quantidade de atendimentos em aberto (e a porcentagem em relação ao total); -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>

        <c:choose>
            <c:when test = "${not empty loginBean.nome}">
                   
                <h1>FALTA FAZER OS RELATORIOS </h1>
                <h4>A quantidade de atendimentos efetuados até o momento: ${totAtendimentos}</h4>
                <h4>A quantidade de atendimentos abertos: ${totAtendimentosAbertos} </h4> <!-- //TODO 1 colocar a %-->
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">TIPOS ATENDIMENTOS</th>
                            <th scope="col">atendimentos em aberto desta categoria/total de atendimentos desta categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${atendimentosT}" var="x" varStatus="theCount">
                            <tr>
                                <td>${x.nome_tipoAt}</td>                                
                                <td>${totA[theCount.index]}/${tot[theCount.index]}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            <td><a class="btn btn-primary"  href="GerenteServlet?action=listFuncionarios" role="button">Gerenciar Funcionarios</a></td>   
            <td><a class="btn btn-primary"  href="GeradorRelatorio?action=todosAtendimentosResolvidos" role="button">Relatorio de funcionario</a></td>   
            <td><a class="btn btn-primary"  href="GeradorRelatorio?action=todosAtendimentosResolvidos" role="button">Relatorio de Produtos Mais Reclamados</a></td>   
            <td><a class="btn btn-primary"  href="GeradorRelatorio?action=todosAtendimentosResolvidos" role="button">Relatorio de Atendimentos em Aberto Por Data</a></td>   
            <td><a class="btn btn-primary"  href="GeradorRelatorio?action=todosAtendimentosResolvidos" role="button">Relatorio de Reclamaçõess</a></td>   
            <td><a class="btn btn-primary"  href="GerenteServlet?action=todosAtendimentosNaoResolvidos" role="button">Listagem de todos os atendimentos em Aberto</a></td>   
            <td><a class="btn btn-primary"  href="GerenteServlet?action=todosAtendimentos" role="button">Listagem de todos os atendimentos</a></td>   
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
</html>
