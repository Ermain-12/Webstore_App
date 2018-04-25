package com.ermain.webstore.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="No products found under this category")
public class NotProductsFoundUnderCategoryException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8465529421198148090L;
	
	
}
