<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Invalid Promo Code</title>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	</head>
	<body>
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1 class="alert alert-danger">Invalid Promo Code</h1>
				</div>
			</div>
		</section>
		
		<section>
			<div class="container">
				<a href="<spring:url value="/market/products" />" class="btn btn-primary">
               		<span class="glyphicon-hand-left glyphicon"></span> products
            	</a>
			</div>
		</section>
	</body>
</html>