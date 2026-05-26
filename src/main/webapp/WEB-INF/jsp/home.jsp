<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil Local</title>

    <!-- LOCAL BOOTSTRAP CSS -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-4">

        <div class="row g-3 mb-5">
            <div class="col-sm-6">
                <a href="${flowExecutionUrl}&_eventId=generationListes" class="btn w-100 py-3 text-white fw-bold text-uppercase rounded-1 shadow-sm d-flex align-items-center justify-content-center"
                   style="background-color: #82475d; letter-spacing: 0.5px; font-size: 1.05rem; min-height: 65px; border: none; transition: opacity 0.2s;">
                    Génération des listes
                </a>
            </div>
            <div class="col-sm-6">
                <a href="${flowExecutionUrl}&_eventId=gestionRequetes" class="btn w-100 py-3 text-white fw-bold text-uppercase rounded-1 shadow-sm d-flex align-items-center justify-content-center"
                   style="background-color: #82475d; letter-spacing: 0.5px; font-size: 1.05rem; min-height: 65px; border: none; transition: opacity 0.2s;">
                    Gestion des requêtes
                </a>
            </div>
        </div>

        <div class="d-flex align-items-center mb-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#bc4c2b" class="me-2" viewBox="0 0 16 16">
                <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1zm-4 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1zm-4 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1z"/>
            </svg>
            <h4 class="m-0 fw-bold" style="color: #333;">Générer les listes/statistiques</h4>
        </div>

        <p class="text-muted small mb-4">
            Vous pouvez soumettre vos demandes de listes ou de statistiques via des requêtes prédéfinies.
            Vous recevrez un email dès que le fichier généré sera disponible au téléchargement.
        </p>

        <!-- Note the modelAttribute corresponds to the lowercase name configured in simple-flow-beans.xml -->
        <form:form action="${flowExecutionUrl}" modelAttribute="statistiqueform" method="post" class="needs-validation" novalidate="novalidate">
            <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>

            <div class="row g-3 mb-4">
                <!-- DYNAMIC APPLICATION DROPDOWN -->
                <div class="col-md-4">
                    <label for="application" class="form-label fw-bold small">Application <span class="text-danger">*</span></label>
                    <form:select class="form-select bg-white border-secondary-subtle" id="application" path="application" required="required">
                        <option value="">-- Choisir --</option>
                        <c:forEach var="app" items="${applicationsList}">
                            <option value="${app.libelle}">${app.libelle}</option>
                        </c:forEach>
                    </form:select>
                    <!-- Displays the error mapping if validation fails -->
                    <form:errors path="application" cssClass="text-danger small d-block mt-1" />
                </div>

                <!-- DYNAMIC DEPARTEMENT DROPDOWN -->
                <div class="col-md-4">
                    <label for="departement" class="form-label fw-bold small">Département <span class="text-danger">*</span></label>
                    <form:select class="form-select bg-white border-secondary-subtle" id="departement" path="departement" required="required">
                        <option value="">-- Choisir --</option>
                        <c:forEach var="dept" items="${departementsList}">
                            <option value="${dept.libelle}">${dept.libelle}</option>
                        </c:forEach>
                    </form:select>
                    <!-- Displays the error mapping if validation fails -->
                    <form:errors path="departement" cssClass="text-danger small d-block mt-1" />
                </div>

                <!-- DYNAMIC TYPE REQUETE DROPDOWN -->
                <div class="col-md-4">
                    <label for="typeRequete" class="form-label fw-bold small">Type de requête <span class="text-danger">*</span></label>
                    <form:select class="form-select bg-white border-secondary-subtle" id="typeRequete" path="typeRequete" required="required">
                        <option value="">-- Choisir --</option>
                        <c:forEach var="treqt" items="${typeRequeteList}">
                            <option value="${treqt.libelle}">${treqt.libelle}</option>
                        </c:forEach>
                    </form:select>
                    <!-- Displays the error mapping if validation fails -->
                    <form:errors path="typeRequete" cssClass="text-danger small d-block mt-1" />
                </div>
            </div>

            <div class="row g-3 align-items-end mb-4">
                <div class="col-md-4">
                    <label for="email" class="form-label fw-bold small">Email de réception <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-secondary-subtle">@</span>
                        <form:input type="email" class="form-control border-secondary-subtle" id="email" path="email" placeholder="adresse@email.fr" required="required" />
                    </div>
                    <form:errors path="email" cssClass="text-danger small d-block mt-1" />
                </div>
            </div>

            <div class="d-flex justify-content-end mb-4">
                <button type="submit" name="_eventId_submit" class="btn text-white px-4 py-2" style="background-color: #82475d; border: none;">
                    Soumettre
                </button>
            </div>
        </form:form>

        <c:if test="${submitSuccess}">
            <div class="border border-success rounded p-3 d-flex align-items-center mb-4" style="background-color: #f4faf6;">
                <div class="text-success me-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </svg>
                </div>
                <div>
                    <div class="fw-bold text-success" style="font-size: 0.95rem;">Votre demande a été prise en compte.</div>
                    <div class="text-secondary small">Le fichier sera disponible après traitement.</div>
                </div>
            </div>
        </c:if>

        <hr class="text-muted my-5">

        <div class="mb-4">
            <h4 class="fw-bold m-0" style="color: #333;">Fichiers disponibles</h4>
            <p class="text-muted small">Consultez et téléchargez les fichiers générés.</p>
        </div>

        <div class="row align-items-center mb-3 g-2">
            <div class="col-sm-6 d-flex align-items-center gap-2 text-secondary small">
                <span>Afficher</span>
                <select class="form-select form-select-sm bg-white border-secondary-subtle" style="width: auto; min-width: 65px;">
                    <option value="5" selected>5</option>
                    <option value="10">10</option>
                    <option value="25">25</option>
                </select>
                <span>éléments</span>
            </div>

            <div class="col-sm-6 d-flex align-items-center justify-content-sm-end gap-2 text-secondary small">
                <label for="tableSearch" class="text-nowrap">Rechercher :</label>
                <input type="text" id="tableSearch" class="form-control form-control-sm border-secondary-subtle" style="max-width: 200px;">
            </div>
        </div>

        <!-- Historical Requests Container -->
        <div class="card shadow-sm border-secondary-subtle mb-4">
            <div class="card-header bg-light fw-bold text-dark py-3">
                Historique de vos demandes de fichiers
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light text-secondary small text-uppercase">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Application</th>
                                <th>Département</th>
                                <th>Type Requête</th>
                                <th>Date Demande</th>
                                <th>Date Expiration</th>
                                <th class="pe-4">Statut</th>
                            </tr>
                        </thead>
                        <tbody class="small">
                            <!-- Check if historical lists are empty -->
                            <c:if test="${empty historiqueDemandesList}">
                                <tr>
                                    <td colspan="7" class="text-center text-muted py-4">
                                        Aucune demande n'a été enregistrée pour le moment.
                                    </td>
                                </tr>
                            </c:if>

                            <!-- Loop through DTO items -->
                            <c:forEach var="demande" items="${historiqueDemandesList}">
                                <tr>
                                    <td class="ps-4 text-muted fw-mono">#${demande.idDemandeFichier}</td>
                                    <td class="fw-bold"><c:out value="${demande.application}"/></td>
                                    <td><c:out value="${demande.departement}"/></td>
                                    <td><c:out value="${demande.requetes}"/></td>
                                    <td><c:out value="${demande.dtDemande}"/></td>
                                    <td><c:out value="${demande.dtExpiration}"/></td>
                                    <td class="pe-4">
                                        <!-- Render badge contextual colors depending on status variable values -->
                                        <c:choose>
                                            <c:when test="${demande.statutCsv == 'DISPONIBLE'}">
                                                <span class="badge bg-success-subtle text-success border border-success-subtle px-2.5 py-1.5 rounded-pill">
                                                    <c:out value="${demande.statutCsv}"/>
                                                </span>
                                            </c:when>
                                            <c:when test="${demande.statutCsv == 'EXPIRE'}">
                                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2.5 py-1.5 rounded-pill">
                                                    <c:out value="${demande.statutCsv}"/>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning-subtle text-warning-dark border border-warning-subtle px-2.5 py-1.5 rounded-pill" style="color: #856404; background-color: #fff3cd;">
                                                    <c:out value="${demande.statutCsv}"/>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center mt-4">
            <nav aria-label="Table navigation">
                <ul class="pagination pagination-sm border-secondary-subtle">
                    <li class="page-item"><a class="page-link text-muted px-2.5" href="#">│&lt;</a></li>
                    <li class="page-item"><a class="page-link text-muted px-2.5" href="#">&lt;</a></li>
                    <li class="page-item active"><a class="page-link border-0 px-3 text-white" style="background-color: #82475d;" href="#">1</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">2</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">3</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">4</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">5</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">6</a></li>
                    <li class="page-item"><a class="page-link text-dark px-3" href="#">7</a></li>
                    <li class="page-item"><a class="page-link text-muted px-2.5" href="#">&gt;</a></li>
                    <li class="page-item"><a class="page-link text-muted px-2.5" href="#">&gt;│</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- LOCAL BOOTSTRAP JS -->
    <script src="<c:url value='/js/bootstrap.bundle.min.js'/>"></script>

    <!-- LOCAL AJAX SCRIPT -->
    <script src="<c:url value='/js/ajax-functions.js'/>"></script>
</body>
</html>