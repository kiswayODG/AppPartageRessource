 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
 <%@ page contentType="text/html; charset=UTF-8" %>

<html lang="fr">
  <head>
      <meta charset="utf-8">
      <title>Création de compte</title>
      <link href="webjars/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">

  </head>

  <body>

<div class="login-form">
<c:if test="${not empty errorMsg}">
	<div class="alert alert-danger" role="alert">${errorMsg}</div>
</c:if>
	
    <div class="container-fluid">

        <form:form method="POST"  modelAttribute="user" class="form-signin">
            <h3 class="form-signin-heading">Création de compte</h3>
            

                <div class="form-group mb-3 w-25">
                    <form:input path="nom" class="form-control" autofocus="true" required="true" placeholder="Nom"/>
                </div>

                <div class="form-group   mb-3 w-25">
                    <form:input type="text" path="prenom" class="form-control"
                    autofocus="true" required="true" placeholder="Prenom"/>
                </div>


                <div class="form-group   mb-3 w-25">
                    <form:input type="date" path="dateNaiss" class="form-control"
                     autofocus="true" required="true" placeholder="Date de naissance"/>
                </div>

                   <div class="form-group   mb-3 w-25">
                         <form:input type="text" path="adress" class="form-control"
                         autofocus="true" required="true" placeholder="Lieu de résidence (Adresse)"/>
                   </div>

 <div class="form-group   mb-3 w-25">
                 <form:select path="filiere" class="form-control" placeholder="Choisir une filière" required="true">
                  <option value="">Choisir une filière</option>
                    <c:forEach items="${Listfilieres}" var="filiere">
                      <option value="${filiere.id}">${filiere.libelle}</option>
                    </c:forEach>
                  </form:select>

 </div>
                       <div class="form-group   mb-3 w-25">
                             <form:input type="text" path="ine" class="form-control"
                             autofocus="true" required="true" placeholder="INE (ID d'étudiant)"/>
                       </div>

                <div class="form-group   mb-3 w-25">
                    <form:input type="email" path="email" class="form-control" required="true" placeholder="Email (Login)"/>
                </div>


                <div class="form-group   mb-3 w-25">
                    <form:input type="password" path="password" class="form-control" required="true" placeholder="Mot de passe"/>
                </div>


                <div class="form-group  mb-3 w-25">
                    <form:input type="password" path="passwordConfirm" class="form-control" required="true" placeholder="Confirmer mot de passe"/>

                </div>
        

            <form:button class="btn  btn-primary" type="submit">Valider</form:button>
        </form:form>

    </div>
    </div>

    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
     <script src="webjars/bootstrap/5.0.0/js/bootstrap.min.js"></script>
  </body>
</html>