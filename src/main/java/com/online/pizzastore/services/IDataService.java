package com.online.pizzastore.services;

import java.util.List;

import com.online.pizzastore.domain.Item;

public interface IDataService {
	public List<Item> findAllItems();

}