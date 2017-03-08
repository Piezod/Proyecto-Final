<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
 
  
  function comprobarregistro() {
		//Validaciones del formulario
		var problema = "";
		
		if(document.getElementById("titulo").value.length==0){
			problema = "Titulo vacio";
			
			document.getElementById("titulaso").innerHTML='<div class="form-group has-error has-feedback"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-6 col-md-8"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"><span class="glyphicon glyphicon-remove form-control-feedback"></span></div> </div> ';
			
			
		}
		if(document.getElementById("comment").value.length==0){
			if (problema.length != 0) {
				problema += "\n";
			}
			problema += "Mensaje vacio ";
			if(document.getElementById("titulo").value.length!=0){
				titulo=document.getElementById("titulo").value
				document.getElementById("titulaso").innerHTML='<div class="form-group"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-6 col-md-8"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"> </div> </div>'
				document.getElementById("titulo").value=titulo
				
			}
			}

		if (problema.length != 0) {
			alert(problema)
			return false;
		} else {
			return true;
		}

	}
  
  function previsualizacion() {
	  
		
	  if (document.getElementById("titulo").value.length>0 || document.getElementById("comment").value.length>0 )
		  {
		  	document.getElementById("titulocopia").innerHTML=document.getElementById("titulo").value;
		  	
		  	
		  	var mensaje=document.getElementById("comment").value.split("\n").join("<br>");
		  	var mensfinal=""
		  	var lineas=mensaje.split("<br>")
		  	for(var i=0;i<lineas.length;i++){
		  		
		  		if(lineas[i].startsWith("    ")){
		  			if(i!=0&&lineas[i-1].startsWith("<pre>")){
		  			lineas[i]=lineas[i].substring(4,lineas[i].length)
		  			}else{
			  			lineas[i]="<pre>"+lineas[i].substring(4,lineas[i].length)

		  			}
		  			if(i+1<lineas.length&&!lineas[i+1].startsWith("<pre>"))
		  				lineas[i]+="</pre>"
		  			if(i+1<lineas.length&&lineas[i].endsWith("</pre>")&&lineas[i+1].startsWith("<pre>"))
		  				lineas[i].substring(0,lineas[i].lenght-6)
		  		}
		  		mensfinal+=lineas[i]
		  	}
		  	document.getElementById("mensajecopia").innerHTML=mensfinal;
		  }
 }
  function verprevi() {
	
	  	if ( (document.getElementById("previ").style.display)=='none')
	  		{
	  		

		    document.getElementById("previ").style.display = 'block';
		    document.getElementById("tituloprevi").innerHTML="Mostrando la previsualizacion";
	  		}
	  	else
	  		{
	  		 document.getElementById("previ").style.display = 'none';
	  		document.getElementById("tituloprevi").innerHTML="Pulsa para ver la previsualizacion del mensaje";
	  		}
		  
}
  
  </script>
  
</head>
<body>

<div class="container-fluid" style=" margin-top: 5%; margin-right: 10%; margin-left: 10%;">
	<div class="panel panel-primary">
		<div class="panel-heading">
				<div class="container-fluid">
			  <div class="col-sm-2 col-md-offset-0 col-md-12">
				  <h2 align="center">Nueva Pregunta</h21>
				  
				  
					</div>
				 </div>
		</div>
		<!-- El cuerpo de panel lo dejo en blanco pero relleno el formulario en el pie porque quiero el lightgrey -->
		<div class="panel-body">
		</div>
		<div class="panel-footer">  
		
			<div class="container-fluid" style="margin-top: 3%">
	  <br>
	  <form class="form-horizontal" action="AltaPregunta" method="POST" onsubmit="return comprobarregistro();">
	  
	    <div id="titulaso">
		  	 <div class="form-group">
		      <label class="control-label col-sm-2" for="titulo">Titulo:</label>
		      <div class="col-sm-6 col-md-8">
		        <input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo" onkeyup="previsualizacion();">
		      </div>
		    </div>
	  	</div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Descripcion</label>
	      <div class="col-sm-4 col-md-8">          
	         <textarea  style="overflow-y: scroll;   height: 50%;  resize: none"   class="form-control" rows="10" id="comment" name="mensaje" onkeyup="previsualizacion();"></textarea>
	      </div>
	    </div>
	    
	    
	    <div class="form-group">
		<div class="col-sm-offset-2 col-sm-2 col-md-2 col-md-offset-5">
	        <button align="center" type="submit" class="btn btn-primary">Enviar Pregunta</button>
	      </div>
	    </div>
	  </form>
	</div>
		</div>
	</div>
	
	<div class="container-fluid">
		 <div class="form-group">
				  <label class="col-md-offset-2 control-label col-sm-1  " for="titulo">
					  <span class="label label-info "  style="font-size: 14px; margin-top: 2px;"> Tag </span>
				  </label>
				  <div class="col-sm-6 col-md-">
					<input type="text" class="form-control" id="titulo" placeholder="Crea tu propio tag o usa los mas buscados" name="tag">
				  </div>
		</div>	
	</div>
<br>

<!-- Mitad de pagina a partir de aqui se gestiona la previsualización  -->


	<hr> </hr>
	
	
<h3 align="center" id="tituloprevi" onclick="verprevi();"> Pulsa para ver la previsualizacion del mensaje</h3>
<div id="previ" style=" display: none">
	<div class="row" style="margin-top: 5%">
	    <div class="col-md-8 col-md-offset-2">
			<div class="panel panel-info">
					  <div class="panel-heading">
					   <% 
			   	        /*
			   	        Aqui estoy recargando los nombres del usuario de momento , habra que validar que si esta pulsado las mas visitas recargar
			   	        las preguntas segun el boton del tab pulsado.
			   	        */
			   		 	
			    		
			    		 %>
						<h3 class="panel-title" align="center" id="titulocopia"></h3>
						<pre>esto es la etiqueta code</pre>
					  </div>
					  
					  <div class="panel-footer" align="left" style="min-height: 200px;"  id="mensajecopia">
					  
			    			<div class="container-fluid">
			    			</div>
			    		
			    	 </div>
			</div>

		  </div>
	</div>
</div>
</body>
</html>
