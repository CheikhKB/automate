<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Automate Application</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  		<style><%@ include file="style.css" %></style>
	</head>
	<body class="container">  
		<div class="page-header">
    			<h1><span class="glyphicon glyphicon-stats"></span> Tableau de bord</h1>
		</div>
		
        <div class="pull-right"><a class="btn btn-primary" href="list" role="button"><span class="glyphicon glyphicon-list"></span> Toutes les machines</a></div>
        <h3>Chiffre d'affaires <span class="label label-success"> <c:out value='${montant}' /> €</span></h3><br>
        <div class="row">
	        <div class=" col-lg-6">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-dashboard"></i> Source du chiffre d'affaires</div>
				  <div class="card-body"><div id="piechart"></div></div>
				</div>
			</div>	
			<div class=" col-lg-6">
	            <div class="card">
				  <div class="card-header"><i class="glyphicon glyphicon-equalizer"></i> Montant de ventes des automates</div>
				  <div class="card-body"><div id="barchart"></div></div>
				</div>
			</div>	
		</div>
		<br>
		<div class="pull-right"><a class="btn btn-primary" href="list" role="button"><span class="glyphicon glyphicon-list"></span> Toutes les machines</a></div>
		<ul class="nav nav-tabs">
        	<li class="active"><a href="#Ventes" data-toggle="tab">Ventes</a></li>
        	<li><a href="#machineHS" data-toggle="tab">Machines hors-service</a></li>
        	<li><a href="#machineAtt" data-toggle="tab">Machines à surveiller</a></li>
        	<li><a href="#machineAR" data-toggle="tab">Machines à réapprovisionner</a></li>
        </ul>
      
      	
        <div class="tab-content">
        	<div id="Ventes" class="tab-pane fade in active">
          	<h3><span class="glyphicon glyphicon-piggy-bank"></span> Ventes</h3>
         
		<table class="table table-hover table-fixed table-striped">
		  <thead>
		    <tr>
		      	<th>#</th>
		      	<th>Type</th>
                <th>Adresse</th>
                <th>Emplacement</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Module</th>
                <th><span class="glyphicon glyphicon-euro"></span></th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="machine" items="${ventes}">
                <tr>
                    <td scope="row"><a href="detail?id=<c:out value='${machine.numeroSerie}' />"><c:out value="${machine.numeroSerie}" /></a></td>
                    <td><c:out value="${machine.type}" /></td>
                    <td><c:out value="${machine.adresseInstallation}" /></td>
                    <td><c:out value="${machine.emplacement}" /></td>
                    <td><c:out value="${machine.latitude}" /></td>
                    <td><c:out value="${machine.longitude}" /></td>
                    <td><c:out value="${machine.module}" /></td>
                    <td><c:out value="${machine.rapports[0].chiffreAffaires}" /></td>               
                </tr>
            </c:forEach>
		  </tbody>

		</table>
        </div>
        
        <div id="machineHS" class="tab-pane fade">
          	<h3><span class="glyphicon glyphicon-ban-circle"></span> Machines hors service</h3>
          	<table class="table table-hover table-fixed table-striped">
		  <thead>
		    <tr>
		      	<th>#</th>
		      	<th>Type</th>
                <th>Adresse</th>
                <th>Emplacement</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Module</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="machine" items="${machineHS}">
                <tr>
                    <td scope="row"><a href="detail?id=<c:out value='${machine.numeroSerie}' />"><c:out value="${machine.numeroSerie}" /></a></td>
                    <td><c:out value="${machine.type}" /></td>
                    <td><c:out value="${machine.adresseInstallation}" /></td>
                    <td><c:out value="${machine.emplacement}" /></td>
                    <td><c:out value="${machine.latitude}" /></td>
                    <td><c:out value="${machine.longitude}" /></td>
                    <td><c:out value="${machine.module}" /></td>              
                </tr>
            </c:forEach>
		  </tbody>

		</table>
        </div>
        <div id="machineAtt" class="tab-pane fade">
          	<h3><span class="glyphicon glyphicon-warning-sign"></span> Machines à surveiller</h3>
        	<table class="table table-hover table-fixed table-striped">
		  <thead>
		    <tr>
		      	<th>#</th>
		      	<th>Type</th>
                <th>Adresse</th>
                <th>Emplacement</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Module</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="machine" items="${machineAtt}">
                <tr>
                    <td scope="row"><a href="detail?id=<c:out value='${machine.numeroSerie}' />"><c:out value="${machine.numeroSerie}" /></a></td>
                    <td><c:out value="${machine.type}" /></td>
                    <td><c:out value="${machine.adresseInstallation}" /></td>
                    <td><c:out value="${machine.emplacement}" /></td>
                    <td><c:out value="${machine.latitude}" /></td>
                    <td><c:out value="${machine.longitude}" /></td>
                    <td><c:out value="${machine.module}" /></td>              
                </tr>
            </c:forEach>
		  </tbody>

		</table>
        </div>
        <div id="machineAR" class="tab-pane fade">
          	<h3><span class="glyphicon glyphicon-alert"></span> Machines à réapprovisionner</h3>
        	<table class="table table-hover table-fixed table-striped">
		  <thead>
		    <tr>
		      	<th>#</th>
		      	<th>Type</th>
                <th>Adresse</th>
                <th>Emplacement</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Module</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="machine" items="${machineAR}">
                <tr>
                    <td scope="row"><a href="detail?id=<c:out value='${machine.numeroSerie}' />"><c:out value="${machine.numeroSerie}" /></a></td>
                    <td><c:out value="${machine.type}" /></td>
                    <td><c:out value="${machine.adresseInstallation}" /></td>
                    <td><c:out value="${machine.emplacement}" /></td>
                    <td><c:out value="${machine.latitude}" /></td>
                    <td><c:out value="${machine.longitude}" /></td>
                    <td><c:out value="${machine.module}" /></td>               
                </tr>
            </c:forEach>
		  </tbody>
		</table>
        </div>
      </div>
      
      <script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
		  var list=[['Automate', 'Montant des ventes']];
		  
		  <c:forEach var="rapport" items="${rapports}">
		  	  list.push([ "<c:out value="${rapport.machine.numeroSerie}" />", <c:out value="${rapport.chiffreAffaires}" /> ]);
		  </c:forEach>
			
		  var data = google.visualization.arrayToDataTable(list);

		  var options = {'width':540, 'height':400};

		  var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));
		  chart1.draw(data, options);
		  var chart2 = new google.visualization.ColumnChart(document.getElementById('barchart'));
		  chart2.draw(data, options);
		}
	  </script>
  	
	</body>	
</html>