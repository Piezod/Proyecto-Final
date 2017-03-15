<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utilidades.Conexion" %>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Cabecera.jsp"%>
<%
    /*
     Recargaremos de base de datos todas las respuestas que tenga esta pregunta.
 	 Para ello recogemos un objeto resulset con los datos y lo iremos recorriendo con un bucle dowhile despues de la comprobación de que exista o no exista
 	 Cada posicion del array resulset contendra diferentes datos
    	1)idrespuesta,2)respuesta,3)votospositivos,4)votosnegativos,5)mejorrespuesta,6)idpregunta,7)idusuario,8)fecha
 	 */
    		Conexion cr=new Conexion();
    			cr.conectar();
    			
    			//ResultSet rs=cr.sacarrespuestasporid((int)session.getAttribute("idpregunta"));
    			String query="SELECT * FROM dbdamproject.respuestas where idpregunta="+(int)session.getAttribute("idpregunta")+" and mejorrespuesta=1";
    			ResultSet rs=cr.sacarundato(query);
    			
    			if (rs.next())
    			{ 
    				%>
<div class="=container-fluid">
				   	  <div class="row">
				    	  <div class="col-md-8 col-md-offset-2">
				         	<div class="panel panel-success">
				         	  <div class="panel-heading">
				         	    <h3 align="center" class="panel-title">Respuesta de <%= rs.getString(7) %> </h3>
				       	    </div>
				         	  <div class="panel-body"> <%= rs.getString(2) %> </div>
				         	  <div class="panel-footer">
				         	  	
				         	  	<table border="0" width="100%">
				         	  		<tr>
				         	  		
				         	  		
				         	  			<td colspan="2" align="right">Fecha Respuesta : <%= rs.getString(8) %> </td>
				         	  			
				         	  		</tr>
				         	  		<tr>
				         	  			<td align="right">Votos positivos <%= rs.getString(3) %><a href="ServerletRespuesta?sumo=1&idrespuesta=<%=rs.getString(1)%>" class="btn btn-success" type="submit"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></a></td>
				         	  		 
				         	  			<td align="right">Votos Negativos <%= rs.getString(4) %><a  href="ServerletRespuesta?resto=1" class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span></a></td>
				         	  		 </tr>
				         	  	</table>
				         	  </div>
				       	  </div>
				          </div>
				  	  </div>
				  	  <br>
				  	  <hr>
				  	  <br>
				    </div>
				    <%} 
    			else
    			{
    				%>
    				<div class="=container-fluid">
			   	  <div class="row">
			    	  <div class="col-md-8 col-md-offset-2">
			         	<div class="panel panel-warning">
			         	  <div class="panel-heading">
			         	  <div class="alert alert-warning alert-dismissable">
			         	  	   <h3 align="center">no hay ninguna respuseta verificada aún </div>
			         	 
			       	    </div>
			       	  </div>
			          </div>
			  	  </div>
			  <%
			}
				    %>
</body>
</html>