<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="serverlets.*"%>
<%@ page import="Utilidades.*"%>
 <%@page import="java.sql.ResultSet"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">





<title>Estudiantes Conectados</title>
	<%@include file="Cabecera.jsp"%>
<head>
<script type="text/javascript">
 function bienvenida(){
    $('#myModal').modal('show');
};
</script>

</head>

<body>
	 
	 
	<!-- Modal para notificaciones  -->
<div class="container">
 
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" > <!--  el bakcgorun modifica el marco -->
    
      <!-- Modal content-->
      <div class="modal-content"> <!--  este es el backgroun blanco -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Bienvenido</h4>
        </div>
        <div class="modal-body">
          <p>Te damos la bienvenida al proyecto de fin de ciclo de Desarrollo de Aplicaciones Multiplataformas. Este proyecto esta elaborado integramente por Juan Carlos Gonzalez y Mario Gomez. Queremos que sea
          una aplicacion para compartir conocimientos con una base de datos que nos respondera a preguntas o realizar nuevas preguntas para que otros usuarios o profesores nos las resuelvan</p>
        </div>
        <div class="modal-footer" >
          <button type="button" class="btn btn-info" data-dismiss="modal" >Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<%
/*
 ejecutamos la funcion de javascript de bienvenida cuando sea la primera vez que recargamos el login
 acto seguido ponemos el booleano a false para que no se vuelva a repetir.
 El booleano se pone a true en el serverlet de login al redirigir a esta pagina, lo hacmeos de esta manera
 para que no se este todo el rato mostrando y sea incomodo.
*/
	if ((boolean)session.getAttribute("bienvenida"))
	{
		%><script type="text/javascript">
		bienvenida();
		</script>
		<%
		session.setAttribute("bienvenida", false);
	}
%>
	
	<div class="container-fluid">
		<div class="container-fluid">

			<div class="panel panel-info">
				<div class="panel-heading">
					<h1 align="center">Bienvenido a estudiantes conecta2</h1>
					<h4 align="center">Puedes realizar una pregunta a nuestro
						asistente para que te resuelva la duda , en caso de que no la
						encuentres no dudes en realizar una pregunta</h4>
					<br>

				</div>
				<!-- Envio al serverlet mediante un formulario por el methot post el valor altapregunta.jsp que sera el que recoja y luego sera el que
   			 recargue -->
				<div class="panel-body">
					<!-- ** IMPORTANTE ** -->
					<!-- ** Crearemos unos botones con el type submit y el name contenido, importante siempre se llamara contenido. Este boton
    		 sera el encargado de mandarnos el valor del jsp a cargar. En el value pondremos el nombre del jsp sin la extension, todos los 
    		 botones estaran incluiddos en un formulario que iran redirigidos a un serverlet que se llamara ***serverletcontenido***
    		  ** -->

					<form action="Pregunta" method="POST">
						<input type="hidden" name="pagina"
							value="ServerletAltapregunta.jsp"></input>
						<!-- ** IMPORTANTE ** -->
						<h4 align="center">
							<button class="btn btn-primary btn-lg" type="submit"
								name="contenido" value="AltaPregunta">Realizar nueva
								pregunta</button>
						</h4>
					</form>
				</div>
			</div>
		</div>
		<hr>

		<div class="container-fluid">


			<div class="row">
				<div class="col-md-2">
					<!-- Izquierda -->


				</div>

				<div class="col-md-8">
					<!-- Centro -->
					<ul class="nav nav-tabs">
						<li role="presentation"><a href="#">Mas Contestadas</a></li>
						<li role="presentation"><a href="#">Semana</a></li>
						<li role="presentation"><a href="#">Mes</a></li>
					</ul>
				</div>
				<div class="col-md-2">
					<!-- Derecha -->


				</div>
			</div>

		</div>

		<!-- En aqui recargamos el titulo de las preguntas-->
		<div class="col-md-8 col-md-offset-2">

			<%
				/*
				Sacaremos las ids de las ultimas 10 preguntas, en un array, este array despues lo recorreremos y pondremos el id de la pregunta en el valor
				del input que enviamos para lamar al jsp de respuesta y mostraremos el titulo de esa pregunta.
				*/
				Conexion co = (Conexion)session.getAttribute("conexion");
				//co.conectar();
				
				int inipag,pagpulsada;
				if (request.getParameter("pagpulsada")==null)
				{
					inipag=0;
					pagpulsada=1;
				}
				
				else
				{
					inipag=Integer.parseInt(request.getParameter("pagpulsada"))*10-10;
					pagpulsada=Integer.parseInt(request.getParameter("pagpulsada"));
				}
				
				int[] x = co.idultimas10preguntas(inipag,10);
				
				for (int i = 0; i < x.length; i++) {
					
					

					String titu[] = co.sacarpreguntaporid(x[i]);
					/*
					Como en este jsp ponemos las preguntas recargadas en arrays fijos de una longitud, lo que realizo es comprobaciones de que no este null
					si esta null no lo escribo, y si esta con valores los muestro y los pinto por pantalla
					*/
					if (titu[1]!=null)
					{
			%>
			<!-- Pintamos el cuerpo donde iran los titulos ancho 10, despues la fecha informacion de usuario con ancho 2 y debajo ponemos los tags de la pregunta -->
			<form action="DetallePregunta" method="POST">
				<div class="row">
					<div class="col-md-10">
					 
						<input type="hidden" name="idpregunta" value="<%=x[i]%>"></input>
						<button type="submit" name="submit_param" value="submit_value"
							class="list-group-item list-group-item-info">
							<%=titu[1]%>
						</button>
					</div>
					<div class="col-md-2">
						<table>
							<tr>
								<td> Usuario: <span class="label label-success"> <abbr
										class="initialism"
										title="AQUI DESPLIEGO YO LO QUE QUIERO PORQUE SE PUEDE Y MOLA"><%=titu[3]%></abbr></td>
								</span>
							</tr>
							<tr>
								<td><span class="label label-default"><abbr
										title="gg"><%=titu[4]%></abbr></td>
								</span>
							</tr>
						</table>
					</div>
					<div class="col-md-8">
						<code> tag1 </code>
						,
						<code> tag2 </code>
						,
						<code> tag3 </code>
						,
						<code> tag4 </code>
					</div>
				</div>
				<hr>
			</form>
			<%
				}}
			%>

		</div>


	</div>

<div class="row">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-8" align="center">
					<ul class="pagination" >
						 <li><a href="#">&laquo;</a></li>
							<% 
								ResultSet r=co.sacarundato("select idpreguntas from dbdamproject.preguntas");
							
								int nuevapaginaion=0,numeropagina=0,inicio=0,fin=10;
									while (r.next())
									{
										nuevapaginaion++;
										if (nuevapaginaion==10)
										{
											numeropagina++;
											if (pagpulsada==numeropagina)
											{
												%>
												<li class="active" ><a " href="ServerletAltaPregunta?inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
											}
											else
											{
												
											%>
											<li><a href="ServerletAltaPregunta?inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
											
											}
											nuevapaginaion=0;
											inicio+=10;
											fin=10;
										}
										
									}
									
									if (nuevapaginaion>0)
									{
										numeropagina++;
										if (pagpulsada==numeropagina)
										{
											%>
											<li class="active" ><a " href="ServerletAltaPregunta?inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
										}
										else
										{
											
										%>
										<li><a href="ServerletAltaPregunta?inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
										
										}
										nuevapaginaion=0;
										inicio+=10;
										fin=10;
									}
									
								//co.cerrarconexion();
							%>
						 
						  
						  <li><a href="#">&raquo;</a></li>
	 				  </ul>
	   			 </div>
</div>

	<%@include file="pie.jsp"%>

</body>
</html>
