package com.online.pizzastore.services;

import java.util.Calendar;
import java.util.Date;
import org.apache.commons.lang.RandomStringUtils;

import com.online.pizzastore.vo.User;

public class UserServices {

	public static User createUserInstance(String emailid) {

		// String uuid = UUID.randomUUID().toString();
		// System.out.println("uuid = " + uuid);

		String userToken = RandomStringUtils.randomAlphabetic(5)
				+ RandomStringUtils.randomNumeric(7);

		Date dNow = new Date(); // Instantiate a Date object
		Calendar cal = Calendar.getInstance();
		cal.setTime(dNow);
		cal.add(Calendar.MINUTE, 30);
		dNow = cal.getTime();

		String tokenExpiryDate = dNow.toString();

		User user = new User();
		user.setEmailid(emailid);
		user.setUserToken(userToken);
		user.setTokenExpiryDate(tokenExpiryDate);

		return user;

	}

}
