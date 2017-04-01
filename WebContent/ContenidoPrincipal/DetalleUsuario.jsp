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
//le pongo a la pagecontext importante para que luego se recorra el foreach
pageContext.setAttribute("lista", lista);
%>

<h1> Primera prueba de stl recogiendo datos por sql</h1>
	<table>
		<c:forEach var="item"  items="${lista}">
			<tr>
				<td>${item}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>