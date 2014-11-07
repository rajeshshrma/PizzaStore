package com.online.pizzastore.dao;

import java.util.List;

import com.online.pizzastore.domain.Product;
import com.online.pizzastore.domain.Topping;
import com.online.pizzastore.domain.User;

public interface IDataDao {

	public boolean authenticateUser(User user);

	public List<Product> findAllProducts();

	public Product findProductByID(int productid);

	public List<Topping> findToppingsByProductID(int productid);

}