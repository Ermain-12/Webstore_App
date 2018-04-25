<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
		<title>Product Details</title>
	</head>
	<body>
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Products</h1>
				</div>
			</div>
		</section>
		
		<section class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="<c:url value="/img/${product.productID}.png"></c:url>" alt="image" style="width:100%" />
					<h3>${product.name}</h3>
					<p>${product.description}</p>
					<p>
						<strong>Item Code: </strong>
						<span class="label label warning">${productID}</span>
					</p>
					<p>
						<strong>Manufacturer: </strong>
						${product.manufacturer}
					</p>
					
					<p>
						<strong>Category: </strong>
						${product.category}
					</p>
					
					<p>
						<strong>Available units in stock: </strong>
						${product.unitsInStock}
					</p>
					
					<p>
								<a href=" <spring:url value="/market/product?id=${product.productID}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> Details
								</a>
							</p>

					<p>Price: ${product.unitPrice}</p>
					
					<p>
						<a href="#" class="btn btn-warning btn-large">
							<span class="glyphicon-shopping-cart glyphicon">Order Now</span>
						</a> 
					</p>
				</div>
			</div>
		</section>
	</body>
</html>