package com.online.pizzastore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.online.pizzastore.domain.Item;
import com.online.pizzastore.domain.User;
import com.online.pizzastore.domain.UserLoginDetail;
import com.online.pizzastore.services.IDataService;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	@RequestMapping("/")
	public ModelAndView getHomePage(Model model) {
		model.addAttribute("login", new User());
		return new ModelAndView("loginform");
	}

	@RequestMapping(value = "authenticate", method = RequestMethod.POST)
	public ModelAndView authenticateUser(Model model,
			@ModelAttribute("login") User user) {

		boolean isValid = dataService.authenticateUser(user);

		if (isValid == true) {
			List<Item> items = dataService.findAllItems();
			model.addAttribute("items", items);
			model.addAttribute("user", user);

			return new ModelAndView("user_home");
		} else {

			model.addAttribute("login", new User());
			return new ModelAndView("loginform");
		}
	}


	@RequestMapping(value = "addtoppings", method = RequestMethod.GET)
	public ModelAndView addToppingsPage(@ModelAttribute("item") Item item) {
		// dataService.insertRow(employee);
		// System.out.println(item);
		return new ModelAndView("result");
	}


	/*
	 * @RequestMapping(value = "authenticate", method = RequestMethod.GET)
	 * public ModelAndView authenticateUser(
	 * 
	 * @ModelAttribute("login") UserLoginDetail user) { //
	 * dataService.insertRow(employee); System.out.println(user.getEmailid());
	 * System.out.println(user.getPassword()); return new
	 * ModelAndView("redirect:result"); }
	 */
}
