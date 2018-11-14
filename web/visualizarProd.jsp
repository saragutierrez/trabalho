<%-- 
    Document   : visualizarProd
    Created on : 13/11/2018, 22:03:09
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1 style="text-align: center; color: red">VISUALIZAR PRODUTO</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">NOME DO PRODUTO</th>                            
                            <th scope="col">DESCRICAO</th>                            
                            <th scope="col">PESO</th>                            
                            <th scope="col">CATEGORIA</th>                 
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${x.nome_produto}</td>                                
                            <td>${x.descricao_produto}</td>                                
                            <td>${x.peso_produto}</td>                     
                            <td>${cat}</td>                     
                        </tr>              
                    </tbody>
                </table>
                <br/>
                <br/>        
                <a href="FuncionarioServlet?action=listCat"><button class="btn btn-danger">VOLTAR</button></a>
            </x:when>
            <x:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </x:otherwise>
        </x:choose>
    </body>
</html>
