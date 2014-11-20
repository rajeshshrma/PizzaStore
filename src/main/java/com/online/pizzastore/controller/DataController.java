package com.online.pizzastore.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import com.online.pizzastore.services.EmailService;
import com.online.pizzastore.services.IDataService;
import com.online.pizzastore.services.UserServices;
import com.online.pizzastore.vo.Cart;
import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;
import com.online.pizzastore.vo.UserStatus;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	private static final Logger logger = Logger.getLogger(DataController.class);

	@RequestMapping(value = StoreRestURIConstants.GET_INDEX_PAGE)
	public ModelAndView getHomePage(Model model, HttpSession session,
			HttpServletResponse response) {
		logger.debug("DataController.getHomePage() : Enter");
		long startTime = System.currentTimeMillis();

		ModelAndView modelView = new ModelAndView("index");

		logger.debug("DataController.getHomePage() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));

		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.CHECK_EMAILID, method = RequestMethod.POST)
	public @ResponseBody String checkEmailID(
			@PathVariable("emailid") String emailid, HttpServletRequest request) {
		boolean emailidExists;

		logger.debug("DataController.checkEmailID() : Enter");
		long startTime = System.currentTimeMillis();

		emailidExists = dataService.userAlreadyExists(emailid);

		if (emailidExists == false) {
			User user = UserServices.createUserInstance(emailid, dataService);

			dataService.addUser(user);

			Thread emailThread = new Thread(new EmailService(user));
			emailThread.start();
		}

		logger.debug("DataController.checkEmailID() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		return String.valueOf(emailidExists);
	}

	// userToken
	@RequestMapping(value = StoreRestURIConstants.GET_TOKEN_VERIFICATION_PAGE)
	public ModelAndView getTokenVerificationPage(
			@PathVariable("userToken") String userToken, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		logger.debug("DataController.getTokenVerificationPage() : Enter");
		long startTime = System.currentTimeMillis();

		ModelAndView modelView = new ModelAndView("userRegistration");

		User user = dataService.findUserByToken(userToken);

		if (!user.equals(null)) {
			if (UserServices.isTokenExpired(user.getTokenExpiryDate())) {
				modelView = new ModelAndView("tokenExpiredPage");
			} else {
				request.getSession().setAttribute("user", user);
			}
		} else {
			// code for invalid token here
		}

		logger.debug("DataController.getTokenVerificationPage() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.VERIFY_EMAILID, method = RequestMethod.POST)
	public @ResponseBody String verifyEmailID(
			@PathVariable("emailid") String emailidToVerify,
			HttpServletRequest request) {

		logger.debug("DataController.verifyEmailID() : Enter");
		long startTime = System.currentTimeMillis();

		User user = (User) request.getSession().getAttribute("user");
		if (user.getEmailid().equals(emailidToVerify)) {
			user.setStatus(UserStatus.EMAIL_VERIFIED.toString());
			user.setLastModifieddDate(new Date().toString());

			dataService.updateUser(user);
			request.getSession().setAttribute("user", user);
			logger.debug("DataController.verifyEmailID() : Exiit: Total Time Taken: "
					+ (System.currentTimeMillis() - startTime));

			return "true";
		} else {
			logger.debug("DataController.verifyEmailID() : Exiit: Total Time Taken: "
					+ (System.currentTimeMillis() - startTime));

			return "false";
		}

	}

	@RequestMapping(value = StoreRestURIConstants.SAVE_PASSWORD, method = RequestMethod.POST)
	public @ResponseBody String savePassword(
			@PathVariable("password") String password,
			HttpServletRequest request) {

		logger.debug("DataController.savePassword() : Enter");
		long startTime = System.currentTimeMillis();

		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			logger.debug("DataController.savePassword() : Exiit: Total Time Taken: "
					+ (System.currentTimeMillis() - startTime));
			return "false";
		}
		user.setPassword(password);
		user.setStatus(UserStatus.PASSWORD_CREATED.toString());
		user.setLastModifieddDate(new Date().toString());

		dataService.updateUser(user);

		request.getSession().setAttribute("user", user);

		logger.debug("DataController.savePassword() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));

		return "true";

	}

	@RequestMapping(value = StoreRestURIConstants.SAVE_ADDRESS, method = RequestMethod.POST)
	public @ResponseBody String saveAddress(
			@PathVariable("firstName") String firstName,
			@PathVariable("lastName") String lastName,
			@PathVariable("address1") String address1,
			@PathVariable("address2") String address2,
			@PathVariable("address3") String address3,
			@PathVariable("phone") String phone,
			@PathVariable("city") String city,
			@PathVariable("state") String state,
			@PathVariable("country") String country, HttpServletRequest request) {

		logger.debug("DataController.saveAddress() : Enter");
		long startTime = System.currentTimeMillis();

		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			logger.debug("DataController.saveAddress() : Exiit: Total Time Taken: "
					+ (System.currentTimeMillis() - startTime));
			return "false";
		}

		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setStatus(UserStatus.ADDRESS_CREATED.toString());
		user.setLastModifieddDate(new Date().toString());
		user.getAddress().setAddress1(address1);
		user.getAddress().setAddress2(address2);
		user.getAddress().setAddress3(address3);
		user.getAddress().setPhone(phone);
		user.getAddress().setCity(city);
		user.getAddress().setState(state);
		user.getAddress().setCountry(country);

		dataService.updateUser(user);

		request.getSession().removeAttribute("user");
		request.getSession(false);

		if (request.getSession() != null)
			request.getSession().setMaxInactiveInterval(1);

		logger.debug("DataController.saveAddress() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));

		return "true";

	}

	@RequestMapping(value = StoreRestURIConstants.AUTHENTICATE_USER, method = RequestMethod.POST)
	public @ResponseBody String authenticateUser(
			@PathVariable("emailid") String emailid,
			@PathVariable("password") String password,
			HttpServletRequest request) {

		logger.debug("DataController.authenticateUser() : Enter");
		long startTime = System.currentTimeMillis();
		
		User user = dataService.authenticateUser(emailid, password);

		String resp = "";

		if (user != null) {
			request.getSession().setAttribute("user", user);
			resp = "true";
		} else {
			resp = "false";
		}

		logger.debug("DataController.authenticateUser() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		

		return resp;

	}
	
	
	@RequestMapping(value = StoreRestURIConstants.GET_USER_HOME_PAGE)
	public ModelAndView getUserHomePage(Model model, HttpServletRequest request) {
	
		logger.debug("DataController.getUserHomePage() : Enter");
		long startTime = System.currentTimeMillis();

		ModelAndView modelView = new ModelAndView("userHomePage");

		logger.debug("DataController.getUserHomePage() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));

		return modelView;
	}

	/******************************************
	 * Product Page Functions Starting from here
	 ******************************************/
	@RequestMapping(value = StoreRestURIConstants.GET_PRODUCT_HOME_PAGE)
	public ModelAndView getProductHomePage(Model model, HttpSession session,
			HttpServletResponse response) {
		// Commented by Amit
		ModelAndView modelView = new ModelAndView("productHome");
		List<com.online.pizzastore.vo.customer.order.Product> productOrderList = new ArrayList<com.online.pizzastore.vo.customer.order.Product>();

		session.setAttribute("productOrderList", productOrderList);

		List<Product> products = dataService.findAllProducts();
		model.addAttribute("products", products);

		return modelView;
	}

	@RequestMapping(value = StoreRestURIConstants.GET_CONTINUE_HOME_PAGE)
	public ModelAndView getContinueHomePage(Model model,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("productHome");

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
