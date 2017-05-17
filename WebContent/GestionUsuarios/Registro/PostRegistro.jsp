<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Website CSS style -->
<!-- <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap.min.css" rel="stylesheet">


<title>Registro</title>
</head>
<body>
<%if (session.getAttribute("Insercion").equals("correcta")){ %>
<div class="alert-success col-md-6 col-md-offset-3" id="registrocorrecto" align="center" width="50%">
  <br>
	  <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>
	  <br>
	  <strong>Enhorabuena se ha registrado correctamente</strong><br></strong>Hemos enviado los datos de acceso al correo: <strong><%= session.getAttribute("email") %> </strong><br>
	  <hr>
	  <a href="${pageContext.request.contextPath}/registro">Pulsa aqui para registrar a otro usuario</a><br><div> </div></div>
	  <%}else{ %>
	  <div class="alert-danger col-md-offset-3 col-md-6" id="registrocorrecto" align="center">
	  <br>
	  <span class="glyphicon glyphicon-floppy-remove" aria-hidden="true"></span>
	  <br>
	  <strong>Se ha producido algun error mientras registraba el usuario</strong>
	  <hr>
	  <a href="${pageContext.request.contextPath}/zonaadmin">Pulsa aqui para volver a intentarlo</a><br></div>
	<% } %>
	</body>
</html>