<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="serverlets.*" %>
   <%@ page import="Utilidades.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Resultados Busqueda</title>
</head>
<body>
  	 <%@include file="Cabecera.jsp"%>


<div class="container-fluid">
	<div class="container-fluid">
	
	<div class="panel panel-info">
  		<div class="panel-heading">
		  <h1 align="center" >Bienvenido a estudiantes conecta2</h1>
		  <h4 align="center">Estos son los resultados que tenemos para la pregunta <%= request.getParameter("search") %></h4>
		  <br>
	
	  </div>
     <div class="panel-body">
	    </div>
	  </div>
    </div>
    
    <hr>
	<!-- En aqui recargamos el titulo de las preguntas-->
		<div class="col-md-8 col-md-offset-2">
			
	    			<div class="col-md-10">
					  <% 
			   	        /*
			   	        Sacaremos las ids de las ultimas 10 preguntas, en un array, este array despues lo recorreremos y pondremos el id de la pregunta en el valor
			   	        del input que enviamos para lamar al jsp de respuesta y mostraremos el titulo de esa pregunta.
			   	        */

			   		 	Conexion c=(Conexion)session.getAttribute("conexion");
			   	     	//c.conectar();
			   	     	int idpre=0;
			   	     	/*
			   	     	Recargo un resulset en el cual le paso el parametro de busqueda
			   	     	*/
			   	     	ResultSet r;
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
						
			   	     	if (request.getParameter("search")!=null)
			   	     	{
			   	     		/*
			   	     		 Si es la primera vez que entramos en la busqueda, tendremos el parametro search lleno, para guardarlo lo almacenaremos en una
			   	     		 variable de sesion y pondremos que la busqueda de las preguntas nos saque desde la 0  y 10 visiones
			   	     		*/
			    			 r=c.resulsetpregunta(request.getParameter("search"),inipag,10);
				   	     	session.setAttribute("search", request.getParameter("search"));
			   	     	}
			   	     	else
			   	     	{
			   	     		/*
			   	     		 Si recargamos la pagina pulsando el pie de pagina, le pasamos ya los parametros de la posicion pulsada asi como el valor  para buscar
			   	     		 almacenado en la sesion atribute.
			   	     		*/
			   	     	 r=c.resulsetpregunta((String)session.getAttribute("search"),inipag,10);
			   	     	}
			   	     		
    			
    			/*
    			Recorro el resulset
    			*/
    		if (r.next())
    		{
    			/*
    			 Recorremos el resulset con las coincidencias de la pregunta y las imprimimos.
    			*/
    			do{
    				 idpre=Integer.parseInt(r.getString(1));
    			%>
    			<form action="DetallePregunta" method="POST">
		    			<div class="panel panel-info">
								<input type="hidden" name="idpregunta" value="<%=r.getString(1)%>"></input>
								<div  class="panel-heading" >
									<h1 align="center">
										<button type="submit" name="submit_param" value="submit_value" class="list-group-item list-group-item-info" >
											<%=r.getString(2)%>
										</button>
									</h1>
								</div>
				</form>
    			<%
    			/*
    			 Comprobamos la longitud de la respuesta, en caso de que sea superior a X longitud hacemos un substring y mostramos solo los X caracteres.
    			 Es a titulo informativo, si desea ver mas informacion sobre esa pregunta, al pulsar sobre el titulo se le redirije a detallepregunta pasando el id
    			 de la pregunta.
    			*/
    				if (r.getString(3).length()>250)
    				{
    					%>
    					<div class="panel-footer">
    						<h4>La respuesta es <%=r.getString(3).substring(0,250)+" ..." %></h4>
    					</div>
    					<%
    				}
    				else
    				{
    					%>
    					<div class="panel-footer">
    						<h4>La respuesta es <%=r.getString(3)+" ..." %></h4>
    					</div>
    					
    					<%
    				}
    			%>
    			</div>
    			<%
    			
    			}while(r.next());
    			%>
    			
    			</div>
				</div>
    			<%
    		
    		}
    		else
    		{
    			/*
    			 Si no hay resultados mostraremos un jsp diciendo que no hay coincidencias
    			*/
    		%>
    			<div class="panel panel-info">
				<div class="panel-heading">
					
					<h4 align="center">Se ha realizado una busqueda y no hay resultados. Puedes buscar otra cosa de nuevo
					 o realizar una nueva pregunta</h4>
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
			<%
    		}
			  %>
		</div>
	
	
</div>


<div class="row">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-8" align="center">
					<ul class="pagination" >
							<% 
							
							/*
							 saco el numero maximo de respuestas para generar tantas etiquetas de numero como numero existan entre 10, es decir
							 para 14 saco 2.
							*/
							
							
							r=c.resulsetpregunta((String)session.getAttribute("search"),inipag,10);
							if (r.next())
							{
								/*
								 saco el numero maximo de respuestas para generar tantas etiquetas de numero como numero existan entre 10, es decir
								 para 14 saco 2.
								*/
							
								ResultSet rp=c.sacarresultset("SELECT * FROM dbdamproject.preguntas where descripcion like '%"+(String)session.getAttribute("search")+"%' or titulo like '%"+(String)session.getAttribute("search")+"%'");
							
							
							int nuevapaginaion=0,numeropagina=0,inicio=0,fin=10;
							while (rp.next())
							{
								nuevapaginaion++;
								if (nuevapaginaion==10)
								{ 
									/*
									 si he recorrido 10 respuestas, creo una hoja nueva, y compruebo si el numero de pagina que he creado esta en la variable
									 pagpulsada, que sera la que mediante css me cambie el estilo del pie de pagina poniendo un color u otro
									*/
									numeropagina++;
									if (pagpulsada==numeropagina)
									{
										%>
										<li class="active" ><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=busqueda&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
									}
									else
									{
										
									%>
									<li><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=busqueda&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
									
									}
									nuevapaginaion=0;
									inicio+=10;
									fin=10;
								}
								
							}
							
							/*
							 reviso que el numero de paginas sea mayor de 0, es decir que para 14, me quedarian 4, al ser mayor de 0 creo la pagina extra
							 siguiendo lo mismo de antes.
							*/
							if (nuevapaginaion>0)
							{ 
								numeropagina++;
								if (pagpulsada==numeropagina)
								{
									%>
									<li class="active" ><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=busqueda&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
								}
								else
								{
									
								%>
								<li><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=busqueda&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>"><%=numeropagina%></a></li><%
								
								}
								nuevapaginaion=0;
								inicio+=10;
								fin=10;
							}
							}
							//c.cerrarconexion();%>
	 				  </ul>
	   			 </div>
</div>
<%@include file="pie.jsp"%>
</body>
</html>