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
    			<h1><span class="glyphicon glyphicon-list"></span> Liste de machines</h1>

		</div>
		<div class="pull-left"><a class="btn btn-success" href="newMachine" role="button"><span class="glyphicon glyphicon-plus"></span> Ajouter une machine</a></div>
        <div class="pull-right"><a class="btn btn-primary" href="dashboard" role="button"><span class="glyphicon glyphicon-stats"></span> Tableau de bord</a></div>
        <br><br><br>
        <div class="container table-responsive text-nowrap">
        <table class="table table-striped table-hover">
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
            <c:forEach var="machine" items="${listMachine}">
               <tr>
                    <td scope="row"><a href="detail?id=<c:out value='${machine.numeroSerie}' />"><c:out value="${machine.numeroSerie}" /></a></td>
                    <td><c:out value="${machine.type}" /></td>
                    <td><c:out value="${machine.adresseInstallation}" /></td>
                    <td><c:out value="${machine.emplacement}" /></td>
                    <td><c:out value="${machine.latitude}" /></td>
                    <td><c:out value="${machine.longitude}" /></td>
                    <td><c:out value="${machine.module}" /></td>
                    <td>
                     <a href="editMachine?id=<c:out value='${machine.numeroSerie}' />"><span class="glyphicon glyphicon-pencil"></span></a>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="deleteMachine?id=<c:out value='${machine.numeroSerie}' />"><span class="glyphicon glyphicon-trash"></span></a>                
                    </td>
                </tr>
            </c:forEach>   
          </tbody>
         </table>
      </div>
	</body>	
</html>