<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty param.msg}">
    <div class="alert alert-danger" role="alert"><h2 style= color:red;text-align:center>${param.msg}</h2></div>
</c:if>
<c:if test="${!empty requestScope.msg}">
    <div class="alert alert-danger" role="alert"><h2 style= color:red;text-align:center>${requestScope.msg}</h2></div>
</c:if>


<html>
    <head>
        <title>Login</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head> 
    <body>
        <form action="LoginServlet" method="POST">

            <div class="form-group">
                <label for="name">Login</label>
                <input type="text" maxlength="100" class="form-control" name="login" placeholder="login" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha</label>
                <input type="password" maxlength="50" class="form-control" name="senha" aria-describedby="senhaHelp" placeholder="senha" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>   <br/> 
        <footer>
            <div class="alert alert-success" role="alert" style="text-align: center">                 
                <h4>Em caso de problemas contactar a administradora: ${configuracao.email}</h4>
            </div>
            
        </footer>
    </body>
</html>
