<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
	function comprobarregistro() {
		//Validaciones del formulario
		var problema = "";

		if (document.getElementById("titulo").value.length == 0) {
			problema = "Titulo vacio  ";

			document.getElementById("titulaso").innerHTML = '<div class="form-group has-error has-feedback"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-6 col-md-8"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"><span class="glyphicon glyphicon-remove form-control-feedback"></span></div> </div> ';

		}
		if (document.getElementById("comment").value.length == 0) {
			if (problema.length != 0) {
				problema += "\n";
			}
			problema += "Mensaje vacio ";
			if (document.getElementById("titulo").value.length != 0) {
				titulo = document.getElementById("titulo").value
				document.getElementById("titulaso").innerHTML = '<div class="form-group"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-6 col-md-8"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"> </div> </div>'
				document.getElementById("titulo").value = titulo

			}
		}

		if (problema.length != 0) {	
		document.getElementById("descrip").innerHTML=problema;
		document.getElementById("descrip").style.color="red";
			return false;
		} else {
			return true;
		}

	}

	function previsualizacion() {

		if (document.getElementById("titulo").value.length > 0
				|| document.getElementById("comment").value.length > 0) {
			document.getElementById("titulocopia").innerHTML = document
					.getElementById("titulo").value;

			//Defino las variables que vamos a necesitar
			//El mensaje inicial al cual tenemos que modificar en el cual cambiamos los saltos
			//de lina por BR para que nos lo reconozca html
			var mensaje = document.getElementById("comment").value.split("\n")
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
			document.getElementById("mensajecopia").innerHTML = mensfinal;
			document.getElementById("mensajeoculto").value = mensfinal;

		}
	}
	function verprevi() {

		if ((document.getElementById("previ").style.display) == 'none') {

			document.getElementById("previ").style.display = 'block';
			document.getElementById("tituloprevi").innerHTML = "Mostrando la previsualizacion";
		} else {
			document.getElementById("previ").style.display = 'none';
			document.getElementById("tituloprevi").innerHTML = "Pulsa para ver la previsualizacion del mensaje";
		}

	}
	
	function recargar(){
		primerparametro=document.getElementById("tag").value
		
		
		idsusados=document.getElementById("idsusados").value
		
		frompag(primerparametro+"_"+idsusados,0,'tagsugeridos','SugerenciasTag')
		//from(document.getElementById("tag").value+"_"+document.getElementById("idsusados").value,'tagsugeridos','SugerenciasTag')
		
	}
	
	function borrartag(id){
		borrar=document.getElementById("spantag"+id)
		
		borrar.parentNode.removeChild(borrar)
		//document.getElementById("espaciotags").innerHTML=document.getElementById("espaciotags").innerHTML.substring(2)
		ids=document.getElementById("idsusados").value.split("_")
		nuevacadena=""

		contador=0
		for(i=0;i<ids.length;i++){
			
			if(ids[i]!=id)
				{
				if(contador==0){
					nuevacadena+=ids[i]
					contador++
				}
				else{
					nuevacadena+="_"+ids[i]

				}
				}
		}
		
		document.getElementById("idsusados").value=nuevacadena
		recargar();
	}
	
	function anadirtag(id,nombre){
		tags=document.getElementById("espaciotags").innerHTML
		tagssep=tags.split(",")
		if(tagssep.length<=5)
			{
				document.getElementById("idsusados").value+=id+"_"
				document.getElementById("espaciotags").innerHTML+="<span id='spantag"+id+"'><span class='label label-info'>"+nombre+"    <button style='margin-left:2px' class='btn btn-link' onclick='borrartag("+id+")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></span>, </span>"

				
				
				recargar()
				
				//document.getElementById("tag").getAttribute('onkeyup')="from("+primerparametro+",'tagsugeridos','SugerenciasTag')"
				//document.getElementById("tag").onkeyup="from(document.getElementById('tag').value,'tagsugeridos','SugerenciasTag')"
				
				//onkeyup="from(document.getElementById('tag').value,'tagsugeridos','SugerenciasTag')"
			}
		
		

	}
</script>

<title>Alta Notificacion</title>
</head>
<body>
	<%@include file="Cabecera.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-offset-0 col-md-12">
  	<ol class="breadcrumb">
  		<li><a href="${pageContext.request.contextPath}/ServerletContenido">Inicio</a></li>
  		<li class="active">Alta Notificacion</li>
	</ol>
</div></div>
	<div class="container">
	<div class="row">
	<div class="col-md-offset-2 col-md-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="container-fluid">
					<div class="col-sm-2 col-md-offset-0 col-md-12">
						<h2 align="center">
							Nueva Notificación <%=request.getParameter("id") %>
							</h2>
					</div>
				</div>
			</div>
			<!-- El cuerpo de panel lo dejo en blanco pero relleno el formulario en el pie porque quiero el lightgrey -->
			
			<div class="panel-footer">

				<div class="container-fluid" style="margin-top: 3%">
					<br>
					<form class="form-horizontal" id="altanotificacion" name="altanotificacion" action="ServerletNotificacion" method="POST" onsubmit="return comprobarregistro();">
							<div id="titulaso">
								<div class="form-group">
									<label class="control-label col-sm-2" for="titulo">Titulo:</label>
									<div class="col-sm-8 col-md-8">
										<input type="text" class="form-control" id="titulo"
											placeholder="Titulo notificacion" name="titulo"
											onkeyup="previsualizacion();">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pwd" id="descrip">Descripcion</label>
								<div class="col-sm-8 col-md-8">
									<textarea style="overflow-y: scroll; height: 50%; resize: none"
										class="form-control" rows="10" id="comment" name="mensaje"
										onkeyup="previsualizacion();"></textarea>
									<input type="hidden" id="mensajeoculto" name="mensajeoculto"
										value="">
									<input type="hidden" value="" name="idsusados" id="idsusados">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-2 col-md-2 col-md-offset-5">
									<input type="hidden" name="tipo" value="<%=request.getParameter("id")%>"></input>
									<button align="center" type="submit" class="btn btn-primary">Enviar
										Notificacion </button>
										
								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
		</div></div></div></div>
	<%@include file="pie.jsp"%>
</body>
</html>
