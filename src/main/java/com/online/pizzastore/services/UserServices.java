package com.online.pizzastore.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;

import com.online.pizzastore.vo.User;
import com.online.pizzastore.vo.UserStatus;

public class UserServices {

	public static User createUserInstance(String emailid,
			IDataService dataService) {

		// String uuid = UUID.randomUUID().toString();
		// System.out.println("uuid = " + uuid);

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
		
		SimpleDateFormat formatter = new SimpleDateFormat("EE MMM dd HH:mm:ss yyyy");
		String tokenExpiryDate = formatter.format(dNow);

		User user = new User();
		user.setEmailid(emailid);
		user.setUserToken(userToken);
		user.setTokenExpiryDate(tokenExpiryDate);
		user.setStatus(UserStatus.EMAIL_REGISTERED.toString());

		return user;

	}

	public static boolean isTokenExpired(String tokenExpDate) {
		boolean isExpired = false;
		SimpleDateFormat formatter = new SimpleDateFormat("EE MMM dd HH:mm:ss yyyy");
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

		return isExpired;
	}

}
