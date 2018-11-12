<%-- 
    Document   : listFuncionarios
    Created on : 11/11/2018, 14:57:53
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<!DOCTYPE html>
<script>
    function confirmaExclusao(id) {
        if (confirm("Deseja mesmo apagar o registro de " + id + "?")) {
            // Faz o processamento necessário para exclusão
            location.href = "GerenteServlet?action=remove&id=" + id + "";
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
                            <th scope="col">NOME</th>
                            <th scope="col">TIPO</th>
                            <th scope="col">CPF</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">TEL</th>
                            <!--                            <th scope="col">RUA</th>
                                                        <th scope="col">Nº CASA</th>
                                                        <th scope="col">COMPLEMENTO</th>
                                                        <th scope="col">CEP</th>-->
                            <th scope="col">CIDADE</th>
                            <th scope="col">ESTADO</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lista}" var="x">
                            <tr>
                                <td>${x.nome}</td>
                                <td>${x.tipo}</td>
                                <td>${x.cpf}</td>
                                <td>${x.email}</td>
                                <td>${x.tel}</td>
<!--                                <td>${x.rua}</td>
                                <td>${x.nr_casa}</td>
                                <td>${x.complemento}</td>
                                <td>${x.cep}</td>-->
                                <td>${x.cidade.nome}</td>
                                <td>${x.estado.sigla}</td>
                                <td><a href="GerenteServlet?action=show&id=${x.id}"><button class="btn btn-primary">Visualizar</button></a></td>
                                <td><a href="GerenteServlet?action=formUpdate&id=${x.id}"><button class="btn btn-primary">Alterar</button></a></td>
                                <td><a href="javascript: confirmaExclusao(${x.id});"><button class="btn btn-primary">Remover</button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="GerenteServlet?action=formNew"><button class="btn btn-primary">NOVO</button></a>
                <a href="GerenteServlet?action=list"><button class="btn btn-danger">VOLTAR</button></a>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
