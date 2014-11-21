package com.online.pizzastore.services;

import java.util.List;

import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;

public interface IDataService {
	public User authenticateUser(String emailid,String password) ;

	public List<Product> findAllProducts();

	public Product findProductByID(int productId);

	public List<Topping> findToppingsByProductID(int productId);
	
	public Topping findToppingByID(int toppingId);
	
	public boolean userAlreadyExists(String emailid) ;
	
	public void addUser(User user);

	public boolean tokenAlreadyExists(String token);
	
	public User findUserByToken(String userToken) ;
	
	public void updateUser(User user);
	
	public User findUserByEmailID(String emailid);
}