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
    			<c:if test="${machine != null}">
    				<span class="glyphicon glyphicon-pencil"></span> Modification de machine 
	             </c:if>
	             <c:if test="${machine == null}">
	               <span class="glyphicon glyphicon-plus-sign"></span> Ajout de machine
	             </c:if>
    			
    			</h1>

		</div>
		<div class="pull-left"><a class="btn btn-success" href="list" role="button"><span class="glyphicon glyphicon-list"></span> Toutes les machines</a></div>
        <div class="pull-right"><a class="btn btn-primary" href="dashboard" role="button"><span class="glyphicon glyphicon-stats"></span> Tableau de bord</a></div>
        <br><br>
        
        <c:if test="${machine != null}">
	   		<form action="updateMachine" method="post" class="form-horizontal justify-content-center">
	    </c:if>
	    <c:if test="${machine == null}">
	  	    <form action="insertMachine" method="post" class="form-horizontal justify-content-center">
	    </c:if>
	    <div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Numéro de série</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-sd-video"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="H2VZ223" name="numeroSerie" value="<c:out value='${machine.numeroSerie}' />"
	                  />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Type</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-subscript"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="1 pour froid, 2 pour chaud, 3 pour encas" name="type" value="<c:out value='${machine.type}' />"
	                  />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Adresse</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-map-marker"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="2 rue de la tour, Paris" name="adresseInstallation" value="<c:out value='${machine.adresseInstallation}' />"
	                 />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Emplacement</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-screenshot"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="gare, école, ..." name="emplacement" value="<c:out value='${machine.emplacement}' />"
	                 />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Latitude</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-globe"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="47.216842N" name="latitude"  value="<c:out value='${machine.latitude}' />"
	              			/>
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Longitude</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-globe"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="57.216842W" name="longitude" value="<c:out value='${machine.longitude}' />"
	                 />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	
    	<div class="row">	
        	<div class="col-lg-4"></div>
	          	<div class="col-lg-4">
	      			<label class="" for="labmach">Module</label>
	      				<div class="input-group">
	              			<span class="input-group-addon">
	                			<i class="glyphicon glyphicon-compressed"></i>
	              			</span>
	              			<input type="text" class="form-control" id="labmach" required placeholder="T1 ou T2" name="module" value="<c:out value='${machine.module}' />" />
	            		</div>
	    		</div>
	    	<div class="col-lg-4"></div>
    	</div>
    	<br>
    	<div class="my-1 text-center">
      			<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok-sign"></span> Enregistrer</button>
    	</div>
          
          
        </form>
	</body>	
</html>