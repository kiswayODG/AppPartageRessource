 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
  <head>
      <meta charset="utf-8">
      <title>Connecter votre compte</title>
      <link href="webjars/bootstrap/5.2.0/css/bootstrap.min.css" rel="stylesheet">
      <style>
      .login-form{
      width: 400px;
      height: 250px;
      position: absolute;
      background-color: black;
      top: 50%;
      left: 50%;
      margin-right: -50%;
      transform: translate(-50%, -50%);
      }
      </style>
  </head>

  <body>


<div class="login-form">
    <div class="container-fluid">
      <form method="POST" action="/login" class="form-signin">
        <h3 class="text-center">Connexion</h3>

        <div class="form-group">

           <c:if test="${not empty error}">
               <div class="error-message">
                   ${error}
               </div>
           </c:if>

            <input name="login"  type="text" class="form-control mb-3 mt-4" placeholder="Login (INE)"
                   autofocus="true"/>
            <input name="password"  type="password" class="form-control  mb-3" placeholder="Password"/>

            <input type="hidden" path="${_csrf.parameterpath}" value="${_csrf.token}"/>

            <button class="btn btn-dark  mt-3 " type="submit">Se connecter</button>
           <a href="/registration"> <button class="btn btn-success text-center mt-3 ms-3" path="inscription" type="button" >S'inscrire</button></a>
        </div>
      </form>
    </div>
</div>

    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
  </body>
</html>