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
			
			document.getElementById("titulaso").innerHTML='<div class="form-group has-error has-feedback"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-4 col-md-5"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"><span class="glyphicon glyphicon-remove form-control-feedback"></span></div> </div> ';
			
			
		}
		if(document.getElementById("comment").value.length==0){
			if (problema.length != 0) {
				problema += "\n";
			}
			problema += "Mensaje vacio ";
			if(document.getElementById("titulo").value.length!=0){
				titulo=document.getElementById("titulo").value
				document.getElementById("titulaso").innerHTML='<div class="form-group"><label class="control-label col-sm-2" for="titulo">Titulo:</label><div class="col-sm-4 col-md-5"><input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo"> </div> </div>'
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
  
  </script>
  
</head>
<body height="100%">

<div class="container">
  <h2 align="center">Nueva Pregunta </h2>
  <br>
  <form class="form-horizontal" action="#" method="POST" onsubmit="return comprobarregistro();">
  
  <div id="titulaso">
  	 <div class="form-group">
      <label class="control-label col-sm-2" for="titulo">Titulo:</label>
      <div class="col-sm-4 col-md-5">
        <input type="text" class="form-control" id="titulo" placeholder="Titulo Pregunta" name="titulo">
      </div>
    </div>
  	</div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Descripcion</label>
      <div class="col-sm-4 col-md-7">          
         <textarea style="overflow-y: scroll;   height: 100px;  resize: none;" class="form-control" rows="10" id="comment" name="mensaje"></textarea>
      </div>
    </div>
    
    
    <div class="form-group">
	<div class="col-sm-offset-2 col-sm-2 col-md-2 col-md-offset-4">
        <button align="center" type="submit" class="btn btn-default">Enviar Pregunta</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
