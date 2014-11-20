package com.online.pizzastore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
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

	private static final Logger logger = Logger.getLogger(DataDaoImpl.class);
	
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

		logger.debug("DataDaoImpl.userAlreadyExists() : Enter");
		long startTime = System.currentTimeMillis();

		Session session = sessionFactory.openSession();

		List<User> result = session
				.createQuery("from User as u where u.emailid=:emailid")
				.setParameter("emailid", emailid).list();

		session.close();

		logger.debug("DataDaoImpl.userAlreadyExists() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		
		return !result.isEmpty();

	}

	@Transactional
	@SuppressWarnings("unchecked")
	public boolean tokenAlreadyExists(String token) {

		logger.debug("DataDaoImpl.tokenAlreadyExists() : Enter");
		long startTime = System.currentTimeMillis();
		
		Session session = sessionFactory.openSession();
		List<User> result = session
				.createQuery("from User as u where u.userToken=:token")
				.setParameter("token", token).list();

		session.close();
		
		logger.debug("DataDaoImpl.tokenAlreadyExists() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		
		return !result.isEmpty();

	}

	public void addUser(User user) {

		logger.debug("DataDaoImpl.addUser() : Enter");
		long startTime = System.currentTimeMillis();
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
		logger.debug("DataDaoImpl.addUser() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		
	}
	
	public void updateUser(User user) {

		logger.debug("DataDaoImpl.updateUser() : Enter");
		long startTime = System.currentTimeMillis();
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();
		logger.debug("DataDaoImpl.updateUser() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));		
	}

	@Transactional
	public User findUserByToken(String userToken) {

		logger.debug("DataDaoImpl.findUserByToken() : Enter");
		long startTime = System.currentTimeMillis();		

		Session session = sessionFactory.openSession();
		String queryString = "from User as u where u.userToken=:token";
		Query query = session.createQuery(queryString);
		query.setParameter("token", userToken);
		User user = (User) query.uniqueResult();

		session.close();

		logger.debug("DataDaoImpl.findUserByToken() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));		
		return user;
	}

	public User authenticateUser(String emailid,String password) {

		logger.debug("DataDaoImpl.authenticateUser() : Enter");
		long startTime = System.currentTimeMillis();		

		Session session = sessionFactory.openSession();
		String queryString = "from User as u where u.emailid=:emailid and u.password=:password";
		Query query = session.createQuery(queryString);
		query.setParameter("emailid", emailid);
		query.setParameter("password", password);
		
		User user = (User) query.uniqueResult();

		session.close();

		logger.debug("DataDaoImpl.authenticateUser() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));		
		return user;

	}

}
