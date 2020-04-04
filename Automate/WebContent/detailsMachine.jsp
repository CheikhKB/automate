<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Automate Application</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<style><%@ include file="style.css" %></style>
	</head>
	<body class="container">
		<div class="page-header">
    			<h1><span class="glyphicon glyphicon-blackboard"></span> Machine <span class="text-danger"><i class="text-info">#</i><c:out value='${machine.numeroSerie}'/></span></h1>
		</div>
        <div class="pull-right"><a class="btn btn-primary" href="list" role="button"><span class="glyphicon glyphicon-list"></span> Toutes les machines</a></div>

        <h3>Détails</h3><br>
        <div class="row">
	        <div class=" col-lg-3">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-compressed"></i> Type</div>
				  <div class="card-body"><h3>
						<c:if test="${machine.type == 1}">
		    				Automate de vente de boissons froides
			             </c:if>
			             <c:if test="${machine.type == 2}">
			                Automate de vente de boissons chaudes
			             </c:if>
			             <c:if test="${machine.type == 3}">
			                Automate de vente d'encas
			             </c:if>
					</h3></div>
				</div>
			</div>	
			<div class=" col-lg-3">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-map-marker"></i> Adresse d'installation</div>
				  <div class="card-body"><h3><c:out value='${machine.adresseInstallation}' /></h3><br>
				  	<span class="card-text"><i class="glyphicon glyphicon-screenshot"></i> <c:out value='${machine.emplacement}' /></span>
				  </div>
				</div>
			</div>	
			<div class=" col-lg-3">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-globe"></i> Coordonnées GPS</div>
				  <div class="card-body"><h3><c:out value='${machine.latitude}' /></h3><h3><c:out value='${machine.longitude}' /></h3></div>
				</div>
			</div>	
			<div class=" col-lg-3">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-compressed"></i> Module de télécommunication</div>
				  <div class="card-body text-center"><h1><c:out value='${machine.module}' /></h1></div>
				</div>
			</div>
		</div>
		<h3>Dernier rapport</h3>
		<c:if test="${rapport != null}">
			<div class="card">
			  <div class="card-body">
			    <h3 class="card-title"><i class="glyphicon glyphicon-calendar"></i> <c:out value='${rapport.dateRapport}' /></h3>
			    <p class="card-text">
				    <div class="row">	
				    	<div class="col-lg-3"><i class="glyphicon glyphicon-modal-window"></i> Fonctionnement : <i class="badge">
				    	 <c:if test="${rapport.enService == true}">
		    				en service 
			             </c:if>
			             <c:if test="${rapport.enService == false}">
			                hors service
			             </c:if>
				    	 </i></div>
				    	<div class="col-lg-3"><i class="glyphicon glyphicon-scale"></i> Etat : <i class="badge"><c:out value='${rapport.details.etatActuel}' /> </i></div>
				    	<div class="col-lg-3"><i class="glyphicon glyphicon-tint"></i> Température : <i class="badge"><c:out value='${rapport.details.temperature}' />°C</i></div>
				    	<div class="col-lg-3"><i class="glyphicon glyphicon-euro"></i> Chiffre d'affaires : <i class="badge"><c:out value='${rapport.chiffreAffaires}' /> €</i></div>
				    </div>
			    </p>
			    <p class="card-text"><i class="glyphicon glyphicon-usd"></i> Etat des systèmes de paiement : </p>
			    <ul class="list-group list-group-flush">
				  <li class="list-group-item"><i class="glyphicon glyphicon-piggy-bank"></i> Monnayeur  <i class="badge"><c:out value='${rapport.details.monnayeur}' /></i></li>
				  <li class="list-group-item"><i class="glyphicon glyphicon-credit-card"></i> Cartes à puce  <i class="badge"><c:out value='${rapport.details.cartesMagnetiques}' /></i> </li>
				  <li class="list-group-item"><i class="glyphicon glyphicon-phone"></i> Cartes sans contact  <i class="badge"><c:out value='${rapport.details.cartesSansContact}' /></i></li>
				</ul>
				<h4>Articles</h4>
					<div class="list-group">
					<c:forEach var="article" items="${rapport.articles}">
					  <div class="list-group-item list-group-item-action">
					  	<span class="col-lg-3 art"><c:out value='${article.nom}' /></span>
					  	<span class="col-lg-3">Prix <i class="badge badge-primary badge-pill"><c:out value='${article.prix}' /> €</i></span>
					  	<span class="col-lg-3">Quantité restante <i class="badge badge-primary badge-pill"><c:out value='${article.qstock}' /></i></span>
					  	<span class="">Obs. <i class="badge badge-primary">
					  	<c:if test="${article.qstock<10}">
		    				<i class="glyphicon glyphicon-warning-sign"></i> Réapprovisionner
			             </c:if>
					  	<c:if test="${article.qstock<10 and article.rapport.details.temperature<5 and article.rapport.machine.type==2}">
		    				: tripler seuil !
			             </c:if>
			             <c:if test="${article.qstock<10 and article.rapport.details.temperature>=25 and article.rapport.machine.type==1}">
		    				: tripler seuil !
			             </c:if>
					  	<c:if test="${article.qstock>=10}">
		    				Rien à signaler
			             </c:if>
					  	
					  	</i></span>
					  </div>
					</c:forEach>  
			  </div>
			</div>
		</div>
	</c:if>		
		<h3>Notes <div class="pull-right"><a class="btn btn-success" href="newNote?id=<c:out value='${machine.numeroSerie}' />" role="button"><span class="glyphicon glyphicon-plus"></span> Ajouter une note</a></div></h3>
		<div class="container table-responsive text-nowrap">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
                <th>Date d'intervention</th>
                <th>Auteur</th>
                <th>Observations</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="note" items="${notes}">
               <tr>
                    <td><c:out value="${note.dateIntervention}" /></td>
                    <td><c:out value="${note.auteur}" /></td>
                    <td><c:out value="${note.contenu}" /></td>
                    <td>
                     <a href="editNote?id=<c:out value='${note.idNote}' />"><span class="glyphicon glyphicon-pencil"></span></a>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="deleteNote?id=<c:out value='${note.idNote}' />"><span class="glyphicon glyphicon-trash"></span></a>                
                    </td>
                </tr>
            </c:forEach>   
          </tbody>
         </table>
      </div>
	</body>	
</html>