package com.online.pizzastore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.online.pizzastore.domain.Item;
import com.online.pizzastore.domain.User;

import com.online.pizzastore.dao.IDataDao;

public class DataServiceImpl implements IDataService {

	@Autowired
	IDataDao dataDao;

	public List<Item> findAllItems() {
		return dataDao.findAllItems();
	}

	public boolean authenticateUser(User user) {
		return dataDao.authenticateUser(user);
	}
}
