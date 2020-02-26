<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The San Luis Post</title>

    <!-- Bootstrap core CSS -->
  	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
  	
  	<link href="./resources/css/login-register.css" type="text/css" rel="stylesheet">
  	
  
</head>
<body>
<c:if test="${sessionScope.usuarioLogin.rol == 'USER'}">
	<jsp:include page="../template/menu.jsp"></jsp:include>
</c:if>

<c:if test="${sessionScope.usuarioLogin.rol == 'ADMIN'}">
	<jsp:include page="../template/menuAdmin.jsp"></jsp:include>
</c:if>

<c:if test="${sessionScope.usuarioLogin == null}">
	<jsp:include page="../template/menuInvitado.jsp"></jsp:include>
</c:if>

<div class="container">
<table class="table">
  		<thead class="thead-dark">
		    <tr>
		      <th scope="col" style="font-size: 25px " colspan="3">Noticias recientes</th>
		    </tr>
  		</thead>
  		<tbody>
  		
  		<c:forEach items="${noticias}" var="noticia">
  		<tr>
				<td> </td>
		</tr>
  	  	<tr>
				<td class="bg-dark text-white" style="font-size: 20px" > ${noticia.titulo} </td>
				<c:if test="${sessionScope.usuarioLogin.rol == 'ADMIN'}">
					<td class="bg-dark text-white" > <a href="${contextPath}/noticias/editar/${noticia.cod_noticia}"> Editar</a></td>
					<td class="bg-dark text-white" > <a href="${contextPath}/noticias/eliminar/${noticia.cod_noticia}"> Eliminar</a> </td>
				</c:if>	
		</tr>
		<tr>
				<td class="bg-light text-dark" colspan="3"> ${noticia.contenido} </td>
		</tr>
		</c:forEach>
		</tbody>
</table>
</div>
<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>	
</body>
</html>
