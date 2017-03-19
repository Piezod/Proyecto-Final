<%@page import="sun.security.krb5.internal.crypto.crc32"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="Utilidades.Conexion" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Usuarios registrados</title>
</head>
<body>

<%@include file="Cabecera.jsp"%>
<div class="container-fluid">
	<div class="col-md-offset-0 col-md-12">
	  	<ol class="breadcrumb">
	  		<li><a href="ServerletContenido">Inicio</a></li>
	  		<li class="active">Lista de usuarios</li>
		</ol>
	</div>
</div>
<div class="container-fluid" >
	<div class="row">
	  <div class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 " >
	  		<table class="table table-hover">
	  			<thead>
				      <tr>
				        <th>Usuario</th>
				        <th>Nombre</th>
				        <th>Apellido</th>
				        <th>Ciclo</th>
				        <th>Curso</th>
				      </tr>
				    </thead>
				    <tbody>
	  		<%
	  		/*
	  			Dibujamos una tabla con hover, en la que recargaremos algunos datos de los usuarios
	  		*/
	  			Conexion c=new Conexion();
	  		c.conectar();
	  		//out.print("select * from usuarios where ciclo in (select ciclo from usuarios where usuario like '"+(String)session.getAttribute("usuario")+"')");
	  		ResultSet ru=c.sacarundato("select * from usuarios where ciclo in (select ciclo from usuarios where usuario like '"+(String)session.getAttribute("usuario")+"') order by curso limit "+(int)session.getAttribute("iniciores")+","+(int)session.getAttribute("finres")+"" );
	  		while (ru.next())
	  		{
	  			%>
	  			<tr>
					<%
					/*
					 Se resalta si el usuario es admin / profesor o es un usuario normal.
					 
					 Habra que poner en los nombes un enlace a un nuevo jsp que nos muestre los detalles del usuario, esos detalles incluiran las respuestas
					 y preguntas donde han participado.
					*/
						if (ru.getInt(11)==1)
						{%>
							<td><a href="#"><span class="label label-primary"><%=ru.getString(1) %></span></a></td>
						<%}
						else
						{%>
							<td><a href="#"><span class="label label-default"><%=ru.getString(1) %></span></a></td>
						<%}
					%>      
				        <td><%=ru.getString(3) %></td>
				        <td><%=ru.getString(4) %></td>
				        <td><%=ru.getString(8) %></td>
				        <td><%=ru.getString(9) %></td>
				      </tr>
	  		<%	
	  		}
	  			
	  		%>
	  					    </tbody>
				  </table>
				</div>
			</div>
	  </div>
	</div>
</div>

    
<div class="row">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-8" align="center">
					<ul class="pagination" >
						 <li><a href="#">&laquo;</a>
						 </li>
							<% 
							/*
							 resulset que dibujaran los pie de pagina en funcion de los resultados similares que existan, la variable nueva paginación es la que
							 nos marcara los numeros de resultados a mostrar por pagina. Idea para meterlo en un <select> y que el usuario pueda decir cuantos resultados poner
							*/
								ResultSet r=c.sacarundato("Select * from usuarios where ciclo in (select ciclo from usuarios where usuario like '"+(String)session.getAttribute("usuario")+"') order by curso" );
							
								int nuevapaginaion=0,numeropagina=0,inicio=0,fin=10;
									while (r.next())
									{
										nuevapaginaion++;
										if (nuevapaginaion==10)
										{ 
											numeropagina++;
											if ((int)session.getAttribute("pagpulsada")==numeropagina)
											{
												%>
												<li class="active" ><a " href="ServerletRespuestaPaginacion?pag=usuarios&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
											}
											else
											{
												
											%>
											<li><a href="ServerletRespuestaPaginacion?pag=usuarios&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
											
											}
											nuevapaginaion=0;
											inicio+=10;
											fin=10;
										}
										
									}
									
									if (nuevapaginaion>0)
									{ 
										numeropagina++;
										if ((int)session.getAttribute("pagpulsada")==numeropagina)
										{
											%>
											<li class="active" ><a " href="ServerletRespuestaPaginacion?pag=usuarios&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
										}
										else
										{
											
										%>
										<li><a href="ServerletRespuestaPaginacion?pag=usuarios&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
										
										}
										nuevapaginaion=0;
										inicio+=10;
										fin=10;
									}

							  		c.cerrarconexion();
							%>
						  <li><a href="#">&raquo;</a></li>
	 				  </ul>
	   			 </div>
</div>
   

</body>
</html>