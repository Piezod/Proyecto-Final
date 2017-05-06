<%@page import="java.util.HashMap"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!--  Imports que hay que realizar para utilizar jstl  -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalle Usuario</title>

 <script type="text/javascript">
 $(document).ready(function(){
	    $('#body').fadeIn();
	});
 </script>
<style type="text/css">
#input, button, submit
{
  border:none;
  background: none;
}
</style>
</head>
<body>
<%@include file="Cabecera.jsp"%>
<%
HashMap hml=(HashMap)request.getAttribute("hml");
HashMap hml2=(HashMap)request.getAttribute("inforespuesta");
String usuario=(String)request.getAttribute("usuario");
pageContext.setAttribute("hml", hml);
pageContext.setAttribute("inforespuesta", hml2);
pageContext.setAttribute("usuario", usuario);
%>
<!-- 
<h1> Primera prueba de stl recogiendo datos por sql</h1>
	<table>
		<c:forEach var="item"  items="${lista}">
			<tr>
				<td>lista</td>
				<td>${item}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>El hasmap va aqui ahora el de strings</h1>
	<table>
		<c:forEach var="item"  items="${hm}">
			<tr>
				<td>Id pregunta : ${item.key}</td><td> Pregunta : ${item.value}</td>
			</tr>
		</c:forEach>
	</table>
	 -->
	 <!-- El hasmap con la key y el array list, primero recorremos el hasmap y por cada key luego recorremos el arraylist
	 para ver los datos que hemos recuperado a traves de nuestras clases java, los datos seran tratados en la clase java, aqui solo se pintaran a traves de
	 los foreach -->
	
	<h1 align="center">Ultimas Preguntas del Usuario : <c:out value="${usuario}"></c:out></h1> 
	<div class="container">
		<div class="row">
			<div class="col-sm-6" >
			<table class="table table-hover">
				  <tr>
				  	<th>Pregunta</th>
				  	<th>Fecha</th>
				  </tr>
						<c:forEach var="item"  items="${hml}">
							<form action="DetallePregunta" method="POST">
								<div class="row">
										<div class="col-md-9">
										 <tr>
										 <td>
											<input type="hidden" name="idpregunta" value="${item.key}"></input>
											<span class="label label-primary"><button type="submit" name="submit_param" value="submit_value"
												class="nostyle">${item.value.get(0)}
												
											</button></span></td>
										</div>
										<td>
										<div class="col-md-2">
											<span class="label label-default">${item.value.get(1)}</td>
													</span></div></td>
													</tr>
										</div>
									</div>
									</tr>
					
							</form>
			</c:forEach>
		  </table>
			</div>
			<div class="col-sm-6">
				 <table class="table table-hover">
				 	 <tr>
				  	<th>Respuesta</th>
				  	<th>Votos Positivos</th>
				  	<th>Votos Negativos</th>
				  	<th>Fecha</th>
				  </tr>
			<c:forEach var="item"  items="${inforespuesta}">
			<form action="DetallePregunta" method="POST">
						<div class="col-md-9">
						 <tr>
							 <td>
							 <c:set var= "opcion" value="${item.value.get(3)}"></c:set>
							 <c:choose>
								 <c:when test="${opcion == 1}">
									<input type="hidden" name="idpregunta" value="${item.value.get(4)}"></input>
									<span class="label label-success"><button type="submit" name="submit_param" value="submit_value" class="nostyle" >${item.value.get(0)}</button></span>
								</c:when>
								<c:otherwise>
								<input type="hidden" name="idpregunta" value="${item.value.get(4)}"></input>
								<span class="label label-primary">	<button type="submit" name="submit_param" value="submit_value" 
									class="nostyle">${item.value.get(0)}</button></span>
								</c:otherwise>
							</c:choose>
							</td>
						</div>
						<td>
						<div class="col-md-3">
							<span class="label label-default">${item.value.get(1)}
									</span></div></td>
									<td>
						<div class="col-md-3">
							<span class="label label-default">${item.value.get(2)}
									</span></div></td>
									<td>
						<div class="col-md-3">
							<span class="label label-default">${item.value.get(5)}
									</span></div></td>
									</tr>
						</div>
					</div>
				</tr>
				
			</form>
			</c:forEach>
		  </table>
			</div>
		</div>
	</div>
</body>
</html>