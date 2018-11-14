<%-- 
    Document   : inicioProd
    Created on : 13/11/2018, 21:12:34
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
            location.href = "ProdutoServlet?action=remover&id=" + id + "";
        }
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h1>Hello World!</h1<c:choose>
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
                            <th scope="col">NOME DO PRODUTO</th>                            
                            <th scope="col">DESCRICAO</th>                            
                            <th scope="col">PESO</th>                            
                            <th scope="col">CATEGORIA</th>                            
                            <th scope="col">x</th>                            
                            <th scope="col">x</th>                            
                            <th scope="col">x</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${produtos}" var="x" varStatus="theCount">
                            <tr>
                                <td>${x.nome_produto}</td>                                
                                <td>${x.descricao_produto}</td>                                
                                <td>${x.peso_produto}</td>                                
                                <td>${categorias[theCount.index]}</td>                                
                                <td><a href="ProdutoServlet?action=show&id=${x.id_produto}"><button class="btn btn-primary">Visualizar</button></a></td>
                                <td><a href="ProdutoServlet?action=formUpdate&id=${x.id_produto}"><button class="btn btn-primary">Alterar</button></a></td>
                                <td><a href="javascript: confirmaExclusao(${x.id_produto});"><button class="btn btn-primary">Remover</button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="ProdutoServlet?action=formNew"><button class="btn btn-primary">NOVO</button></a>
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
