package com.online.pizzastore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.online.pizzastore.dao.IDataDao;
import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;

public class DataServiceImpl implements IDataService {

	@Autowired
	IDataDao dataDao;

	public List<Product> findAllProducts() {
		return dataDao.findAllProducts();
	}

	public boolean authenticateUser(User user) {
		return dataDao.authenticateUser(user);
	}

	public Product findProductByID(int productId) {
		return dataDao.findProductByID(productId);
	}

	public List<Topping> findToppingsByProductID(int productId) {
		return dataDao.findToppingsByProductID(productId);
	}

	public Topping findToppingByID(int toppingId) {
		return dataDao.findToppingByID(toppingId);
	}
	
	public boolean userAlreadyExists(String emailid) 
	{
		return dataDao.userAlreadyExists(emailid);
	}
	
	public void addUser(User user)
	{
		dataDao.addUser(user);
	}
	
	public boolean tokenAlreadyExists(String token)
	{
		return dataDao.tokenAlreadyExists(token);
	}
	
	public User findUserByToken(String userToken) 
	{
		return dataDao.findUserByToken(userToken);
	}
	
	public void updateUser(User user)
	{
		dataDao.updateUser(user);
	}
}
