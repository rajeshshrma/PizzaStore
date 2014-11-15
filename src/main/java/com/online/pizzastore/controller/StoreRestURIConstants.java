package com.online.pizzastore.controller;

public class StoreRestURIConstants {

	// public static final String DUMMY_EMP = "/rest/emp/dummy";
	// public static final String GET_EMP = "/rest/emp/{id}";
	// public static final String GET_ALL_EMP = "/rest/emps";
	//  /customer/new/{token}
	public static final String GET_INDEX_PAGE = "/";
	public static final String GET_PRODUCT_HOME_PAGE = "/product/home";
	public static final String GET_CONTINUE_HOME_PAGE = "/cart/product/add/more";
	public static final String GET_SELECTED_PRODUCT_LIST_PAGE = "/cart/product/display/selected";
	public static final String ADD_PRODUCT_TO_CART = "/cart/product/add/{productId}";
	public static final String ADD_TOPPINGS_TO_CART = "/cart/product/{productPosition}/add/toppings/{toppingId}/{optionId}";
	public static final String GET_TOPPINGS_LIST = "/cart/product/toppings/list/{productId}";
	public static final String CHECK_EMAILID = "/user/emailid/{emailid}/check";

}
