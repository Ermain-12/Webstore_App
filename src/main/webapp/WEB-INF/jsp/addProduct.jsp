<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<div class="pull-right" style="padding-right: 50px">
				<a href="?language=en">English</a>|<a href="?language=nl">Dutch</a>
				<a href="<c:url value="/logout" />">Logout</a>
			</div>
		</section>
	
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Products</h1>
					<p>Add Products</p>
				</div>
			</div>
		</section>
		
		<section class="container">
			<form:form method="POST" modelAttribute="newProduct" class="form-horizontal">
				<fieldset>
					<legend>Add New Product: </legend>
					
					<!-- ID -->
					<div class="form-group">
						<!-- <label class="control-label col-lg-2 col-lg-2" for="productID">
							Product ID
							<spring:message code="addProduct.form.productID.label"/> 
						</label> -->
						<label class="control-label col-lg-2 col-lg-2" for="productID"><spring:message
							code="addProduct.form.productID.label" /></label>
						<div class="col-lg-10">
							<form:input id="productID" path="productID" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!-- Name -->
					<div class="form-group">
						<!--  <label class="control-label col-lg-2 col-lg-2" for="name">Name</label>-->
						<label class="control-label col-lg-2 col-lg-2" for="name"><spring:message
							code="addProduct.form.name.label" /></label>
						<div class="col-lg-10">
							<form:input id="name" path="name" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!-- unitPrice -->
					<div class="form-group">
						<!-- <label class="control-label col-lg-2 col-lg-2" for="unitPrice">Unit Price</label>-->
						<label class="control-label col-lg-2" for="unitPrice">
							<spring:message code="addProduct.form.unitPrice.label"/>
						</label>
						<div class="col-lg-10">
							<form:input id="unitPrice" path="unitPrice" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!-- Manufacturer -->
					<div class="form-group">
						<!-- <label class="control-label col-lg-2 col-lg-2" for="manufacturer">Manufacturer</label>-->
						<label class="control-label col-lg-2" for="manufacturer">
							<spring:message code="addProduct.form.manufacturer.label"/>
						</label>
						<div class="col-lg-10">
							<form:input id="manufacturer" path="manufacturer" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!-- Category -->
					<div class="form-group">
						<!--<label class="control-label col-lg-2 col-lg-2" for="category">Category</label>-->
						<label class="control-label col-lg-2" for="category">
							<spring:message code="addProduct.form.category.label"/>
						</label>
						<div class="col-lg-10">
							<form:input id="category" path="category" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!-- unitsInStock -->
					<div class="form-group">
						<!-- <label class="control-label col-lg-2 col-lg-2" for="unitsInStock">Units in Stock</label>-->
						<label class="control-label col-lg-2" for="unitInStock">
							<spring:message code="addProduct.form.unitsInStock.label" />
						</label>
						<div class="col-lg-10">
							<form:input id="unitsInStock" path="unitsInStock" type="text" class="form:input-large"/>
						</div>
					</div>
					
					<!----------------- unitsInOrder -------------------------------
					<div class="form-group">
						<label class="control-label col-lg-2 col-lg-2" for="unitsInOrder">Units in Order</label>
						<div class="col-lg-10">
							// <form:input id="unitsInOrder" path="unitsInOrder" type="text" class="form:input-large"/>
						</div>
					</div>
					-->
					<div class="form-group">
						<!-- <label class="control-label col-lg-2" for="description">Description</label>-->
						<label class="control-label col-lg-2" for="description">
							<spring:message code="addProduct.form.description.label"/>
						</label>
						<div class="col-lg-10">
							<form:textarea id="description" path="description" rows="2"/>
						</div>
					</div>
					
					<!---------------- Discontinued --------------------------------- 
					<div class="form-group">
						<label class="control-label col-lg-2" for="discontinued">Discontinued</label>
						<div class="col-lg-10">
							<form:checkbox id="discontinued" path="discontinued"/>
						</div>
					</div>
					----------------->
					<div class="form-group">
						<label class="control-label  col-lg-2" for="conditional">Condition</label>
						<div class="col-lg-10">
							<form:radiobutton path="conditional" value="New"/> New
							<form:radiobutton path="conditional" value="Old"/> Old
							<form:radiobutton path="conditional" value="Refurbished"/> Refurbished
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-lg-2" for="productImage"> 
							<spring:message code="addProduct.form.productImage.label" />
						</label>
						<div class="col-lg-10">
							<form:input id="productImage" path="productImage" type="file"
								class="form:input-large" />
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-2">
							<input type="submit" id="btnAdd" class="btn btn-primary" value="Add"/>
						</div>
					</div>
					
					<div class="form-group">	
						<label class="control-label col-lg-2" for="productImage">Image:</label>
						<div class="col-lg-10">
							<form:input id="productImage" path="productImage" type="file" class="form:input=large"/>
						</div>
					</div>
				</fieldset>
			</form:form>
		</section>
	</body>
</html>