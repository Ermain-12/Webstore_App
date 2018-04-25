package com.ermain.webstore.domain.repository;

import java.util.List;
import java.util.Map;

import com.ermain.webstore.domain.Product;

public interface ProductRepository{
	
	// Create a method to be implemented
	List <Product> getAllProducts();
	
	// Create a method to be able to update the stock
	void updateStock(String productID, long numOfUnits);

	
	// Create a method to filter the items in stock
	List<Product> getProductsByCategory(String category);
	
	// Filter products based on two categories (i.e. matrix variables)
	List<Product> getProductsByFilter(Map<String, List<String>> filterParams);
	
	// Create a method to define a product detail page
	Product getProductByID(String productID);
	
	// Create a method to display product based on brand
	Product getProductByBrand(String manufacturer);
	
	// Create a method to serve and process the form
	void addProduct(Product product);
 }

