<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datos Usuario</title>
</head>
<body>
<div class="panel panel-default">
	  <div class="panel-heading" align="center">
	    <h3 align="center">Datos de usuario <%=session.getAttribute("usuario") %></h3>
      </div>
			<div class="panel-body"> 
				<table width="100%">
				<tr>
					<td>Usuario:</td><td><input type="text" value="NombreUsuario" readonly></td>
				</tr>
				</table> 
			</div>
	  
  </div>
</body>
</html>