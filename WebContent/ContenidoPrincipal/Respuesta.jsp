<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utilidades.Conexion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<head>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="Bootstrap/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Bootstrap/js/bootstrap.min.js"></script>
<link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<%@include file="Cabecera.jsp"%>

<script type="text/javascript">

function previsualizacion() {
	  
	alert(document.getElementById("comment").innerHTML)
	
		  	
		  	//Defino las variables que vamos a necesitar
		  	//El mensaje inicial al cual tenemos que modificar en el cual cambiamos los saltos
		  	//de lina por BR para que nos lo reconozca html
		  	var mensaje=document.getElementById("comment").innerHTML.split("\n").join("<br>");
		  	//La variable para almacenar el mensaje final
		  	var mensfinal=""
		  	//Separamos las lineas
		  	var lineas=mensaje.split("<br>")
		  	//En esta variable almacenaremos las lineas que van a necesitar pre
		  	//(las que empiecen por cuatro espacios)
		  	var lineasconpre=""
		  	for(var i=0;i<lineas.length;i++){
		  		//Recorremos todas las lineas y las que empiecen por cuatro espacios la almacenamos
		  		if(lineas[i].startsWith("    ")){
		  		lineasconpre+=i+","
		  		}
		  		
		  		
		  	}
		  	//Variables en las que almacenamos en que lineas tiene que empezar el pre
		  	var iniciopre=""
		  	//Y en cuales cerrarlas
		  	var finalpre=""
		  	//Le quito la ultima coma y la separo por comas
		  	lineasconpre=lineasconpre.substring(0,lineasconpre.length-1)
			lineasconpre=lineasconpre.split(",")
			//Recorremos todas las lineas que deberán tener pre
			//Este for lo hacemos para saber cuales deberan ir dentro de una unica etiqueta
			for(j=0;j<lineasconpre.length;j++){
					//La primera linea que entre en el for siempre va a ser inicial
					iniciopre+=lineasconpre[j]+","
					var encadenado=true
				while(j<lineasconpre.length&&encadenado){
					//Comprobamos que no sea la ultima para que no nos de problemas al sumarle 1
					if(j!=lineasconpre.length){
						/*
						Pongamos de ejemplo que tenemos esta cadena
						    a
						    a
						    a
						    a
						a
						    a
						el objetivo es que se genere
						<pre>a
						a
						a
						a</pre>
						a
						<pre>a</pre>
						el array generado sería
						[0]=0
						[1]=1
						[2]=2
						[3]=3
						[4]=5
						en este if comprobariamos que 
						1!=1
						2!=2
						3!=3
						
						4!=5
						*/
						if(parseInt(lineasconpre[j])+1!=lineasconpre[j+1]){
						encadenado=false
						}
					}
					if(encadenado)
					j++
				}
				finalpre+=lineasconpre[j]+","
				//en este ejemplo las variables quedarian con:
				//Iniciopre="0,5"
				//finalpre="3,5"
			}
		  	//Les quito la ultima coma
		  	iniciopre=iniciopre.substring(0,iniciopre.length-1)
		  	finalpre=finalpre.substring(0,finalpre.length-1)
		  	//Si estan vacios los pongo a null para que no de problema en los siguientes if
		  	if(lineasconpre==""){
		  		lineasconpre="null"
			}
		  	if(iniciopre==""){
				iniciopre="null"
			}
		  	if(finalpre==""){
		  		finalpre="null"
			}
			//Cojo las posiciones del array
			posicionlineasconpre=0
		  	posicioninicios=0
		  	posicionfinales=0
		  	
		  	for(var i=0;i<lineas.length;i++){
		  		//Compruebo que la linea tenga pre
		  		if(i==lineasconpre[posicionlineasconpre]){
		  			
		  			//Si tiene pre le quito los 4 espacios iniciales
		  			lineas[i]=lineas[i].substring(4,lineas[i].length)
		  			//Y sumo uno a la posicion
		  			posicionlineasconpre++
		  		}
		  		//Compruebo que sea una posicion de inicio
				if(i==iniciopre.split(",")[posicioninicios]){
					//Si es una posicion inicial le añado pre al inicio
					lineas[i]="<pre>"+lineas[i]
					//Y sumo uno a la variable
					posicioninicios++
				}

		  		//Compruebo que sea posicion final
				if(i==finalpre.split(",")[posicionfinales]){
					//Si es posicion final le añado pre al final
					lineas[i]+="</pre>"
					posicionfinales++
				}
				//Junto las lineas separadas por BR en el mensaje final
				mensfinal+=lineas[i]+"<br>"
		  	}
		  	//Aplico el mensaje final al div que queremos
		  	document.getElementById("mensajecopia").innerHTML=mensfinal;
		  
}
</script>

</head>

	
	

<body>
<div class="container-fluid">
<div class="row">
  <div class="col-md-offset-0 col-md-12">
  	<ol class="breadcrumb">
  		<li><a href="#">Inicio</a></li>
  		<li class="active">Detalle pregunta</li>
	</ol>
</div>
	<div class="row" style="margin-top: 5%">
	    <div class="col-md-8 col-md-offset-2">
			<div class="panel panel-info">
					  <div class="panel-heading">
					   <% 
			   	        /*
			   	        Aqui estoy recargando los nombres del usuario de momento , habra que validar que si esta pulsado las mas visitas recargar
			   	        las preguntas segun el boton del tab pulsado.
			   	        */
			   		 	Conexion c=new Conexion();
			    		c.conectar();
			    		if (session.getAttribute("idpregunta")==null)
							{
								%>
									<h3>Cargar jsp de pagina no encontrada</h3>
								<title>Pregunta no encontrada</title>
								<%
							}
			    		else
			    		{
			    			
			    		
			    		String []xo=c.sacarpreguntaporid((int)session.getAttribute("idpregunta"));
			    		
			    		 %>
			    		<title><%=xo[1]%></title>
			    		
						<h3 class="panel-title" align="center"><%=xo[1]%></h3>
					  </div>
					  
					  <div class="panel-footer" align="left" style="min-height: 200px;">
					  
			    			<div class="container-fluid" id="comment" >
			    			<%=xo[2] %>
			    				
			    			</div>
			    		
			    	 </div>
			    	 <%
			    	 }
			    	 %>
			</div>

		  </div>
		  <p onclick="previsualizacion();">PULSAR PARA CARGAR PREVISUALIZACION</p>
	</div>
</div>
<%@include file="pie.jsp"%>

</body>
</html>
