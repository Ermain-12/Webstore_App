package com.ermain.webstore.service;

import java.util.List;
import java.util.Map;

import com.ermain.webstore.domain.Product;

public interface ProductService{
	
	// Create a method to update the stock
	void updateAllStock();
	
	// Return a list of all the products
	List<Product> getAllProducts();
	
	// Create a method to filter the items in stock
	List<Product> getProductsByCategory(String category);
	
	// Create an interface method to filter more than one category
	List<Product> getProductsByFilter(Map<String, List<String>> filterParams);
	
	// Create a method to create a product detail page
	Product getProductByID(String productID);
	
	// Create a method to get products by brand
	Product getProductByBrand(String manufacturer);
	
	// Create a method to update database
	void addProduct(Product product);
}
