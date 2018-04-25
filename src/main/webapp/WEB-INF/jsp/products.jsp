<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
		<title>Products</title>
	</head>
	<body>
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Products</h1>
					<p>All the available products:</p>
				</div>
			</div>
		</section>
		
		<section class="container">
			<div class="row">
				<c:forEach items="${products}" var="product">
					<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
						<div class="thumbnail">
							<div class="col-md-5">
						<img src="<c:url value="/img/${product.productID}.png"></c:url>"
					alt="image" style="width: 100%" />
			</div>
							<div class="caption">
								<h3>${product.name}</h3>
								<p>${product.description}</p>
								<p>${product.unitPrice} USD</p>
								<p>Available ${product.unitsInStock} units in stock</p>
								<p>
									<a href="<spring:url value="/market/product?ID=${product.productID}"/>"
									class="btn btn-primary">
										<span class="glyphicon-info-sign glyphicon"></span>Details
									</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</body>
</html>