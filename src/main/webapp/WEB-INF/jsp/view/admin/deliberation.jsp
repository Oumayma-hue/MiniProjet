<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../fragments/adminHeader.jsp" />

<div class="container">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>

    <h3>Fichiers de Deliberation</h3>
    <p>Pour générer le fichier de délibération séléctionner le niveau</p>

    <form method="POST" action="/admin/exportdeliberation">
        <label>Choisir le niveau</label>
        <select id="niveaux" class="form-control mb-2" name="idNiveau">
            <c:forEach items="${niveauList}" var="niveau">
                <option value="${niveau.idNiveau}">${niveau.titre}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-primary">Generate</button>
    </form>

    <jsp:include page="../fragments/adminfooter.jsp" />
