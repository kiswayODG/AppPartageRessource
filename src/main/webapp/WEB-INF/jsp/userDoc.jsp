<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
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
        <a class="nav-link active" href="/userDocs?id=${loggedInUser.id}">
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
        <a class="nav-link  " href="/archives">
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

          <h6 class="font-weight-bolder mb-0">Mes Documents</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
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
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="assets/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 ">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>

              </ul>
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
               <button type="button" class="btn btn-success text-xs ms-4 mt-2" data-toggle="modal" data-target="#createDoc">
               Ajouter</button>
                <table class="table align-items-center mb-0" id="dataTable" >
                  <thead>
                    <tr>
                      <th>
                      <p  class="text-secondary font-weight-bolder opacity-8">Titre</p>
                      <p class="text-xs text-secondary mb-0" style="position:relative; bottom:10px;">Autheurs</p>
                      </th>

                      <th class="text-secondary font-weight-bolder opacity-8 ps-2">Domaine</th>
                      <th class="text-center font-weight-bolder opacity-8">Etat</th>
                      <th class="text-center font-weight-bolder opacity-8">Type</th>
                      <th class="text-center font-weight-bolder opacity-8">Statut</th>
                        <th class="text-center font-weight-bolder opacity-8">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
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
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="mb-0 ">${doc.domaine}</h6>
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
                        <button type="button" class="btn btn-warning  text-xs">Annuler </button>
                        <button type="button" class="btn btn-primary  text-xs" data-toggle="modal" data-target="#updateDoc_${doc.id}">Editer </button>
                        <button type="button" class="btn btn-danger text-xs" data-toggle="modal" data-target="#retrait_${doc.id}" ${doc.statut == "Archive" ? "disabled" : ""}>Retirer </button>
                        <input type="hidden" id="id" value="">

                      </td>
                    </tr>


<%--  --------------------------------- Modal mise à jour ----------------------------------------------------------%>

                    <div class="modal fade" id="updateDoc_${doc.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                      <div class="modal-dialog" role="document">

                        <form:form method="POST"  modelAttribute="doc" class="form-signin">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="UpdateModalLabel">Edition de document</h5>
                              <button data-dismiss="modal" >x</button>
                            </div>
                            <div class="modal-body">

                              <div class="form-group mb-3">
                                <form:input  class="form-control" autofocus="true" path="id" required="true" value="${doc.id}" hidden="true"/>
                              </div>

                              <div class="form-group mb-3">
                                <form:input  class="form-control" autofocus="true" path="titre" required="true" value="${doc.titre}"/>
                              </div>

                              <div class="form-group   mb-3">
                                <form:input type="text" path="auteurs" class="form-control"
                                            autofocus="true" required="true" value="${doc.auteurs}"/>
                              </div>


                              <div class="form-group   mb-3">
                                <form:input type="text" path="domaine" class="form-control"
                                            autofocus="true" required="true" value="${doc.domaine}"/>
                              </div>

                              <div class="form-group   mb-3">
                                <form:input type="text" path="resume" class="form-control"
                                            autofocus="true" required="true" value="${doc.resume}"/>
                              </div>
                              <form:input type="text" path="etudiant" value="${doc.etudiant.id}" hidden="true" class="form-control"/>
                              <div class="form-group   mb-3">
                                <form:select path="type" class="form-control mb-3" required="true">
                                  <c:set var="firstType" value="${doc.type}" />
                                  <option value="${firstType.id}">${firstType.libelle}</option>
                                  <c:forEach items="${typesDoc}" var="type">
                                    <c:if test="${type ne firstType}">
                                      <option value="${type.id}">${type.libelle}</option>
                                    </c:if>
                                  </c:forEach>
                                </form:select>

                                <form:select path="etat" class="form-control" required="true">
                                  <option value="${doc.etat}">${doc.etat}</option>
                                  <c:choose>
                                    <c:when test="${doc.etat == 'neuf'}">
                                      <option value="utilise">Utilisé</option>
                                      <option value="use">usé</option>
                                    </c:when>
                                    <c:when test="${doc.etat == 'utilise'}">
                                      <option value="neuf">Neuf</option>
                                      <option value="use">usé</option>
                                    </c:when>
                                    <c:when test="${doc.etat == 'use'}">
                                      <option value="neuf">Neuf</option>
                                      <option value="utilise">Utilisé</option>
                                    </c:when>
                                    <c:otherwise>
                                      <option value="neuf">Neuf</option>
                                      <option value="utilise">Utilisé</option>
                                      <option value="use">usé</option>
                                    </c:otherwise>
                                  </c:choose>
                                </form:select>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button class="btn btn-secondary" type="button" data-dismiss="modal">Annuler</button>
                              <button class="btn btn-success" type="submit" name="createOrUpdate" value="update">Valider</button>
                            </div>
                          </div>
                        </form:form>
                      </div>
                    </div>


                    <div class="modal fade" id="retrait_${doc.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <form:form method="POST" modelAttribute="doc">
                          <div class="modal-header">
                            <h5 class="modal-title" id="delModal">Retrait de document</h5>
                            <button type="button"  data-dismiss="modal">x</button>
                          </div>
                          <div class="modal-body">
                            <input type="text" name="doc_id" value="${doc.id}" hidden="true" class="form-control"/>

                            <p>Voulez-vous vraiment rétirer ce document du grand public? </p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
                            <button type="submit" class="btn btn-danger" name="archive" value="archive">Retirer</button>
                          </div>
                          </form:form>
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


  <!-- -------------------------------------------Modals----------------------------------------------- -->
  <!-- Ajout d'un nouveau -->
      <div class="modal fade" id="createDoc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog" role="document">

            <form:form method="POST"  modelAttribute="doc" class="form-signin">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Ajout de document</h5>
                      <button data-dismiss="modal" >x</button>
                  </div>
                  <div class="modal-body">

<div class="form-group mb-3">
       <form:input  class="form-control" autofocus="true" path="titre" required="true" placeholder="Titre"/>
           </div>

           <div class="form-group   mb-3">
              <form:input type="text" path="auteurs" class="form-control"
                autofocus="true" required="true" placeholder="Auteur(s)"/>
           </div>


          <div class="form-group   mb-3">
             <form:input type="text" path="domaine" class="form-control"
                autofocus="true" required="true" placeholder="Domaine"/>
          </div>

                <div class="form-group   mb-3">
                <form:input type="text" path="resume" class="form-control"
                  autofocus="true" required="true" placeholder="Résumé"/>
                </div>
                <form:input type="text" path="etudiant" value="${loggedInUser.id}" class="form-control" hidden="true"/>
                   <div class="form-group   mb-3">
                        <form:select path="type" class="form-control mb-3" required="true">
                               <option value="">Type de document</option>
                                 <c:forEach items="${typesDoc}" var="type">
                                <option value="${type.id}">${type.libelle}</option>
                                </c:forEach>
                        </form:select>

                        <form:select path="etat" class="form-control" required="true">
                            <option value="">Etat du document</option>
                             <option value="neuf">Neuf</option>
                             <option value="utilise">Utilisé</option>
                             <option value="use">usé</option>
                        </form:select>


                    </div>

                  </div>
                  <div class="modal-footer">
                      <button class="btn btn-secondary" type="button" data-dismiss="modal">Annuler</button>
                       <button type="submit" class="btn btn-success"  name="createOrUpdate" value="create">Valider</button>
                  </div>
              </div>
           </form:form>

          </div>
      </div>

<%-------------------------------------- Modal de mise à jour ----------------------------------------------%>










 <script src="assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>

</html>