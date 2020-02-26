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
	<br/>
	<h1 align="center"> ¡Bienvenido <c:out value="${sessionScope.usuarioLogin.username}"></c:out>!</h1>
	<h1 align="center"> Tienes privilegios de <c:out value="${sessionScope.usuarioLogin.rol}"></c:out>!</h1>
</c:if>

<c:if test="${sessionScope.usuarioLogin.rol == 'ADMIN'}">
	<jsp:include page="../template/menuAdmin.jsp"></jsp:include>
	<br/>
	<h1 align="center"> ¡Bienvenido <c:out value="${sessionScope.usuarioLogin.username}"></c:out>!</h1>
	<h1 align="center"> Tienes privilegios de <c:out value="${sessionScope.usuarioLogin.rol}"></c:out></h1>
</c:if>

<c:if test="${sessionScope.usuarioLogin == null}">
	<jsp:include page="../template/menuInvitado.jsp"></jsp:include>
        <div class="container">
			<div class="container">
			    <div class="row">
			      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			        <div class="card card-signin my-5">
			          <div class="card-body">
			            <h5 class="card-title text-center">¡Bienvenido a The San Luis Post!</h5>
			            <hr class="my-4">
			            <form class="form-signin" action="login">
			            	<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"> Iniciar sesion </button>
			            </form>
			              <hr class="my-4">
			            <form class="form-signin" action="registro">
			            	<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"> Registrarse</button>
			            </form>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
		</div>
</c:if>

<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>	
</body>
</html>
