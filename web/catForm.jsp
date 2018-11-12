<%-- 
    Document   : catForm
    Created on : 11/11/2018, 19:49:15
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="erro.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" >
            <div class="row">
                <div class="col-md-12">
                    <c:choose>
                        <c:when test = "${not empty loginBean.nome}">                            
                            <c:if test = "${form == 'alterar'}">
                                <form class="form-group" action="FuncionarioServlet?action=update" method="POST">  
                                    <h1 style="text-align: center; color: red">ALTERAR CATEGORIA</h1>
                                </c:if>
                                <c:if test = "${form == null}">
                                    <form class="form-group" action="FuncionarioServlet?action=new" method="POST">  
                                        <h1 style="text-align: center; color: red">CADASTRAR CATEGORIA</h1>
                                    </c:if>
                                    <div class="row">
                                        <!--<label for="id">ID</label>-->
                                        <input type="hidden" class="form-control" name="id" value="${form == "alterar" ? c.id_cat : ""}">
                                    </div>
                                    <div class="row">
                                        <label for="name">NOME</label>
                                        <input required type="text" class="form-control" name="nome" value="${form == "alterar" ? c.nome_cat : ""}" placeholder="Ex.: Cabelo">
                                    </div>                                                     

                                    <input type="submit" class="btn btn-primary" value="${form == "alterar" ? "ALTERAR" : "SALVAR"}">

                                </form>
                                <a href="FuncionarioServlet?action=listCat" class="btn btn-danger"> CANCELAR </a>
                            </c:when>
                            <c:otherwise>
                                <jsp:forward page="index.jsp">
                                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                                </jsp:forward>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </div>
    </body>
</html>
