package com.online.pizzastore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.pizzastore.vo.Product;
import com.online.pizzastore.vo.Topping;
import com.online.pizzastore.vo.User;

@Repository
public class DataDaoImpl implements IDataDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Product> findAllProducts() {
		Session session = sessionFactory.openSession();

		@SuppressWarnings("unchecked")
		List<Product> products = session.createQuery("from Product").list();

		session.close();

		return products;

	}

	@Transactional
	public Product findProductByID(int productId) {

		Session session = sessionFactory.openSession();
		Product product = (Product) session.load(Product.class, productId);
		session.close();
		return product;
	}

	@Transactional
	public List<Topping> findToppingsByProductID(int productId) {

		Session session = sessionFactory.openSession();

		@SuppressWarnings("unchecked")
		List<Topping> toppings = session.createQuery(
				"from Topping where productid=" + productId).list();

		session.close();
		return toppings;
	}

	@Transactional
	public Topping findToppingByID(int toppingId) {

		Session session = sessionFactory.openSession();
		Topping topping = (Topping) session.load(Topping.class, toppingId);

		session.close();
		return topping;
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public boolean userAlreadyExists(String emailid) {

		Session session = sessionFactory.openSession();

		List<User> result = session
				.createQuery("from User as u where u.emailid=:emailid")
				.setParameter("emailid", emailid).list();

		session.close();

		return !result.isEmpty();

	}

	@Transactional
	@SuppressWarnings("unchecked")
	public boolean tokenAlreadyExists(String token) {

		Session session = sessionFactory.openSession();
		List<User> result = session
				.createQuery("from User as u where u.userToken=:token")
				.setParameter("token", token).list();

		session.close();

		return !result.isEmpty();

	}

	public void addUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
	}
	
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();
	}

	@Transactional
	public User findUserByToken(String userToken) {

		Session session = sessionFactory.openSession();
		String queryString = "from User as u where u.userToken=:token";
		Query query = session.createQuery(queryString);
		query.setParameter("token", userToken);
		User user = (User) query.uniqueResult();

		session.close();

		return user;
	}

	public boolean authenticateUser(User user) {

		boolean userFound = false;

		/*
		 * Session session = sessionFactory.openSession(); String SQL_QUERY =
		 * "from User as u where u.EMAILID=? and u.PASSWORD=?";
		 * 
		 * Query query = session.createQuery(SQL_QUERY); query.setParameter(0,
		 * user.getEmailid()); query.setParameter(1, user.getPassword());
		 * 
		 * List<User> userObjs = query.list();
		 * 
		 * if (userObjs.size() != 0) { userFound = true;
		 * System.out.println("User Login Detail Found................."); }
		 */

		return userFound;

	}
}
