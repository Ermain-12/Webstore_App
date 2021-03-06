<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Products</title>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	</head>
	<body>
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Welcome to the Webstore!</h1>
					<p>The One and only amazing Webstore</p>
				</div>
			</div>
		</section>
		
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Please sign-in</h3>
						</div>
						
						<div class="panel-body">
						<c:url var="loginUrl" value="/login"/>
						<form action="${loginUrl}" method="post" class="form-horizontal">
							
							<c:if test="${param.error != null}">
								<div class="alert alert-danger">
									<p>Invalid Username and Password</p>
								</div>
							</c:if>
							
							<c:if test="${param.logout != null}">
								<div class="alert alert-danger">
									<p>You have successfully logged out!</p>
								</div>
							</c:if>
							
							<c:if test="${param.accessDenied != null}">
								<div class="alert alert-danger">
									<p>Access Denied! You are not authorized</p>
								</div>
							</c:if>
							
							<div class="input-group input-sm">
								<label class="input-group-addon" for="username"><i
                           			class="fa fa-user"></i>
                           		</label> 
                           		<input type="text" class="form-control"
                           			id="userID" name="userID" placeholder="Enter Username"
                           			required>
							</div>
							
							<div class="input-group input-sm">
		                        <label class="input-group-addon" for="password"><i
		                           class="fa fa-lock"></i>
		                        </label> 
		                        <input type="password"
		                           class="form-control" id="password" name="password"
		                           placeholder="Enter Password" required>
                     		</div>

		                     <div class="form-actions">
		                        <input type="submit"
		                           class="btn btn-block btn-primary btn-default" value="Log in">
		                     </div>
							
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>