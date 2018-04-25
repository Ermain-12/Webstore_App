package com.ermain.webstore.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ermain.webstore.domain.Product;
import com.ermain.webstore.domain.repository.ProductRepository;
import com.ermain.webstore.exception.ProductNotFoundException;
import com.ermain.webstore.service.ProductService;


@SuppressWarnings("unused")
@Controller
@RequestMapping("market")
public class ProductController{
	
	//@Autowired
	//private ProductRepository productRepository;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/products")
	public String list(Model model) {
		
		// model.addAttribute("products", productRepository.getAllProducts());	
		model.addAttribute("products", productService.getAllProducts());
		return "products";
		/*
		// Instantiate the product object
		Product iphone = new Product("P1234", "iPhone 6s", new BigDecimal(500));
		iphone.setDescription("Apple iPhone 6s smartphone with 4-inch 640x1136 display and 8-megapixel camera");
		iphone.setCategory("Smartphone");
		iphone.setManufacturer("Apple");
		iphone.setUnitsInStock(1000);
		model.addAttribute("product", iphone);
		return "products";
		*/
	}
	
	/**
	 * !!!!!!!!!!!!!!!!!!!This request handler needs attention!!!!!!!!!!!!!
	 * !!!!!! Possible error in the SQL query in InMemoryProductRepository.java class !!!!!!!!!!!!!!!!!!
	 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 * @param model
	 * @return
	 */
	@RequestMapping("/update/stock")
	public String updateStock(Model model) {
		productService.updateAllStock();
		return "redirect:/market/products";
	}
	
	
	@RequestMapping("/products/{category}")
	public String getProductsByCategory(Model model, @PathVariable("category") String productCategory) {
		model.addAttribute("products", productService.getProductsByCategory(productCategory));
		return "products";
	}
	
	
	@RequestMapping("/products/filter/{params}")
	public String getProductsByFilter(@MatrixVariable(pathVar="params") Map<String, List<String>> filterParams,
									  Model model) {
		
		model.addAttribute("products", productService.getProductsByFilter(filterParams));
		
		return "products";
	}
	
	@RequestMapping("/product")
	public String getProductByID(@RequestParam("ID") String productID, Model model) {
		model.addAttribute("product", productService.getProductByID(productID));
		return "product";
	}
	
	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		Product newProduct = new Product();
		model.addAttribute("newProduct", newProduct);
		return "addProduct";
	}
	
	@RequestMapping(value = "products/add", method = RequestMethod.POST)
	public String processAddNewProduct(@ModelAttribute("newProduct") Product newProduct, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		   if (suppressedFields.length > 0) {
		      throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		   }
		   
		   MultipartFile productImage = newProduct.getProductImage();
		   String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		         
		      if (productImage!=null && !productImage.isEmpty()) {
		          try {
		            productImage.transferTo(new File(rootDirectory+"resources\\images\\"+ newProduct.getProductID() + ".png"));
		          } catch (Exception e) {
		         throw new RuntimeException("Product Image saving failed", e);
		          }
		      }
		
		productService.addProduct(newProduct);
		return "redirect:/market/products";
	}
	

	
	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setAllowedFields("productID",
								"name",
								"unitPrice",
								"description",
								"manufacturer",
								"category",
								"unitInStock",
								"conditional",
								"productImage",
								"language");
	}
	
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handleError(HttpServletRequest req, ProductNotFoundException exception) {
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("invalidProductId", exception.getProductId());
	    mav.addObject("exception", exception);
	    mav.addObject("url", req.getRequestURL()+"?"+req.getQueryString());
	    mav.setViewName("productNotFound");
	    return mav;
	}
	
	@RequestMapping("/products/invalidPromoCode")
	public String invalidPromoCode() {
		return "invalidPromoCode";
	}
}
