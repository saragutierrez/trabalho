<%-- 
    Document   : catList
    Created on : 11/11/2018, 18:19:25
    Author     : sa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    function confirmaExclusao(id) {
        if (confirm("Deseja mesmo apagar o registro com código " + id + "?")) {
            // Faz o processamento necessário para exclusão
            location.href = "FuncionarioServlet?action=remove&id=" + id + "";
        }
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <c:choose>
        <c:when test = "${not empty loginBean.nome}">
            <c:if test="${!empty param.msg}">
                <div class="alert alert-danger" role="alert"><h2 style= color:red;text-align:center>${param.msg}</h2></div>
                </c:if>
                <c:if test="${!empty requestScope.msg}">
                <div class="alert alert-danger" role="alert"><h2 style= color:red;text-align:center>${requestScope.msg}</h2></div>
                </c:if>
            <body>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">NOME DA CATEGORIA</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${categorias}" var="x">
                            <tr>
                                <td>${x.nome_categoria}</td>                                
                                <td><a href="FuncionarioServlet?action=show&id=${x.id_categoria}"><button class="btn btn-primary">Visualizar</button></a></td>
                                <td><a href="FuncionarioServlet?action=catUpdate&id=${x.id_categoria}"><button class="btn btn-primary">Alterar</button></a></td>
                                <td><a href="javascript: confirmaExclusao(${x.id_categoria});"><button class="btn btn-primary">Remover</button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="FuncionarioServlet?action=formNew"><button class="btn btn-primary">NOVO</button></a>
                <a href="FuncionarioServlet?action=list"><button class="btn btn-danger">VOLTAR</button></a>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
