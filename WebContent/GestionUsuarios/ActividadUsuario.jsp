<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Utilidades.Conexion,java.sql.*"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad Usuario</title>
</head>
<body>
<table class="table">
<% Conexion c=(Conexion)session.getAttribute("conexion"); 
	ResultSet res=c.sacarresultset("select * from actividad where usuario like '"+session.getAttribute("usuario")+"' order by fecha");
	while(res.next()){
%>
<tr>
<td><%=res.getInt(2) %></td>
<td><%=res.getInt(3) %></td>
<td><%=res.getString(4) %></td>
<td><%=res.getString(5) %></td>


</tr>
<%} %>


</table>



</body>
</html>