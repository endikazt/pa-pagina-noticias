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
  	
  	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.1.1/jquery.min.js"></script>	
	
  	
  
</head>
<body>

<jsp:include page="../template/menuInvitado.jsp"></jsp:include>


  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Iniciar sesión</h5>
            <hr class="my-4">
            <form:form id="logForm" class="form-signin" modelAttribute="usuario" action="${contextPath}/login/dologin" method="post">
            <form:label path="username"> Usuario </form:label>
              <div class="form-label-group">
               	<form:input path="username" name="username" id="username" class="form-control"/>
              </div>
			<form:label path="password"> Contraseña </form:label>
              <div class="form-label-group">
                <form:password path="password" name="password" id="password" class="form-control"/>
              </div>
              <hr class="my-4">
              <form:button class="btn btn-lg btn-primary btn-block text-uppercase" id="login" type="submit" >Iniciar sesion </form:button>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>