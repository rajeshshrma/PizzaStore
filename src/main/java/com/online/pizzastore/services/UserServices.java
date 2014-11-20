package com.online.pizzastore.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.log4j.Logger;

import com.online.pizzastore.vo.Address;
import com.online.pizzastore.vo.User;
import com.online.pizzastore.vo.UserStatus;

public class UserServices {

	private static final Logger logger = Logger.getLogger(UserServices.class);

	public static User createUserInstance(String emailid,
			IDataService dataService) {

		// String uuid = UUID.randomUUID().toString();
		// System.out.println("uuid = " + uuid);

		logger.debug("UserServices.createUserInstance() : Enter");
		long startTime = System.currentTimeMillis();

		String userToken = "";
		boolean tokenAlreadyExists = true;

		do {
			userToken = RandomStringUtils.randomAlphabetic(5)
					+ RandomStringUtils.randomNumeric(7);

			tokenAlreadyExists = dataService.tokenAlreadyExists(userToken);

		} while (tokenAlreadyExists == true);

		Date dNow = new Date(); // Instantiate a Date object
		Calendar cal = Calendar.getInstance();
		cal.setTime(dNow);
		cal.add(Calendar.HOUR, 2);
		dNow = cal.getTime();

		SimpleDateFormat formatter = new SimpleDateFormat(
				"EE MMM dd HH:mm:ss yyyy");
		String tokenExpiryDate = formatter.format(dNow);

		User user = new User();
		user.setEmailid(emailid);
		user.setCreatedDate(new Date().toString());
		user.setLastModifieddDate(new Date().toString());
		user.setUserToken(userToken);
		user.setTokenExpiryDate(tokenExpiryDate);
		user.setStatus(UserStatus.EMAIL_REGISTERED.toString());

		Address address = new Address();
		address.setEmailid(emailid);

		user.setAddress(address);
		address.setUser(user);

		logger.debug("UserServices.createUserInstance() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));

		return user;
	}

	public static boolean isTokenExpired(String tokenExpDate) {

		logger.debug("UserServices.isTokenExpired() : Enter");
		long startTime = System.currentTimeMillis();

		boolean isExpired = false;
		SimpleDateFormat formatter = new SimpleDateFormat(
				"EE MMM dd HH:mm:ss yyyy");
		Date tokenExpiryDate = null;
		try {
			tokenExpiryDate = formatter.parse(tokenExpDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Date currentDate = new Date();

		int compareResult = currentDate.compareTo(tokenExpiryDate);

		if (compareResult > 0) {
			isExpired = true;
		}

		logger.debug("UserServices.isTokenExpired() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		
		return isExpired;
	}

}
