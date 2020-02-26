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
  	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
  	
  	<link href="./resources/css/login-register.css" type="text/css" rel="stylesheet">
  	
  
</head>
<body>

<c:choose>
    <c:when test="${sessionScope.usuarioLogin.rol == 'ADMIN'}" >
        <jsp:include page="../template/menuAdmin.jsp"></jsp:include>
        	<div class="container">
			<table class="table bg-success">
			  		<thead class="thead-dark">
					    <tr>
					      <th scope="col" colspan="6" style="font-size: 25px">Lista de usuarios</th>
					    </tr>
			  		</thead>
			  		<tbody>
			  		<tr align="center" class="bg-dark text-white">
					    <td style="font-size: 20px"> USUARIO </td>
					
						<td style="font-size: 20px"> NOMBRE </td>
					
						<td style="font-size: 20px"> APELLIDOS </td>
						
						<td style="font-size: 20px"> ROL </td>
						
						<td colspan="2"></td>
					</tr>
			  		
			  		<c:forEach items="${usuarios}" var="usuario">
			  	  	<tr align="center" class="bg-light text-dark">
							<td style="font-size: 22px"> ${usuario.username} </td>
					
							<td style="font-size: 22px"> ${usuario.nombre} </td>
					
							<td style="font-size: 22px"> ${usuario.apellidos} </td>
							
							<td style="font-size: 22px"> ${usuario.rol} </td>
					
							<td>
								<form class="form-signin" action="${contextPath}/usuarios/editar/${usuario.username}">
				            	<button class="btn btn-primary btn-block text-uppercase" type="submit">Editar</button>
				            	</form>
			            	</td>
						
							<td>
								<form class="form-signin" action="${contextPath}/usuarios/eliminar/${usuario.username}">
				            	<button class="btn btn-google btn-block text-uppercase" type="submit"> Eliminar </button>
				            	</form>
			            	</td>
					</tr>
					</c:forEach>
					</tbody>
			</table>
			<table class="table bg-success">
				<thead class="thead-dark">
					    <tr>
					      <th scope="col" colspan="6" style="font-size: 25px">Registrar nuevo usuario</th>
					    </tr>
			  		</thead>
			  		<tr align="center" class="bg-dark text-white">
					    <td style="font-size: 20px"> USUARIO </td>
					    
					    <td style="font-size: 20px"> CONTRASEÑA </td>
					
						<td style="font-size: 20px"> NOMBRE </td>
					
						<td style="font-size: 20px"> APELLIDOS </td>
						<td style="font-size: 20px"> ROL </td>
						<td></td>
					</tr>  
			  		<tr class="bg-light text-dark">
			  		<form:form id="regForm" class="form-signin" modelAttribute="usuario" action="${contextPath}/usuarios/crear" method="post">
			   		<td style="font-size: 22px"> <form:input path="username" name="username" id="username" class="form-control" /> </td>
			  		<td style="font-size: 22px"> <form:password path="password" name="password" id="password" class="form-control" /> </td>
			  		<td style="font-size: 22px"> <form:input path="nombre" name="nombre" id="nombre" class="form-control" />   </td>
			  		<td style="font-size: 22px"> <form:input path="apellidos" name="apellidos" id="apellidos" class="form-control" /> </td>
			  		<td style="font-size: 22px"> <form:input path="rol" name="rol" id="rol" class="form-control" />   </td>
			  		<td><form:button class="btn btn-primary btn-block text-uppercase" id="registrar" type="submit" >Registrar usuario </form:button></td>
			  		</form:form>
			  		</tr>
			</table>
			</div>
    </c:when>    
    <c:otherwise>
        <jsp:include page="../template/menuInvitado.jsp"></jsp:include>
        	<h1> No tienes permisos para acceder a esta pagina :/</h1>
    </c:otherwise>
</c:choose>


<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>	
</body>
</html>