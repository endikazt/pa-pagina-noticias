<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The San Luis Post</title>

    <!-- Bootstrap core CSS -->
  	<link href="../../webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
  	
  	<link href="../../resources/css/login-register.css" type="text/css" rel="stylesheet">
  	
  
</head>
<body style="background-color: navy">

<c:choose>
    <c:when test="${sessionScope.usuarioLogin.rol == 'ADMIN'}" >
		<jsp:include page="../template/menuAdmin.jsp"></jsp:include>
		<div class="container" style="margin-top:20px;" align="center">
	
			<table class="table bg-success">
			<thead class="thead-dark">
				    <tr>
				      <th scope="col"style="font-size: 25px"> EDITAR NOTICIA</th>
				    </tr>
		  	</thead>
		  		<form:form id="regForm" class="form-signin" modelAttribute="noticiaElegida" action="${contextPath}/noticias/editar/${noticiaElegida.cod_noticia}/guardar" method="post">
		  		<tr align="center" class="bg-dark text-white">
				    <td style="font-size: 20px"> TÍTULO </td>
				 </tr>
				<tr align="center"  class="bg-light text-dark">
					<td style="font-size: 22px"> <form:input path="titulo" name="titulo" id="titulo" value="${noticiaElegida.titulo}" class="form-control" style="width: 900px;"/> </td>
				</tr> 
				<tr align="center" class="bg-dark text-white">
					<td style="font-size: 20px"> CONTENIDO </td>
				</tr> 
				<tr align="center"  class="bg-light text-dark">
					<td style="font-size: 22px"> <form:textarea path="contenido" name="contenido" id="contenido" value="${noticiaElegida.titulo}" class="form-control" style="width: 900px; height: 300px;" /> </td>
				</tr> 
		  		<tr class="bg-light text-dark" align="center">
		  			<td><form:button class="btn btn-primary text-uppercase" id="guardar" type="submit" style="width: 500px;" >Guardar cambios </form:button></td>	
		  		</tr>
		  		</form:form>
			</table>
	</div>
	</c:when>
	<c:otherwise>
		<jsp:include page="../template/menuInvitado.jsp"></jsp:include>
        	<h1> No tienes permisos para acceder a esta pagina :/</h1>
	</c:otherwise>
</c:choose>
<br/>


<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>		
</body>
</html>