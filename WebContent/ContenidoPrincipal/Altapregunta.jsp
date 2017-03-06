<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/altapreguntastyle.css" type="text/css">
 
<h1><%=session.getAttribute("usuario") %></h1>
</head>
<body>
<div id="form">

<div class="fish" id="fish"></div>
<div class="fish" id="fish2"></div>

<form id="waterform" method="post">


<div class="formgroup" id="email-form">
    <label for="email">Titulo de la pregunta</label>
    <input type="text" id="titulopregunta" name="titulopregunta" />
</div>

<div class="formgroup" id="message-form">
    <label for="message">Explicacion de la pregunta</label>
    <textarea id="explicacionpregunta" name="explicacionpregunta"></textarea>
</div>

	<input type="submit" value="Enviar !" />
</form>
</div>
</body>
</html>