package com.online.pizzastore.services;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.online.pizzastore.vo.User;

public class EmailService implements Runnable {

	private User user = null;

	public EmailService(User user) {
		this.user = user;
	}

	private static String getMessageBody(String token) {
		String msg = "Hi Guest, \n\n";
		msg = msg + "Thanks for registering with us.";
		msg = msg + "Please click on the below mentioned link to ";
		msg = msg + "verify your account.\n\n";
		msg = msg + "http://localhost:8080/PizzaStore/customer";
		msg = msg + "/new/" + token + "\n\n";
		msg = msg + "Thanks & Regards\n\n";
		msg = msg + "Admin";
		msg = msg + "\nASR Pizza Store";

		return msg;
	}

	private void sendEmail() {

		String smtpHostServer = "smtp.gmail.com";
		String subject = "User Verification Required";

		String body = getMessageBody(this.user.getUserToken());

		Properties props = new Properties();

		props.put("mail.smtp.host", smtpHostServer);
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(
								"asrpizzaastore@gmail.com", "pizza12345");
					}
				});

		try {
			MimeMessage msg = new MimeMessage(session);
			// set message headers
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");

			msg.setFrom(new InternetAddress("asrpizzaastore@gmail.com",
					"ASR Pizza Store"));

			msg.setSubject(subject, "UTF-8");

			msg.setText(body, "UTF-8");

			msg.setSentDate(new Date());

			msg.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(this.user.getEmailid(), false));
			System.out.println("Message is ready for " + user.getEmailid());
			Transport.send(msg);

			System.out.println("EMail Sent Successfully to : "
					+ user.getEmailid() + "!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void run() {
		this.sendEmail();

	}
}
