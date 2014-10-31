package com.online.pizzastore.dao;

import java.util.List;

import com.online.pizzastore.domain.Item;

public interface IDataDao {

	public List<Item> findAllItems();

}