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
<title>Insert title here</title>
</head>
<body>
<%@include file="Cabecera.jsp"%>
<%
/*
IP:       31.200.243.193  (isalesianos.com)
PORT:     51987
DBNAME:   dbdamproject
USERNAME: usrdamproject
PASSWORD: GgQXVfYTCu3eBsXY
*/
//Recojo el arraylist los datos necesario
ArrayList<String> lista=(ArrayList)request.getAttribute("listausuario");
HashMap hm=(HashMap)request.getAttribute("hm");
HashMap hml=(HashMap)request.getAttribute("hml");
String usuario=(String)request.getAttribute("usuario");
//le pongo a la pagecontext importante para que luego se recorra el foreach
pageContext.setAttribute("lista", lista);
pageContext.setAttribute("hm",hm );
pageContext.setAttribute("hml", hml);
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
	
	
	
	
	<div class="container-fluid" style="margin-top: 5%">
	
					<h1 align="center">Ultimas Preguntas del Usuario : <c:out value="${usuario}"></c:out></h1> 
		 <div class="col-md-8 col-md-offset-2">
		<form action="DetallePregunta" method="POST">
		  <table>
			<c:forEach var="item"  items="${hml}">
			<div class="row">
						<div class="col-md-9">
						 <tr>
						 <td>
							<input type="hidden" name="idpregunta" value="${item.key}"></input>
							<button type="submit" name="submit_param" value="submit_value"
								class="list-group-item list-group-item-info">${item.value.get(0)}
								
							</button></td>
						</div>
						<td>
						<div class="col-md-3">
							<span class="label label-default">${item.value.get(1)}</td>
									</span></div></td>
									</tr>
						</div>
					</div>
				
					<!--
					dejo esto comentado por si necesitara en un futuro saber com orecorrer un arraylist de un hasmap, de momento no recorrere, lo cogere  amano
					<c:forEach var="arrayItem" items="${item.value}">
							<td>
							<button type="submit" name="submit_param" value="submit_value"
								class="list-group-item list-group-item-info">${item.value.get(1)}
								
							</button>
							</td>
						</c:forEach>  -->  
				</tr>
			</c:forEach>
		  </table>
		</form>
		</div>
 </div>
</body>
</html>