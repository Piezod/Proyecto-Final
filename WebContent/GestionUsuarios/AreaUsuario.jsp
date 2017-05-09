<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="Bootstrap/js/ajax.js"></script>
<script type="text/javascript">

function actualizarpass(){
	pass=document.getElementById("password")
	repetirpass=document.getElementById("reppass")
	if(pass.value.length>6){
	if(pass.value==repetirpass.value){
		document.getElementById("divestadopass").className=""
		document.getElementById("divestadopass").innerHTML=""
		from(pass.value,"divestadopass","ServletCambioPass")	
	}
	else{
		document.getElementById("divestadopass").className="alert alert-danger"
		document.getElementById("divestadopass").innerHTML="Las contraseñas no coinciden por favor compruebe el contenido"
	}
	}
	else{
		document.getElementById("divestadopass").className="alert alert-danger"
		document.getElementById("divestadopass").innerHTML="La contraseña es demasiado corta"
		}
}

function Comprobarcampos(){

	if(document.getElementById("gnombre").value==""&&document.getElementById("gapellido2").value==""&&document.getElementById("gapellido1").value==""){
		//alert("No se puede enviar una solicitud vacía")
		$('#myModal').modal('show');
		
		return false;
	}else{
		return true;
	}
}
function actualizar(elemento){
	if(elemento.id[0]=="p"){
		document.getElementById("g"+elemento.id.substring(1)).value=elemento.value
	}else{
		document.getElementById("p"+elemento.id.substring(1)).value=elemento.value	
	}
}
function mostrarocultar(campo){	
	var actual=document.getElementById("tr"+campo+"p").style.display;
	if(actual=="none"){
		var cambiar=""
		var checkbox=true
	}else{
		var cambiar="none"
		var checkbox=false
	}
	document.getElementById("tr"+campo+"p").style.display=cambiar
	document.getElementById("tr"+campo+"g").style.display=cambiar
	
	document.getElementById("c"+campo+"p").checked=checkbox
	document.getElementById("c"+campo+"g").checked=checkbox
	
	document.getElementById("g"+campo).value=""
	document.getElementById("p"+campo).value=""
		
}
</script>

<title>Area de usuario</title>
	<%@include file="../ContenidoPrincipal/Cabecera.jsp"%>

<body>

<div class="container">
 
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" > <!--  el bakcgorun modifica el marco -->
    
      <!-- Modal content-->
      <div class="modal-content"> <!--  este es el backgroun blanco -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Se ha producido un error</h4>
        </div>
        <div class="modal-body">
          <p>No se puede enviar una solicitud con los campos vacios, por favor revisa los campos y vuelve a intentarlo</p>
        </div>
        <div class="modal-footer" >
          <button type="button" class="btn btn-info" data-dismiss="modal" >Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>




<div class="container-fluid" style="margin-top:5%;">
		<div class="row container-fluid">
		<div class="col-sm-12 col-xs-12 col-md-3" align="left">
		      <button type="button" class="btn btn-default"  onclick="from('<%=session.getAttribute("usuario") %>','contenido','DatosUsuario')">Visualizar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','EditarUsuario')">Editar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','CambioPass')">Cambiar contraseña</button>
		      
		  </div>
		  <div class="col-md-3 col-sm-0 col-xs-0 hidden-sm hidden-xs"  align="right">
		  	  <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','DatosUsuario')">Visualizar Datos</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','EditarUsuario')">Editar Datos</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','CambioPass')">Cambiar contraseña</button>
		      
	        </div>
		  </div>
		  
		  <div class="col-md-8 col-sm-12 col-xs-12" id="contenido">
		  	<%@include file="DatosUsuario.jsp" %>
		  </div>
		  <div class="col-md-1 visible-md"></div>
    </div>

		
	</div>
		<%@include file="../ContenidoPrincipal/pie.jsp"%>
	    <script type="text/javascript">
/* Password strength indicator */
function passwordStrength(password) {

	var desc = ['0px', '20%', '40%', '60%', '80%', '100%'];
	
	var descClass = ['', 'progress-bar progress-bar-danger', 'progress-bar progress-bar-danger', 'progress-bar progress-bar-warning', 'progress-bar progress-bar-success', 'progress-bar progress-bar-success'];

	var puntos = 0;

	//Si la contraseña es menor que 6 no se puede empezar a evaluar la contraseña
	if (password.length > 6) 
		
	{puntos++;

	//Si contiene mayusculas y minusculas otorga otro punto de seguridad	
	if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/))) puntos++;

	//Si contiene un numero al menos otorga otro punto
	if (password.match(/d+/)) puntos++;

	//Si contiene caracteres especiales otro punto
	if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) )	puntos++;

	//si contiene mas de 10 caracteres otorga otro punto
	if (password.length > 10) puntos++;
	}
	// display indicator
	document.getElementById("pstrength").className=descClass[puntos]
	document.getElementById("pstrength").style.width=(desc[puntos])
}
    
    
    </script>
</body>
</html>