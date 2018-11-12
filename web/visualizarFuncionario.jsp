<%-- 
    Document   : clientesVisualizar
    Created on : 20/09/2018, 21:39:34
    Author     : sa
--%>

<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="erro.jsp"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body> 
        <x:choose>
            <x:when test = "${not empty loginBean.nome}">        
                <h1 style="text-align: center; color: red">VISUALIZAR CLIENTE</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">NOME</th>
                            <th scope="col">TIPO</th>
                            <th scope="col">CPF</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">TEL</th>
                            <th scope="col">RUA</th>
                            <th scope="col">Nº CASA</th>
                            <th scope="col">COMPLEMENTO</th>
                            <th scope="col">CEP</th>
                            <th scope="col">CIDADE</th>
                            <th scope="col">ESTADO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${x.nome}</td>
                            <td>${x.tipo}</td>
                            <td>${x.cpf}</td>
                            <td>${x.email}</td>
                            <td>${x.tel}</td>
                            <td>${x.rua}</td>
                            <td>${x.nr_casa}</td>
                            <td>${x.complemento}</td>
                            <td>${x.cep}</td>
                            <td>${x.cidade.nome}</td>
                            <td>${x.estado.sigla}</td>
                        </tr>              
                    </tbody>
                </table>
                <br/>
                <br/>        
                <a href="GerenteServlet?action=listFuncionarios"><button class="btn btn-danger">VOLTAR</button></a>
            </x:when>
            <x:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </x:otherwise>
        </x:choose>
    </body>
</html>
