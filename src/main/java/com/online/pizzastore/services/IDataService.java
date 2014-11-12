package com.online.pizzastore.services;

import java.util.List;

import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;

public interface IDataService {
	public boolean authenticateUser(User user);

	public List<Product> findAllProducts();

	public Product findProductByID(int productId);

	public List<Topping> findToppingsByProductID(int productId);
	
	public Topping findToppingByID(int toppingId);

}