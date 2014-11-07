package com.online.pizzastore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;

import com.online.pizzastore.domain.Product;
import com.online.pizzastore.domain.Topping;
import com.online.pizzastore.domain.User;

@Repository
public class DataDaoImpl implements IDataDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Product> findAllProducts() {
		Session session = sessionFactory.openSession();

		@SuppressWarnings("unchecked")
		List<Product> products = session.createQuery("from Product").list();

		return products;

	}

	public Product findProductByID(int productid) {

		Session session = sessionFactory.openSession();
		Product product = (Product) session.load(Product.class, productid);

		return product;
	}

	public List<Topping> findToppingsByProductID(int productid) {

		Session session = sessionFactory.openSession();

		@SuppressWarnings("unchecked")
		List<Topping> toppings = session.createQuery(
				"from Topping where productid=" + productid).list();

		return toppings;
	}

	@SuppressWarnings("unchecked")
	public boolean authenticateUser(User user) {
		Session session = sessionFactory.openSession();

		boolean userFound = false;

		String SQL_QUERY = "from User as u where u.EMAILID=? and u.PASSWORD=?";

		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, user.getEmailid());
		query.setParameter(1, user.getPassword());

		List<User> userObjs = query.list();

		if (userObjs.size() != 0) {
			userFound = true;
			System.out.println("User Login Detail Found.................");
		}

		return userFound;

	}
}
