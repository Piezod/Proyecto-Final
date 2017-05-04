<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.HashMap"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!--  Imports que hay que realizar para utilizar jstl  -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
#wrapper{
    background-image:url('some-image.jpg');
    display:none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    $('#wrapper').fadeIn();
});

</script>
<%
HashMap hml2=(HashMap)request.getAttribute("solicitudpendiente");
pageContext.setAttribute("solicitudpendiente", hml2);
%>

</head>
<body>
<%
if (session.getAttribute("usuario")==null)
{
	response.sendRedirect("login");
	System.out.println("usuario vacio");
}else if (!session.getAttribute("admin").equals("1"))
{
	response.sendRedirect("login");
System.out.println("usuario no es admin");
}%>

<%@include file="../../ContenidoPrincipal/Cabecera.jsp"%>
		<div class="container">
			<div class="row">
					<div class="col-md-12">	
						<h1 align="center">Solicitudes Pendientes</h1>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
		<div class="col-md-4 col-md-offset-2">
		  <table>
		  
		  	<tr>
		  		<th> Numero peticion</th>
		  		<th> Nombre solicitado </th>
		  		<th> Apellido1 </th>
		  		<th> Apellido2</th>
		  		<th> Estado actual </th>
		  	</tr>
		  	<tr>
			<c:forEach var="item"  items="${solicitudpendiente}">
			<form action="gestiondelassolicitudes" method="POST">
						<div class="col-md-9">
						 <tr>
						 	<td>${item.value.get(0)} </td>
						 	<td>${item.value.get(1)} </td>
						 	<td>${item.value.get(2)} </td>
						 	<td>${item.value.get(3)} </td>
						 	<td>${item.value.get(4)} </td>
						 
						</tr>
						</div>
					</div>
				
			</form>
			</c:forEach>
		  </table>
		</div>
			</div>
		</div>
			
</body>
</html>