<%-- 
    Document   : atendimento
    Created on : 02/11/2018, 22:23:33
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container" >
            <div class="row">
                <div class="col-md-12">
        <c:choose>
            <c:when test = "${not empty loginBean.nome}">
                <form class="form-group" action="AtendimentoServlet?action=new" method="POST">  
                    <h1 style="text-align: center; color: red">EFETUAR ATENDIMENTO</h1>
                    <div class="row">
                        <!--<label for="id">ID</label>-->
                        <input type="hidden" class="form-control" name="id" value="c.id">
                    </div>
                    <div class="row">
                        <label for="datahora">DATA HORA</label>
                        <input type="text" class="form-control" name="datahora" readonly="readonly" value="${dataDeHoje}">
                    </div>
                    <div class="row">
                        <label for="descricao">descricao</label>
                        <input type="text" class="form-control" name="descricao" value="">
                    </div>
                    <div class="row">
                        <label>PRODUTOS</label><br>
                        <select id="produto" name="produto" required>
                            <c:forEach items="${produtos}" var="x">                            
                                <option value="${x.id_produto}">${x.nome_produto}</option>                            
                            </c:forEach>
                        </select>
                    </div>
                    <div class="row">
                        <label>TIPOS DE ATENDIMENTO</label><br>
                        <select id="ta" name="ta" required>
                            <c:forEach items="${ta}" var="x">                            
                                <option value="${x.id_tipo_atendimento}">${x.nome_tipo_atendimento}</option>                            
                            </c:forEach>
                        </select>
                    </div>
                    <div class="row">
                        <label>CLIENTES</label><br>
                        <select id="clientes" name="clientes" required>
                            <c:forEach items="${clientes}" var="x">                            
                                <option value="${x.id}">${x.nome}</option>                            
                            </c:forEach>
                        </select>
                    </div>
                    <div class="row">
                        <label for="res_atendimento">O atendimento foi resolvido ?</label>
                        <input type="checkbox" id="res_atendimento" name="res_atendimento"/>
                    </div>
                    <input type="submit" class="btn btn-primary" value="SALVAR">
                </form>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
