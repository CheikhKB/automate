<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Automate Application</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body class="container">
		<div class="page-header">
    			<h1>
    			<c:if test="${note != null}">
    				<span class="glyphicon glyphicon-pencil"></span> Modification de note 
	             </c:if>
	             <c:if test="${note == null}">
	               <span class="glyphicon glyphicon-plus-sign"></span> Ajout de note
	             </c:if>
    			
    			</h1>

		</div>
		<div class="pull-left"><a class="btn btn-success" href="list" role="button"><span class="glyphicon glyphicon-list"></span> Toutes les machines</a></div>
        <div class="pull-right"><a class="btn btn-primary" href="dashboard" role="button"><span class="glyphicon glyphicon-stats"></span> Tableau de bord</a></div>
        <br><br><br><br><br>
        
        <c:if test="${note != null}">
	   		<form action="updateNote?id=<c:out value='${note.idNote}' />" method="post" class="form-horizontal justify-content-center">
	    </c:if>
	    <c:if test="${note == null}">
	  	    <form action="insertNote?id=<c:out value='${numeroSerie}' />" method="post" class="form-horizontal justify-content-center">
	    </c:if>	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labnote">Date intervention</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-wrench"></i>
	              			</span>
	              			<input class="form-control" id="labnote" required  type="date" name="dateIntervention"  value="<c:out value='${note.dateIntervention}' />"
	                 />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labnote">Remarques</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-tags"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labnote" required placeholder="bon état, mauvais..." name="contenu" value="<c:out value='${note.contenu}' />"
	                 />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labnote">Auteur</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-user"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labnote" required placeholder="John Doe" name="auteur" value="<c:out value='${note.auteur}' />" />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	<br><br>
    	<div class="my-1 text-center">
      			<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok-sign"></span> Enregistrer</button>
    	</div>
          
          
        </form>
	</body>	
</html>