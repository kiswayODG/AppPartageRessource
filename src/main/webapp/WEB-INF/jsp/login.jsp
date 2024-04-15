<%--
  Created by IntelliJ IDEA.
  User: Ulrich
  Date: 24/05/2023
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link href="webjars/bootstrap/5.2.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="webjars/jquery/3.6.4/jquery.min.js"></script>
  <link href="webjars/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png">
  <title>
    Yaam wek-re
  </title>


  <!--     Fonts and icons     -->
  <!-- link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" /--->

  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/soft-ui-dashboard.css" rel="stylesheet" />
</head>

<body class="">
<div class="container position-sticky z-index-sticky top-0">
  <div class="row">
    <div class="col-12">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg blur blur-rounded top-0 z-index-3 shadow position-absolute my-3 py-2 start-0 end-0 mx-4">
        <div class="container-fluid">


          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav mx-auto">

                <a class="nav-link me-2" href="/registration">
                  <i class="fas fa-user-circle opacity-8 text-dark me-1"></i>
                  S'inscrire
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link me-2" href="/login">
                  <i class="fas fa-key opacity-6 text-dark me-1"></i>
                  Se connecter
                </a>
              </li>
            </ul>
            <ul class="navbar-nav d-lg-block d-none">
              <li class="nav-item">
                <a href="https://www.creative-tim.com/product/soft-ui-dashboard" class="btn btn-sm btn-round mb-0 me-1 bg-gradient-dark">Contact</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
    </div>
  </div>
</div>
<main class="main-content  mt-0">
  <section>
    <div class="page-header min-vh-75">
      <div class="container">
        <div class="row">
          <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
            <div class="card card-plain mt-8">
              <div class="card-header pb-0 text-left bg-transparent">
                <h3 class="font-weight-bolder text-info text-gradient">Bienvenue sur Yaam-Wek-re</h3>
                <p class="mb-0 ">Entrer votre mot de passe et login pour vous connecter</p>
              </div>
              <div class="card-body">
                <div class="form-group alert-warning border-radius-2xl p-2 text-white text-center">

                  <c:if test="${not empty error}">
                    <div class="error-message">
                        ${error}
                    </div>
                  </c:if>
                </div>

                <form method="POST" action="/login">
                  <label>Login (INE )</label>
                  <div class="mb-3">
                    <input type="text" class="form-control" placeholder="INE" name="login" aria-label="text" aria-describedby="text-addon">
                  </div>
                  <label>Password</label>
                  <div class="mb-3">
                    <input type="password" class="form-control" name="password" placeholder="Password" aria-label="Password" aria-describedby="password-addon">
                  </div>

                  <input type="hidden" path="${_csrf.parameterpath}" value="${_csrf.token}"/>


                  <div class="text-center">
                    <button type="submit" class="btn bg-gradient-info w-100 mt-4 mb-0">Se connecter </button>
                  </div>
                </form>

              </div>
              <div class="card-footer text-center pt-0 px-lg-2 px-1">
                <p class="mb-4 text-sm mx-auto">
                  N'avez vous pas de compte
                  <a href="/registration" class="text-info text-gradient font-weight-bold">S'inscrire</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8">
              <div class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n6" style="background-image:url('assets/img/curved-images/curved6.jpg')"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
<footer class="footer py-5">

    <div class="row">
      <div class="col-8 mx-auto text-center mt-1">
        <p class="mb-0 text-secondary">
          Copyright © <script>
          document.write(new Date().getFullYear())
        </script> Yaam wek-re Team
        </p>
      </div>
    </div>
  </div>
</footer>
<!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
<!--   Core JS Files   -->
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>

</html>