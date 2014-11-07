package com.online.pizzastore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.online.pizzastore.domain.Product;
import com.online.pizzastore.domain.Topping;
import com.online.pizzastore.domain.User;
import com.online.pizzastore.dao.IDataDao;

public class DataServiceImpl implements IDataService {

	@Autowired
	IDataDao dataDao;

	public List<Product> findAllProducts() {
		return dataDao.findAllProducts();
	}

	public boolean authenticateUser(User user) {
		return dataDao.authenticateUser(user);
	}

	public Product findProductByID(int productid) {
		return dataDao.findProductByID(productid);
	}

	public List<Topping> findToppingsByProductID(int productid) {
		return dataDao.findToppingsByProductID(productid);
	}
}
