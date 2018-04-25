package com.ermain.webstore.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ermain.webstore.domain.Product;
import com.ermain.webstore.domain.repository.ProductRepository;
import com.ermain.webstore.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductRepository productRepository;
	
	public void updateAllStock() {
		List<Product> allProducts = productRepository.getAllProducts();
		
		for (Product product : allProducts) {
			if(product.getUnitsInStock() < 500)
				productRepository.updateStock(product.getProductID(), product.getUnitsInStock() + 1000);
		}
	}
	
	public List<Product> getAllProducts(){
		return productRepository.getAllProducts();
	}
	
	public List<Product> getProductsByCategory(String category){
		return productRepository.getProductsByCategory(category);
	}
	
	public List<Product> getProductsByFilter(Map<String, List<String>> filterParams){
		return productRepository.getProductsByFilter(filterParams);
	}
	
	public Product getProductByID(String productID) {
		return productRepository.getProductByID(productID);
	}
	
	public Product getProductByBrand(String manufacturer) {
		return  productRepository.getProductByBrand(manufacturer);
	}
	
	public void addProduct(Product product) {
		productRepository.addProduct(product);
	}
}

