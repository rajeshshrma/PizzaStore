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
	public static final String VERIFY_EMAILID = "/user/emailid/{emailid}/verify";
	public static final String SAVE_PASSWORD = "/user/save/password/{password}";
	public static final String SAVE_ADDRESS = "/user/save/address/{firstName}/{lastName}/{address1}/{address2}/{address3}/{phone}/{city}/{state}/{country}";
	public static final String GET_TOKEN_VERIFICATION_PAGE = "/customer/new/{userToken}";
	public static final String AUTHENTICATE_USER = "/user/check/login/{emailid}/{password}";
	
	public static final String GET_USER_HOME_PAGE = "/user/homepage";
	

}
