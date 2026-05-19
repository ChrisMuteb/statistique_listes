<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <form action="${flowExecutionUrl}" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>

            <div class="row g-3 mb-4">
                <!-- DYNAMIC APPLICATION DROPDOWN -->
                <div class="col-md-4">
                    <label for="application" class="form-label fw-bold small">Application <span class="text-danger">*</span></label>
                    <!-- Loop through the Application objects placed in flowScope by the FormAction -->
                    <select class="form-select bg-white border-secondary-subtle" id="application" name="application" required>
                        <option value="">-- Choisir --</option>
                        <c:forEach var="app" items="${applicationsList}">
                            <option value="${app.code}">
                                <c:out value="${app.libelle}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- DYNAMIC DEPARTEMENT DROPDOWN -->
                <div class="col-md-4">
                    <label for="departement" class="form-label fw-bold small">Département <span class="text-danger">*</span></label>
                    <select class="form-select bg-white border-secondary-subtle" id="departement" name="departement" required>
                        <option value="">-- Choisir --</option>

                        <!-- Loop through the Departement objects placed in flowScope by the FormAction -->
                        <c:forEach var="dept" items="${departementsList}">
                            <option value="${dept.code}">
                                <c:out value="${dept.libelle}" />
                            </option>
                        </c:forEach>

                    </select>
                </div>

                <!-- DYNAMIC TYPE REQUETE DROPDOWN -->
                <div class="col-md-4">
                    <label for="typeRequete" class="form-label fw-bold small">Type de requête <span class="text-danger">*</span></label>
                    <select class="form-select bg-white border-secondary-subtle" id="typeRequete" name="typeRequete" required>
                        <option value="">-- Choisir --</option>

                        <!-- Loop through the Departement objects placed in flowScope by the FormAction -->
                        <c:forEach var="treqt" items="${typeRequeteList}">
                            <option value="${treqt.id}">
                                <c:out value="${treqt.libelle}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row g-3 align-items-end mb-4">
                <div class="col-md-4">
                    <label for="email" class="form-label fw-bold small">Email de réception <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-secondary-subtle">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="text-muted" viewBox="0 0 16 16">
                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741zM1 11.105l4.708-2.897L1 5.383z"/>
                            </svg>
                        </span>
                        <input type="email" class="form-control border-secondary-subtle" id="email" name="email" placeholder="adresse@email.fr" required>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="d-flex align-items-center text-secondary small pb-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2 flex-shrink-0" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                            <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
                        </svg>
                        <span>Vous recevrez un email dès que le fichier sera disponible</span>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end mb-4">
                <button type="submit" name="_eventId_submit" class="btn text-white px-4 py-2" style="background-color: #82475d; border: none;">
                    Soumettre
                </button>
            </div>
        </form>

        <div class="border border-success rounded p-3 d-flex align-items-center" style="background-color: #f4faf6;">
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

        <div class="table-responsive">
            <table class="table table-hover align-middle border-top border-secondary-subtle custom-dashboard-table" style="font-size: 0.9rem;">
                <thead class="table-light text-secondary">
                    <tr>
                        <th scope="col" class="fw-bold py-3">Application</th>
                        <th scope="col" class="fw-bold py-3">Département</th>
                        <th scope="col" class="fw-bold py-3">Requête</th>
                        <th scope="col" class="fw-bold py-3">Date de demande</th>
                        <th scope="col" class="fw-bold py-3">Date d'expiration</th>
                        <th scope="col" class="fw-bold py-3">Statut</th>
                        <th scope="col" class="fw-bold py-3 text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="py-3">SURF</td>
                        <td>974 - La Réunion</td>
                        <td>Fiches en anomalie</td>
                        <td>15/04/2025 13:42</td>
                        <td class="text-muted">—</td>
                        <td>
                            <span class="badge d-inline-flex align-items-center gap-1 border px-2 py-1.5 rounded-1"
                                  style="background-color: #fff9ec; border-color: #ffe8c4 !important; color: #d97706; font-weight: 500;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
                                    <path d="M8 4.75a.75.75 0 0 0-.75.75v1.5a.75.75 0 0 0 1.5 0V5.5a.75.75 0 0 0-.75-.75M8 11.25a.75.75 0 0 0-.75.75v.5a.75.75 0 0 0 1.5 0v-.5a.75.75 0 0 0-.75-.75M12.5 8a.75.75 0 0 0-.75-.75h-.5a.75.75 0 0 0 0 1.5h.5A.75.75 0 0 0 12.5 8M4.75 8a.75.75 0 0 0-.75-.75h-.5a.75.75 0 0 0 0 1.5h.5A.75.75 0 0 0 4.75 8"/>
                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
                                </svg>
                                En cours
                            </span>
                        </td>
                        <td class="text-center text-muted">—</td>
                    </tr>

                    <tr>
                        <td class="py-3">Gestion TU</td>
                        <td>974 - La Réunion</td>
                        <td>Dossiers TU</td>
                        <td>14/04/2025 10:22</td>
                        <td class="text-muted">—</td>
                        <td>
                            <span class="badge d-inline-flex align-items-center gap-1 border px-2 py-1.5 rounded-1"
                                  style="background-color: #fff9ec; border-color: #ffe8c4 !important; color: #d97706; font-weight: 500;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
                                </svg>
                                En cours
                            </span>
                        </td>
                        <td class="text-center text-muted">—</td>
                    </tr>

                    <tr>
                        <td class="py-3">EVALOC</td>
                        <td>974 - La Réunion</td>
                        <td>Déclarations à traiter</td>
                        <td>13/04/2025 09:21</td>
                        <td>13/05/2025</td>
                        <td>
                            <span class="badge d-inline-flex align-items-center gap-1 border px-2 py-1.5 rounded-1"
                                  style="background-color: #ecfdf5; border-color: #d1fae5 !important; color: #059669; font-weight: 500;">
                                Disponible
                            </span>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-white border border-dark-subtle fw-bold text-dark px-3 py-1.5 d-inline-flex align-items-center gap-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
                                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                    <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708z"/>
                                </svg>
                                Télécharger
                            </button>
                        </td>
                    </tr>

                    <tr>
                        <td class="py-3">SURF</td>
                        <td>974 - La Réunion</td>
                        <td>Fiches en évaluation d'office</td>
                        <td>12/04/2025 11:48</td>
                        <td>12/05/2025</td>
                        <td>
                            <span class="badge d-inline-flex align-items-center gap-1 border px-2 py-1.5 rounded-1"
                                  style="background-color: #ecfdf5; border-color: #d1fae5 !important; color: #059669; font-weight: 500;">
                                Disponible
                            </span>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-white border border-dark-subtle fw-bold text-dark px-3 py-1.5 d-inline-flex align-items-center gap-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                    <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708z"/>
                                </svg>
                                Télécharger
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
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