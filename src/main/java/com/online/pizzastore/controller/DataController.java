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
import com.online.pizzastore.services.IDataService;
import com.online.pizzastore.vo.Cart;
import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	@RequestMapping(value = StoreRestURIConstants.GET_HOME_PAGE)
	public ModelAndView getHomePage(Model model, HttpSession session,
			HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("userHome");
		List<com.online.pizzastore.vo.customer.order.Product> productOrderList = new ArrayList<com.online.pizzastore.vo.customer.order.Product>();

		session.setAttribute("productOrderList", productOrderList);

		List<Product> products = dataService.findAllProducts();
		model.addAttribute("products", products);

		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.GET_CONTINUE_HOME_PAGE)
	public ModelAndView getContinueHomePage(Model model,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("userHome");

		List<Product> products = dataService.findAllProducts();

		request.getSession().setAttribute("displayFinishOrderLink", "true");

		model.addAttribute("products", products);

		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.GET_SELECTED_PRODUCT_LIST_PAGE)
	public ModelAndView getSelectedProductListPage(Model model,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("displaySelectedProduct");

		return modelView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = StoreRestURIConstants.GET_TOPPINGS_LIST)
	public ModelAndView getConfigurePage(
			@PathVariable("productId") int productId, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		Product product = dataService.findProductByID(productId);

		List<Topping> toppingsList = new ArrayList<Topping>(
				product.getToppings());

		List<com.online.pizzastore.vo.customer.order.Product> productOrderList;
		productOrderList = (List<com.online.pizzastore.vo.customer.order.Product>) request
				.getSession().getAttribute("productOrderList");

		com.online.pizzastore.vo.customer.order.Product selectedProduct = new com.online.pizzastore.vo.customer.order.Product(
				product);

		productOrderList.add(selectedProduct);
		int productPosition = productOrderList.size() - 1;

		request.getSession().setAttribute("productOrderList", productOrderList);

		ModelAndView modelView = new ModelAndView("configureProduct");
		model.addAttribute("productPosition", productPosition);
		model.addAttribute("product", product);
		model.addAttribute("toppingsList", toppingsList);

		return modelView;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = StoreRestURIConstants.ADD_TOPPINGS_TO_CART, method = RequestMethod.POST)
	public @ResponseBody String addToppingsToCart(
			@PathVariable("productPosition") int productPosition,
			@PathVariable("toppingId") int toppingId,
			@PathVariable("optionId") int optionId, HttpServletRequest request) {

		List<com.online.pizzastore.vo.customer.order.Product> productOrderList = (List<com.online.pizzastore.vo.customer.order.Product>) request
				.getSession().getAttribute("productOrderList");

		Topping topping = dataService.findToppingByID(toppingId);

		com.online.pizzastore.vo.customer.order.Topping selectedTopping = new com.online.pizzastore.vo.customer.order.Topping(
				topping, optionId);

		com.online.pizzastore.vo.customer.order.Product selectedProduct = productOrderList
				.get(productPosition);

		selectedProduct.setToppingCart(selectedTopping);

		productOrderList.set(productPosition, selectedProduct);

		request.getSession().setAttribute("productOrderList", productOrderList);

		Gson gson = new Gson();
		JsonElement element = gson
				.toJsonTree(
						productOrderList,
						new TypeToken<List<com.online.pizzastore.vo.customer.order.Product>>() {
						}.getType());
		JsonArray jsonArray = element.getAsJsonArray();

		return jsonArray.toString();
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = StoreRestURIConstants.ADD_PRODUCT_TO_CART, method = RequestMethod.POST)
	public @ResponseBody String addToCart(
			@PathVariable("productId") int productId, HttpServletRequest request) {
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
