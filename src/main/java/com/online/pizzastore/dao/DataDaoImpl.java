package com.online.pizzastore.dao;

import java.util.List;  
import javax.transaction.Transactional;  
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Repository;
import com.online.pizzastore.domain.Item;


@Repository
public class DataDaoImpl implements IDataDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Item> findAllItems() {
		Session session = sessionFactory.openSession();

		@SuppressWarnings("unchecked")
		List<Item> items = session.createQuery("from Item").list();

		session.close();

		return items;

	}

}
