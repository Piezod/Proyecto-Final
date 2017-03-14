<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<title>Area de usuario</title>
	<%@include file="Cabecera.jsp"%>

<body>
<div class="container-fluid" style="margin-top:5%;margin-right: 7%; margin-left: 7%;">
		<div class="row container-fluid">
		  <div class="col-md-3 col-sm-3" align="center">
		  	  <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
		      <button type="button" class="btn btn-default" style="margin-left: 0" onclick="from('<%=session.getAttribute("usuario") %>','contenido','DatosUsuario')">Visualizar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','EditarUsuario')">Editar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','MostrarActividad')">Actividad</button>
		      
	        </div>
		  </div>
		  <div class="col-md-9 col-sm-9" id="contenido">
		  	<%@include file="DatosUsuario.jsp" %>
		  </div>
    </div>

		
	</div>
</body>
</html>