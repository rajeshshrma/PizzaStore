package com.online.pizzastore.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.online.pizzastore.domain.Item;
import com.online.pizzastore.services.IDataService;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	@RequestMapping(value = StoreRestURIConstants.GET_HOME_PAGE)
	public ModelAndView getHomePage(
			Model model,
			HttpSession session,
			@CookieValue(value = "hitCounter", defaultValue = "0") Long hitCounter,
			HttpServletResponse response) {
		// increment hit counter
		hitCounter++;
		// create cookie and set it in response
		Cookie cookie = new Cookie("hitCounter", hitCounter.toString());
		response.addCookie(cookie);
		ModelAndView modelView = new ModelAndView("user_home");
		String sessionid = session.getId();

		String createtime = new Date(session.getCreationTime()).toString();
		modelView.addObject("sessionid", sessionid);
		modelView.addObject("createtime", createtime);
		List<Item> items = dataService.findAllItems();
		model.addAttribute("items", items);
		return modelView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = StoreRestURIConstants.ADD_ITEM_TO_CART, method = RequestMethod.POST)
	public @ResponseBody String addToCart(@PathVariable("itemid") int itemid,
			HttpServletRequest request) {
		List<Cart> userCart = null;
		if (request.getSession().getAttribute("itemCart") == null) {
			userCart = new ArrayList<Cart>();
		} else {
			userCart = (List<Cart>) request.getSession().getAttribute(
					"itemCart");
		}

		Item item = dataService.findItemByID(itemid);
		Cart cart = new Cart(item, 1);
		userCart.add(cart);
		request.getSession().setAttribute("itemCart", userCart);
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(userCart,
				new TypeToken<List<Cart>>() {
				}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		return jsonArray.toString();
	}

	@RequestMapping(value = StoreRestURIConstants.GET_TOPPINGS_LIST)
	public ModelAndView getToppingsPage(Model model,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelView = new ModelAndView("item_toppings");

		return modelView;
	}

	@RequestMapping(value = "addtoppings", method = RequestMethod.GET)
	public ModelAndView addToppingsPage(@ModelAttribute("item") Item item) {
		// dataService.insertRow(employee);
		// System.out.println(item);
		return new ModelAndView("result");
	}

}
