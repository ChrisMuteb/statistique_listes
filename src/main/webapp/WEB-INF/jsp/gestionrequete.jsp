<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Requêtes</title>

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

        <div class="mb-2">
            <h4 class="m-0 fw-bold" style="color: #333;">Gestion des requêtes</h4>
        </div>
        <p class="text-muted small mb-4">
            Vous pouvez modifier les requêtes. Vous recevrez un e-mail dès que la requête est traitée par le batch.
        </p>

        <hr class="text-muted my-4">

        <div class="mb-4">
            <h5 class="fw-bold m-0" style="color: #333;">Requêtes disponibles</h5>
            <p class="text-muted small">Consultez et modifiez les requêtes.</p>
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

        <div class="card shadow-sm border-secondary-subtle mb-4">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light text-secondary small text-uppercase">
                            <tr>
                                <th class="ps-4">Application</th>
                                <th>Requête</th>
                                <th>Date de mise à jour</th>
                                <th>Statut</th>
                                <th>Observation</th>
                                <th class="pe-4 text-end">Action</th>
                            </tr>
                        </thead>
                        <tbody class="small">
                            <c:if test="${empty requetesDisponiblesList}">
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">
                                        Aucune requête n'est disponible pour le moment.
                                    </td>
                                </tr>
                            </c:if>

                            <c:forEach var="item" items="${requetesDisponiblesList}">
                                <tr>
                                    <td class="ps-4 fw-bold text-dark"><c:out value="${item.application}"/></td>
                                    <td><c:out value="${item.requeteName}"/></td>
                                    <td class="text-secondary"><c:out value="${item.dtMiseAJour}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.statut == 'TRAITEE'}">
                                                <span class="badge bg-success-subtle text-success border border-success-subtle px-2.5 py-1.5 rounded-1 fw-bold" style="background-color: #d4edda !important; color: #155724 !important;">
                                                    Traitée
                                                </span>
                                            </c:when>
                                            <c:when test="${item.statut == 'REJETEE'}">
                                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2.5 py-1.5 rounded-1 fw-bold" style="background-color: #f8d7da !important; color: #721c24 !important;">
                                                    Rejetée
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning-subtle text-warning-dark border border-warning-subtle px-2.5 py-1.5 rounded-1 fw-bold" style="background-color: #fff3cd !important; color: #856404 !important; border-color: #ffeeba !important;">
                                                    En cours de traitement
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td class="text-dark fw-bold" style="font-family: monospace; font-size: 0.85rem; max-width: 300px;">
                                        <c:if test="${not empty item.observation}">
                                            <c:out value="${item.observation}"/>
                                        </c:if>
                                    </td>

                                    <td class="pe-4 text-end">
                                        <div class="d-inline-flex gap-2">
                                            <a href="${flowExecutionUrl}&_eventId=consulter&id=${item.id}" class="btn btn-sm p-1 text-secondary" title="Consulter">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#a4727d" viewBox="0 0 16 16">
                                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                                    <path d="M4.5 4a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"/>
                                                </svg>
                                            </a>
                                            <c:if test="${item.statut != 'EN_COURS'}">
                                                <a href="${flowExecutionUrl}&_eventId=modifier&id=${item.id}" class="btn btn-sm p-1 text-dark" title="Modifier">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 16 16">
                                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                    </svg>
                                                </a>
                                            </c:if>
                                        </div>
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

    <script src="<c:url value='/js/bootstrap.bundle.min.js'/>"></script>

    <script src="<c:url value='/js/ajax-functions.js'/>"></script>
</body>
</html>