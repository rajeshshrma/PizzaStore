package com.online.pizzastore.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.online.pizzastore.domain.Cart;
import com.online.pizzastore.domain.Product;
import com.online.pizzastore.domain.Topping;
import com.online.pizzastore.services.IDataService;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	@RequestMapping(value = StoreRestURIConstants.GET_HOME_PAGE)
	public ModelAndView getHomePage(Model model, HttpSession session,
			HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("userHome");

		List<Product> products = dataService.findAllProducts();
		model.addAttribute("products", products);
		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.GET_TOPPINGS_LIST)
	public ModelAndView getConfigurePage(@PathVariable("productId") int productId,
			Model model, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("configureProduct");

		Product product = dataService.findProductByID(productId);
		List<Topping> toppingsList = dataService.findToppingsByProductID(productId);
		
		model.addAttribute("product", product);
		model.addAttribute("toppingsList", toppingsList);

		return modelView;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = StoreRestURIConstants.ADD_PRODUCT_TO_CART, method = RequestMethod.POST)
	public @ResponseBody String addToCart(@PathVariable("productId") int productId,
			HttpServletRequest request) {
		List<Cart> productCart = null;

		if (request.getSession().getAttribute("productCart") == null) {
			productCart = new ArrayList<Cart>();
		} else {
			productCart = (List<Cart>) request.getSession().getAttribute(
					"productCart");
		}

		Product product = dataService.findProductByID(productId);
		Cart cart = new Cart(product, 1);
		productCart.add(cart);
		request.getSession().setAttribute("productCart", productCart);
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(productCart,
				new TypeToken<List<Cart>>() {
				}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		return jsonArray.toString();
	}

}
