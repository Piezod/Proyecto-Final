<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utilidades.Conexion" %>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<body>
<%
    /*
     Recargaremos de base de datos todas las respuestas que tenga esta pregunta.
 	 Para ello recogemos un objeto resulset con los datos y lo iremos recorriendo con un bucle dowhile despues de la comprobación de que exista o no exista
 	 Cada posicion del array resulset contendra diferentes datos
    	1)idrespuesta,2)respuesta,3)votospositivos,4)votosnegativos,5)mejorrespuesta,6)idpregunta,7)idusuario,8)fecha
 	 */
    		Conexion cr=(Conexion)session.getAttribute("conexion");
    			//cr.conectar();
    			
    			//ResultSet rs=cr.sacarrespuestasporid((int)session.getAttribute("idpregunta"));
    			/*
    			 Buscamos la respuesta que este verificada para esta pregunta
    			*/
    			String query="SELECT * FROM dbdamproject.respuestas where idpregunta="+(int)session.getAttribute("idpregunta")+" and mejorrespuesta=1";
    			ResultSet rs=cr.sacarresultset(query);
    			if (rs.next())
    			{ 
    				%>
    				<div class="container">
  						<div class="h1" align="center"> Respuestas Validadas
    				</div></div>
    				<%
    				
    				do{
    				%>
				<div class="=container-fluid">
				   	  <div class="row">
				    	  <div class="col-md-8 col-md-offset-2">
				         	<div class="panel panel-success">
				         	  <div class="panel-heading">
				         	  <div class="row">
				  	  	 		<div class="col-md-8 col-md-offset-2">				  	  	 		
			    					 <a href="ServerletDetalleUsuario?usuario=<%= rs.getString(7) %>">
			    					 <h3 align="center" class="panel-title">Respuesta de <%= rs.getString(7) %> </h3></a>
				  	  	 		</div><div class="col-md-2">
				  	  	 		<% if (session.getAttribute("admin").equals("1"))
				  	  	 			{%>
				  	  	  			    <input type="hidden" id="idresp" value="<%=rs.getString(1) %>"></input>
				  	  	  				<span class="glyphicon glyphicon-remove alert-danger" style="cursor: pointer; cursor: hand;" aria-hidden="true" onclick="confirmarbaja(<%=rs.getString(1)%>);"></span></a>
				  	  	  			<%} %>
				  	  	 		</div>
				       	    </div></div>
				         	  <div class="panel-body"> <%= rs.getString(2) %> </div>
				         	  <div class="panel-footer">
				         	  	
				         	  	<table border="0" width="100%">
				         	  		<tr>
				         	  			<td colspan="2" align="right">Fecha Respuesta : <%= rs.getString(8) %> </td>
				         	  		</tr>
				         	  		<tr>
				         	  			<td align="right">Votos positivos <span class="resalto"><%= rs.getString(3) %></span><a href="${pageContext.request.contextPath}/ServerletRespuesta?sumo=1&idrespuesta=<%=rs.getString(1)%>&tipo=mas&idpregunta=<%= request.getParameter("idpregunta") %>" class="btn btn-success" type="submit"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></a></td>
				         	  		 
				         	  			<td align="right">Votos Negativos <span class="resalto"><%= rs.getString(4) %></span><a  href="${pageContext.request.contextPath}/ServerletRespuesta?resto=1&idrespuesta=<%=rs.getString(1)%>&tipo=menos&idpregunta=<%= request.getParameter("idpregunta") %>" class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span></a></td>
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
				    <%} while(rs.next());
    			}  
    			else if (cr.sacarresultset("SELECT * FROM dbdamproject.respuestas where idpregunta="+(int)session.getAttribute("idpregunta")).next())
    			{
    				%>
    				<div class="=container-fluid">
			   	  <div class="row">
			    	  <div class="col-md-8 col-md-offset-2">
			         	<div class="panel panel-warning">
			         	  <div class="panel-heading">
			         	  <div class="alert alert-warning alert-dismissable">
			         	  	   <h3 align="center">No hay ninguna respuseta verificada aún </div>
			         	 
			       	    </div>
			       	  </div>
			          </div>
			  	  </div>
			  <%
			}
    			//cr.cerrarconexion();
				    %>
</body>
