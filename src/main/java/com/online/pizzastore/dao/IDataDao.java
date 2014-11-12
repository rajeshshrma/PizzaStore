package com.online.pizzastore.dao;

import java.util.List;

import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;

public interface IDataDao {

	public boolean authenticateUser(User user);

	public List<Product> findAllProducts();

	public Product findProductByID(int productId);

	public List<Topping> findToppingsByProductID(int productId);
	
	public Topping findToppingByID(int toppingId);

}