package com.online.pizzastore.services;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

import com.online.pizzastore.vo.User;

public class EmailService implements Runnable {

	private User user = null;
	private static final Logger logger = Logger.getLogger(EmailService.class);

	public EmailService(User user) {
		this.user = user;
	}

	private String getMessageBody() {
		logger.debug("EmailService.getMessageBody() : Enter");
		long startTime = System.currentTimeMillis();

		String msg = "Hello " + this.user.getEmailid() + ",\n\n";
		msg = msg + "Thanks for registering with us.";
		msg = msg
				+ "Please click on the below mentioned link to verify your account.\n\n";
		msg = msg + "http://localhost:8080/PizzaStore/customer/new/"
				+ this.user.getUserToken() + "\n\n";
		msg = msg
				+ "If you did not request this, please accept our apologies and kindly ignore this email.\n\n";
		msg = msg + "Thanks & Regards\n\n";
		msg = msg + "Admin\nASR Pizza Store";

		logger.debug("EmailService.getMessageBody() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
		return msg;
	}

	private void sendEmail() {

		logger.debug("EmailService.sendEmail() : Enter");
		long startTime = System.currentTimeMillis();
		String smtpHostServer = "smtp.gmail.com";
		String subject = "User Verification Required";

		String body = this.getMessageBody();

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
			logger.error("mailService.sendEmail() : Error : " + e.getMessage());
			e.printStackTrace();
		}

		logger.debug("EmailService.sendEmail() : Exiit: Total Time Taken: "
				+ (System.currentTimeMillis() - startTime));
	}

	public void run() {
		this.sendEmail();

	}
}
