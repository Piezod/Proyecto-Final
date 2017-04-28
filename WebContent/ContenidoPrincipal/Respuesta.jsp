<%@page import="sun.security.krb5.internal.crypto.crc32"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utilidades.Conexion" %>
    <%@page import="java.sql.ResultSet"%>
    
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
<script type="text/javascript">



function previsualizacion() {

	if (document.getElementById("respuesta").value.length > 0) {
		

		//Defino las variables que vamos a necesitar
		//El mensaje inicial al cual tenemos que modificar en el cual cambiamos los saltos
		//de lina por BR para que nos lo reconozca html
		var mensaje = document.getElementById("respuesta").value.split("\n")
				.join("<br>");
		//La variable para almacenar el mensaje final
		var mensfinal = ""
		//Separamos las lineas
		var lineas = mensaje.split("<br>")
		//En esta variable almacenaremos las lineas que van a necesitar pre
		//(las que empiecen por cuatro espacios)
		var lineasconpre = ""
		for (var i = 0; i < lineas.length; i++) {
			//Recorremos todas las lineas y las que empiecen por cuatro espacios la almacenamos
			if (lineas[i].startsWith("    ")) {
				lineasconpre += i + ","
			}

		}
		//Variables en las que almacenamos en que lineas tiene que empezar el pre
		var iniciopre = ""
		//Y en cuales cerrarlas
		var finalpre = ""
		//Le quito la ultima coma y la separo por comas
		lineasconpre = lineasconpre.substring(0, lineasconpre.length - 1)
		lineasconpre = lineasconpre.split(",")
		//Recorremos todas las lineas que deberán tener pre
		//Este for lo hacemos para saber cuales deberan ir dentro de una unica etiqueta
		for (j = 0; j < lineasconpre.length; j++) {
			//La primera linea que entre en el for siempre va a ser inicial
			iniciopre += lineasconpre[j] + ","
			var encadenado = true
			while (j < lineasconpre.length && encadenado) {
				//Comprobamos que no sea la ultima para que no nos de problemas al sumarle 1
				if (j != lineasconpre.length) {
					
					if (parseInt(lineasconpre[j]) + 1 != lineasconpre[j + 1]) {
						encadenado = false
					}
				}
				if (encadenado)
					j++
			}
			finalpre += lineasconpre[j] + ","
			//en este ejemplo las variables quedarian con:
			//Iniciopre="0,5"
			//finalpre="3,5"
		}
		//Les quito la ultima coma
		iniciopre = iniciopre.substring(0, iniciopre.length - 1)
		finalpre = finalpre.substring(0, finalpre.length - 1)
		//Si estan vacios los pongo a null para que no de problema en los siguientes if
		if (lineasconpre == "") {
			lineasconpre = "null"
		}
		if (iniciopre == "") {
			iniciopre = "null"
		}
		if (finalpre == "") {
			finalpre = "null"
		}
		//Cojo las posiciones del array
		posicionlineasconpre = 0
		posicioninicios = 0
		posicionfinales = 0

		for (var i = 0; i < lineas.length; i++) {
			//Compruebo que la linea tenga pre
			if (i == lineasconpre[posicionlineasconpre]) {

				//Si tiene pre le quito los 4 espacios iniciales
				lineas[i] = lineas[i].substring(4, lineas[i].length)
				//Y sumo uno a la posicion
				posicionlineasconpre++
			}
			//Compruebo que sea una posicion de inicio
			if (i == iniciopre.split(",")[posicioninicios]) {
				//Si es una posicion inicial le añado pre al inicio
				lineas[i] = "<pre>" + lineas[i]
				//Y sumo uno a la variable
				posicioninicios++
			}

			//Compruebo que sea posicion final
			if (i == finalpre.split(",")[posicionfinales]) {
				//Si es posicion final le añado pre al final
				lineas[i] += "</pre>"
				posicionfinales++
			}
			//Junto las lineas separadas por BR en el mensaje final
			mensfinal += lineas[i] + "<br>"
		}
		//Aplico el mensaje final al div que queremos
		//document.getElementById("mensajecopia").innerHTML = mensfinal;
		document.getElementById("mensajeoculto").value = mensfinal;
		document.getElementById("mensajecopia").innerHTML = mensfinal;
		
	}
}
</script>

<style type="text/css">

td{
	font: italic;
	color: gray;	
}
.resalto
{

	font: bolder;
	text-decoration: underline;
	color: black;
	margin-right: 2%;
	
}
</style>
<%@include file="Cabecera.jsp"%>


<body>

<div class="container-fluid">
<div class="row">
<div class="col-md-offset-0 col-md-12">
  	<ol class="breadcrumb">
  		<li><a href="${pageContext.request.contextPath}/ServerletContenido">Inicio</a></li>
  		<li class="active">Detalle pregunta</li>
	</ol>
</div>
	<div class="container-fluid">
	<div class="row" style="margin-top: 5%">
	    <div class="col-md-8 col-md-offset-2">
			<div class="panel panel-primary ">
					  <div class="panel-heading">
					
					  
					   <% 
			   		 	Conexion c=(Conexion)session.getAttribute("conexion");
			    		//c.conectar();
			    		int paginas=Integer.parseInt(c.recibirdato("select count(*) from respuestas where idpregunta like '"+request.getParameter("idpregunta")+"'"))/10;
			    		if (request.getParameter("idpregunta")==null)
							{
								%>
						<h3>Cargar jsp de pagina no encontrada</h3>
						</div>
						</div>
						</div>
						</div>
                                <%
							}
			    		else if(!c.comprobar("select * from preguntas where idpreguntas like'"+request.getParameter("idpregunta")+"'")){
			    			%>
							<h3>Cargar jsp de pagina no encontrada</h3>
							</div>
							</div>
							</div>
	                                <%
			    		
			    		}/*
			    		else if(request.getParameter("pagpulsada")==null){
			    				//if (paginas<Integer.parseInt((String)request.getParameter("pagpulsada")))
			    				{
			    			response.sendRedirect("Respuesta?idpregunta="+request.getParameter("idpregunta"));
			    				}
			    		}*/
			    		else{
			    			
			    		/*
			    		 Realizo una busqueda en la base de datos para sacar la pregunta en funcion del id que se ha pulsado en el enlace anterior
			    		 Lo almacenamos en un array de string en los cuales tenemos la informacion referente a esa pregunta
			    		*/
			    		String []xo=c.sacarpreguntaporid(Integer.parseInt((String)request.getParameter("idpregunta")));
			    		/*for (int i=0;i<xo.length;i++)
			    		{
			    			out.println(xo[i]);
			    		}*/
			    		
			    		 %>
			    		<title><%=xo[1]%></title>
			    		
						<h1 class="panel-title" style="font-size: 30px" align="center"><%=xo[1]%></h1>
					  </div>
					  
					  <div class="panel-footer" align="left" style="min-height: 200px;">
					  
			    			<div class="container-fluid" id="comment" >
			    			<%=xo[2] %>
			    				
			    			</div>
			    		
			    	 </div>
			    	 <div class="panel-body" align="right">
			    	 <a href="ServerletDetalleUsuario?usuario=<%=xo[3] %>">
			    	 	 <span class="label label-success"  ><%=xo[3] %></span>
			    	 	</a>
			    	 			
			    	 	  <span class="label label-default" ><%=xo[4] %></span>
			    	 </div>
			    	 
			</div>

	  </div>
	</div>
	</div>
</div>
    <br><hr>
					  <br>
					  
					  <%@include file="MejorRespuesta.jsp"%>  
					  
					  <hr>
    
    <%
    /*
     Recargaremos de base de datos todas las respuestas que tenga esta pregunta.
 	 Para ello recogemos un objeto resulset con los datos y lo iremos recorriendo con un bucle dowhile despues de la comprobación de que exista o no exista
 	 Cada posicion del array resulset contendra diferentes datos
    	1)idrespuesta,2)respuesta,3)votospositivos,4)votosnegativos,5)mejorrespuesta,6)idpregunta,7)idusuario,8)fecha
 	 */
    		 cr=(Conexion)session.getAttribute("conexion");
    			//cr.conectar();
    			
    			int inipag,pagpulsada;
				if (request.getParameter("pagpulsada")==null || request.getParameter("pagpulsada").equals(""))
				{
					inipag=0;
					pagpulsada=1;
				}
				
				else
				{
					inipag=Integer.parseInt(request.getParameter("pagpulsada"))*10-10;
					pagpulsada=Integer.parseInt(request.getParameter("pagpulsada"));
				}
				
    			int iniciores=(int)session.getAttribute("iniciores");
    			  rs=cr.sacarrespuestasporid(Integer.parseInt((String)request.getParameter("idpregunta")),inipag,(int)session.getAttribute("finres"));
    			/*
    			Sacamos los votos de la pregunta, en caso de que los positivos sean mayores que los negativos dibujamos la parte de arriba que es un panel en azul
    			si los negativos son iguales mayores a los positivos se pone en rojo
    			*/
    			
    			if (rs.next())
    			{ 
    				do{
    					
    					if (Integer.parseInt(rs.getString(3)) >= Integer.parseInt(rs.getString(4))*5 ||  (Integer.parseInt(rs.getString(3))==1 && Integer.parseInt(rs.getString(4))==0) )
    							{
    				%>
    				<div class="=container-fluid">
				   	  <div class="row">
				    	  <div class="col-md-8 col-md-offset-2">
				         	<div class="panel panel-info">
				         	  <div class="panel-heading">
				         	  
			    	 <a href="ServerletDetalleUsuario?usuario=<%= rs.getString(7) %>">
				         	    <h3 align="center" class="panel-title">Respuesta de <%= rs.getString(7) %> </h3></a>
				       	    </div>
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
				  	  
    				
    				<%
    							}
    					else
    					{%>
    						<div class="=container-fluid">
    					   	  <div class="row">
    					    	  <div class="col-md-8 col-md-offset-2">
    					         	<div class="panel panel-danger">
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
    					         	  			<td align="right">Votos positivos <span class="resalto"><%= rs.getString(3) %></span> <a href="${pageContext.request.contextPath}/ServerletRespuesta?sumo=1&idrespuesta=<%=rs.getString(1)%>&tipo=mas&idpregunta=<%= request.getParameter("idpregunta") %>" class="btn btn-success" type="submit" style="margin:2%"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></a></td>
    					         	  		 
    					         	  			<td align="right">Votos Negativos <span class="resalto"><%= rs.getString(4) %></span> <a  href="${pageContext.request.contextPath}/ServerletRespuesta?resto=1&idrespuesta=<%=rs.getString(1)%>&tipo=menos&idpregunta=<%= request.getParameter("idpregunta") %>" class="btn btn-danger" type="submit" style="margin:2%"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span></a></td>
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
    					  	  
    					  	  
    					  	  <%
    					}
    				}while(rs.next());
    			}
    			
    			else
    			{/*
    				Si no hemos obtenido ningun resultado ya que no hay respuestas, mostraremos un mensaje de alerta para informar al usuario de que no hay respuestas para esta prgunta
    				e incentivar a que se conteste.
    				*/
    			  %>
    				<div class="=container-fluid">
				   	  <div class="row">
				    	  <div class="col-md-8 col-md-offset-2">
				         	<div class="panel panel-warning">
				         	  <div class="panel-heading">
				         	  <div class="alert alert-warning alert-dismissable">
				         	  	   <h3 align="center">No hay respuestas todavia , sé el primero en participar y si la respuesta es buenabuena conseguiras extrapoints</h3>
				         	  </div>
				         	 
				       	    </div>
				       	  </div>
				          </div>
				  	  </div>
				  <%
    			}			
    %>
 	  
  	  <div class="container-fluid">
  	  	<div class="col-md-8 col-md-offset-2 ">
		  	 <div class="row" style="margin-top: 2%; margin-right: 5%; margin-left: 5%;">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="container-fluid">
							<div class="col-sm-2 col-md-offset-0 col-md-12">
								<h1 align="center">	Nueva respuesta	</h1>
							</div>
						</div>
					</div>
					<!-- El cuerpo de panel lo dejo en blanco pero relleno el formulario en el pie porque quiero el lightgrey -->
			<div class="panel-footer">
		
			<div class="container-fluid" style="margin-top: 3%">
							<br>
							
			    	  <form class="form-horizontal" action="ServerletRespuesta" method="POST">
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd">Descripcion</label>
									<div class="col-sm-8 col-md-8">
										<textarea style="overflow-y: scroll; height: 50%; resize: none"
											class="form-control" rows="10" id="respuesta" name="respuesta" onkeyup="return previsualizacion();"></textarea>
										<input type="hidden" id="mensajeoculto" name="mensajeoculto">
									</div>
								</div>
		  	  			
			  
			    <div class="col-md-2 col-md-offset-7" >
			    <!-- Enviamos los datos para el insert a traves de inputs hidden, como es el id a la pregunta que pertenece y el usuario que realiza la respuesta -->
				    		<input type="hidden" id="idpregunta" name="idpregunta" value="<%=request.getParameter("idpregunta")%>">
				    		<input type="hidden" id="idusuario" name="idusuario" value="<%=session.getAttribute("usuario")%>">
						    <button type="submit" class="btn btn-primary btn-lg" style="margin-top: 10%">Publicar Respuesta</button>
					    </div>
					    </form>
					   
					  </div>
					  
		    </div>
		  	   <div class="panel-body">
							<div class="container-fluid">
								<div class="col-md-12 col-md-offset-0">
									<p id="mensajecopia" class="romper"></p>
								</div>
							</div>
						</div>
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
								ResultSet r=c.sacarresultset("select idrespuesta from dbdamproject.respuestas where idpregunta="+(String)request.getParameter("idpregunta"));
							
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
												<li class="active" ><a  href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=respuesta&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>&idpregunta=<%=request.getParameter("idpregunta")%>"><%=numeropagina%></a></li><%
											}
											else
											{
												
											%>
											<li><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=respuesta&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>&idpregunta=<%=request.getParameter("idpregunta")%>"><%=numeropagina%></a></li><%
											
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
											<li class="active" ><a  href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=respuesta&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>&idpregunta=<%=request.getParameter("idpregunta")%>"><%=numeropagina%></a></li><%
										}
										else
										{
											
										%>
										<li><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=respuesta&inicio=<%=inicio%>&fin=<%=fin%>&pagpulsada=<%=numeropagina%>&idpregunta=<%=request.getParameter("idpregunta")%>"><%=numeropagina%></a></li><%
										
										}
										nuevapaginaion=0;
										inicio+=10;
										fin=10;
									}
									
							%>
						 
						  
						  <li><a href="#">&raquo;</a></li>
	 				  </ul>
	   			 </div>
</div>

    <%
			    	 }
			    		
			    	 %>
    
<%@include file="pie.jsp"%>
</body>
<%//c.cerrarconexion();
//cr.cerrarconexion();%>
</html>
