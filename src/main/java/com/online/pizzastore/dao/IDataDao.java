package com.online.pizzastore.dao;

import java.util.List;

import com.online.pizzastore.domain.Item;
import com.online.pizzastore.domain.User;

public interface IDataDao {

	public boolean authenticateUser(User user)  ;
	public List<Item> findAllItems();
	public Item findItemByID(int itemid);

}