package common.email.service;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import common.bean.Mailbean;
import common.constant.EMAIL_SERVICE_CONSTANT;

public class EmailService {

	static Properties properties = new Properties();

	public Properties loadProperties() {
		try {
			InputStream fileInput = EmailApprovalService.class
					.getResourceAsStream(EMAIL_SERVICE_CONSTANT.MAIL_PROPS);
			properties.load(fileInput);
			fileInput.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return properties;
	}

	public boolean sendApprovalEmail(String username, String uEmail, String approval_Link, String mail_content, String subject,Object[] replaceValues) throws MessagingException, UnsupportedEncodingException {
		loadProperties();
		Mailbean mbn = new Mailbean();
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(properties.getProperty("EMAIL.TOOL"), properties.getProperty("EMAIL.PASSWORD"));

			}

		});

		session.setDebug(true);

		MimeMessage message = new MimeMessage(session);

		message.setFrom(new InternetAddress(properties.getProperty("EMAIL.TOOL")));

		message.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail, uEmail));

		message.setSubject(subject);

		message.setContent(MessageFormat.format(mail_content, replaceValues),"text/html");

		return sendemail(message, mbn);
	}

	public static boolean sendemail(MimeMessage message,Mailbean mbn) {
		try {

			properties.setProperty("mail.smtp.host", properties.getProperty("EMAIL.SERVER"));
			properties.setProperty("mail.smtp.port", properties.getProperty("EMAIL.PORT"));
			properties.put("mail.debug", properties.getProperty("SMTP_DEBUG"));
			properties.put("mail.smtp.starttls.enable", properties.getProperty("SMTP_STARTTLS"));
			properties.put("mail.smtp.auth",properties.getProperty("SMTP_AUTH"));
			Transport.send(message);
			System.out.println("sending...");
			System.out.println("Sent message successfully....");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			Mailbean.setSmtpException(e);
			return false;
		}
	}

	private static Mailbean getMailProps() {
		Mailbean mbn = new Mailbean();
		mbn.setSmtpPwd(properties.getProperty("EMAIL.PASSWORD"));
		mbn.setSmtpFrom(properties.getProperty("EMAIL.TOOL"));
		mbn.setSmtpPort(properties.getProperty("EMAIL.PORT"));
		mbn.setSmtpServer(properties.getProperty("EMAIL.SERVER"));
		mbn.setSMTP_AUTH(properties.getProperty("SMTP_AUTH"));
		mbn.setSMTP_DEBUG(properties.getProperty("SMTP_DEBUG"));
		mbn.setSMTP_STARTTLS(properties.getProperty("SMTP_STARTTLS"));

		return mbn;
	}

}
