<%--
  Created by IntelliJ IDEA.
  User: Ulrich
  Date: 29/05/2023
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <script src="webjars/jquery/3.0.6/jquery.min.js"></script>
    <link href="webjars/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png">
    <title>
        Yaam wek-re
    </title>


    <!--     Fonts and icons     -->
    <!-- link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" /--->


    <!-- CSS Files -->
    <link id="pagestyle" href="assets/css/soft-ui-dashboard.css" rel="stylesheet" />
    <link href="webjars/bootstrap/5.2.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="g-sidenav-show  bg-gray-100">
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="#" target="_blank">
            <img src="assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
            <span class="ms-1 font-weight-bold">Yaam Wek-re</span>
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100 h-100" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link " href="/accueil">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-users opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">La communauté</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  " href="/userDocs?id=${loggedInUser.id}">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-swatchbook opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">Mes documents</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/docDispos?id=${loggedInUser.id}">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">

                        <i class="fas fa-book opacity-10" style="color: black;"></i>

                    </div>
                    <span class="nav-link-text ms-1">Documents disponibles</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link active " href="/archives">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-archive opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">Documents archivés</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Mon espace emprunt</h6>
            </li>
            <li class="nav-item">
                <a class="nav-link  " href="/emprunt.enCours">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-edit opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">En cours</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  " href="/emprunt.historique">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-history opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">Historique</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  " href="/logout">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-sign-out-alt opacity-10" style="color: black;"></i>
                    </div>
                    <span class="nav-link-text ms-1">Se deconnecter</span>
                </a>
            </li>
        </ul>
    </div>

</aside>
<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">

                <h6 class="font-weight-bolder mb-0">Mes Documents Archivés</h6>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">

                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1"></i>
                            <span class="d-sm-inline d-none">${loggedInUser.prenom}</span>
                        </a>
                    </li>
                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header pb-0">
                        <h6>Documents</h6>
                    </div>
                    <div class="card-body px-0 pt-0 pb-2">
                        <div class="table-responsive  p-0">
                            <table class="table align-items-center mb-0" id="dataTable" >
                                <thead>
                                <tr>
                                    <th>
                                        <p  class=" font-weight-bolder opacity-8">Titre</p>
                                        <p class="text-xs text-secondary mb-0" style="position:relative; bottom:10px;">Autheurs</p>
                                    </th>

                                    <th class=" font-weight-bolder opacity-8">Domaine</th>
                                    <th class="text-center font-weight-bolder opacity-8">Etat</th>
                                    <th class="text-center font-weight-bolder opacity-8">Type</th>
                                    <th class="text-center font-weight-bolder opacity-8">Statut</th>
                                    <th class="text-center font-weight-bolder opacity-8">Actions</th>
                                </tr>
                                </thead>
                                <tbody id="table-body">
                                <c:forEach items="${documents}" var="doc">
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${doc.titre}</h6>
                                                    <p class="text-xs text-secondary mb-0">${doc.auteurs}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 ">${doc.domaine}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-${doc.etat == "neuf" ? "success" : "secondary"}">${doc.etat}</span>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 ">${doc.type.libelle}</h6>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 ">${doc.statut}</h6>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-success text-xs" data-toggle="modal" data-target="#repub_${doc.id}">Republier </button>
                                            <input type="hidden" id="id" value="">

                                        </td>
                                    </tr>


                                    <%--  --------------------------------- Modal mise à jour ----------------------------------------------------------%>

                                    <div class="modal fade" id="repub_${doc.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form method="POST" action="/repub">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="delModal">Republication de document</h5>
                                                        <button type="button"  data-dismiss="modal">x</button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="text" name="doc_id" value="${doc.id}" hidden="true" class="form-control"/>

                                                        <p>Voulez-vous vraiment remettre ce document à la disposition grand public? </p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                                                        <button type="submit" class="btn btn-outline-success" name="archive" value="archive">Republier</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer pt-3  ">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-lg-between">
                    <div class="col-lg-6 mb-lg-0 mb-4">
                        <div class="copyright text-center text-sm text-muted text-lg-start">
                            © <script>
                            document.write(new Date().getFullYear())
                        </script>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</main>
<!--   Core JS Files   -->

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
<script>
      $(document).ready(function()
          {
              $('#search-input').on('keyup',function()
              {
                  var value = $(this).val().toLowerCase();
                  $('#table-body tr').filter(function() {
                      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                      });
                      });
                      });
    </script>





<script src="assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>

</html>