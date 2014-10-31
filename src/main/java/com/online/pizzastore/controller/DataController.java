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
import com.online.pizzastore.services.IDataService;

@Controller
@SessionAttributes
public class DataController {

	@Autowired
	IDataService dataService;

	@RequestMapping("/")
	public ModelAndView getShoppingPage(Model model) {
		
		List<Item> items = dataService.findAllItems();
		model.addAttribute("items", items);
		
		//model.addAttribute("item",new Item());
		
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "addtoppings", method = RequestMethod.GET)
	public ModelAndView addToppingsPage(@ModelAttribute("item") Item item) {
		// dataService.insertRow(employee);
		//System.out.println(item);
		return new ModelAndView("result");
	}

	
/*	@RequestMapping("loginform")
	public String getForm(Model model) {		
		//ModelAndView model = new ModelAndView("loginform");
		model.addAttribute("login", new UserLoginDetail()); 
		return "loginform";
	}*/
	
	/*@RequestMapping(value = "authenticate", method = RequestMethod.GET)
	public ModelAndView authenticateUser(
			@ModelAttribute("login") UserLoginDetail user) {
		// dataService.insertRow(employee);
		System.out.println(user.getEmailid());
		System.out.println(user.getPassword());
		return new ModelAndView("redirect:result");
	}*/
}
