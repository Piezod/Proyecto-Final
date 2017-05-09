<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Zona Admin</title>
<%@include file="Cabecera.jsp"%>
 <LINK href="css/EstilosPagAdmin.css" rel="stylesheet" type="text/css">
 
 <style type="text/css">
 #noty,#noty1,#p{
 display:none;
 }
 
 </style>
 <script type="text/javascript">
 
 function verp()
 {
	 
	 if (document.getElementById("noty").style.display=="block")
		 {
	 document.getElementById("noty").style.display="none";
	 document.getElementById("noty1").style.display="none";
		 }
	 else
		 {
		 document.getElementById("noty").style.display="block";
		 document.getElementById("noty1").style.display="block";
		 }
	 
	 
 }
 $(document).ready(function(){
	    $('#tabla1').fadeIn();
	});
 
	    $("ver").click(function(){
	    	alert("toogle");
	        $("noty").toggle();
	    });
	    
	    $("button").click(function(){
	        $("p").toggle();
	    });
 </script>
</head>
<body>


<%
/*
 Primero veo que no sea null el admin, si es null le envio al login, si esta logado y no es el admin tb le envio para atras
 hago un redirect la cabecera , pero llega a entrar aqui y no se xk :(.
*/
	if (session.getAttribute("admin")==null)
	{
	System.out.println("usuario vacio al admin");
	response.sendRedirect("login");
		}
	else 	if (!session.getAttribute("admin").equals("1"))
	{%>

	<%
	response.sendRedirect("login");
	System.out.println("usuario no es admin");
	} %>
		
 

 
		<div class="container">
			<div class="row">
				<div class="col-md-12">	
					<h1 align="center">Zona Admin</h1>
			</div>
		</div>
		<div class="container" id="tabla1">
			<div class="row">
				<div class="col-md-3">
					<div class="table-responsive">
					  <table class="table table-hover">
					  	<tr>
					  		<td><a href="registro">Registrar Usuarios</a></td>
					  	</tr>
					  	<tr>
					  		<td>Subir nuevos archivos</td>
					  	</tr>
					  	<tr>
					  		<td><p id="vertiponotificacion" onclick="verp();"> Enviar Nueva Notificacion</p></td>
					  	</tr><tr>
					  		<td id="noty"><a href="ServeletZonaAdmin?opcion=notificacion&tipo=global"><p id="notificacion">Nueva Notificacion Global</p></td>
					  	</tr><tr>
					  		<td id="noty1" ><a href="ServeletZonaAdmin?opcion=notificacion&tipo=curso"><p id="notificacion" > Nueva Notificacion por curso y ciclo</p></td>
					  	</tr>
					  	
					  	<tr>
					  		<td><a href="ServeletZonaAdmin?opcion=solicitud">Solicitudes</a></td>
					  	</tr>
					  </table>
					</div>
				</div>
			</div>
		</div>
		
</body>
</html>