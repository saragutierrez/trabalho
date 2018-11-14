<%-- 
    Document   : inicioFunc
    Created on : 10/11/2018, 13:56:55
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--TODO Se o atendimento estiver há mais de uma semana em aberto, deve ser mostrado em vermelho, indicando criticidade.
TODO Tela de resolucao,Listagem de todos os atendimentos, cad de produto, cad de categoria -->
<script>
    function confirmaExclusao(id) {
        if (confirm("Deseja mesmo apagar o registro com código " + id + "?")) {
            // Faz o processamento necessário para exclusão
            location.href = "AtendimentoServlet?action=remover&id=" + id + "";
        }
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cli list</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h4>TELA COMPARTILHADA POR FUNCIONARIO,GERENTE E CLIENTE <br> 
            DEPENDE DO PARAMETRO PASSADO ACESSA ATENDIMENTOS Ñ RESOLVIDOS OU RESOLVIDOS<br>
            FALTA MUDAR A COR PARA VERMELHO QUANDO ABERTO A MAIS DE UMA SEMANA<br>
        </h4>
        <c:choose>
            <c:when test = "${not empty loginBean.nome}">
            <body>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">data/hora</th>
                            <th scope="col">cliente</th>
                            <th scope="col">situacao</th>
                            <th scope="col">descricao</th>
                            <th scope="col">solucao</th>                            
                            <th scope="col">produtos</th>
                            <th scope="col">x</th>
                            <th scope="col">x</th>
                        </tr>
                    </thead>
                    <tbody>                        
                        <c:forEach items="${atendimentos}" var="x" varStatus="theCount">
                            <tr>
                                <c:if test= "${x.dataHora!= 'G'}">

                                </c:if>
                                <td><fmt:formatDate value="${x.dataHora}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td>${clientes[theCount.index]}</td>
                                <td>${x.situacao}</td>
                                <td>${x.descricao}</td>
                                <td>${x.solucao}</td>
                                <td>${produtos[theCount.index]}</td>
                                <c:if test= "${loginBean.tipo != 'G'}">
                                    <td><a href="AtendimentoServlet?action=show&id=${x.id_atendimento}"><button class="btn btn-primary">VER TUDO</button></a></td>
                                </c:if>
                                    <c:choose>
                                    <c:when test =  "${loginBean.tipo == 'F'}">
                                        <c:if test= "${x.situacao == 'aberto'}">
                                            <!--SEABERTO-->  <td><a href="AtendimentoServlet?action=formResolver&id=${x.id_atendimento}"><button class="btn btn-danger">RESOLVER</button></a></td>
                                        </c:if>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test =  "${loginBean.tipo == 'C'}">
                                        <c:if test= "${x.situacao == 'aberto'}">
                                            <!--SEABERTO-->  <td><a href="javascript: confirmaExclusao(${x.id_atendimento});"><button class="btn btn-danger">remover</button></a></td>
                                        </c:if>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test= "${loginBean.tipo == 'F'}"> 
                    <!--//PARA OCULTAR OS BOTOES QUANDO O GERENTE ACESSA ESSA TELA-->
                    <a href="GerenteServlet?action=todosAtendimentos"><button class="btn btn-primary">Listagem de todos os atendimentos</button></a>
                    <a href="FuncionarioServlet?action=listCat"><button class="btn btn-primary">Gerenciar Categorias</button></a>
                    <a href="ProdutoServlet?action=list"><button class="btn btn-primary">Gerenciar Produtos</button></a>
                    <a href="FuncionarioServlet?action=list"><button class="btn btn-danger">VOLTAR</button></a>
                </c:if>
                <c:if test= "${loginBean.tipo == 'G'}">
                    <a href="GerenteServlet?action=list"><button class="btn btn-danger">VOLTAR</button></a>
                </c:if>
                <c:if test= "${loginBean.tipo == 'C'}">
                    <a href="AtendimentoServlet?action=formNew"><button class="btn btn-primary">CRIAR ATENDIMENTO</button></a>
                    <a href="ClientesServlet?action=formUpdate&id=${loginBean.id}"><button class="btn btn-primary">alterar dados cadastrais</button></a>
                    <a href="LogoutServlet"><button class="btn btn-danger">SAIR</button></a>
                </c:if>
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema!"/> 
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>
