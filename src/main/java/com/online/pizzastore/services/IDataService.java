package com.online.pizzastore.services;

import java.util.List;

import com.online.pizzastore.domain.Item;
import com.online.pizzastore.domain.User;


public interface IDataService {
	public boolean authenticateUser(User user)  ; 
	public List<Item> findAllItems();
	public Item findItemByID(int itemid);

}