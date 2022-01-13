package common.email.service;

import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Message.RecipientType;

import org.simplejavamail.email.Email;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.config.TransportStrategy;

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

	
	public boolean sendApprovalEmail(String username, String uEmail, String approval_Link, String mail_content, String subject,Object[] replaceValues) {
		loadProperties();
		Mailbean mbn = getMailProps();
		Email email = new Email();
		email.setFromAddress(properties.getProperty("TOOL.EMAIL"), mbn.getSmtpFrom());
		email.setSubject(subject);
		email.setTextHTML(MessageFormat.format(mail_content, replaceValues));
		email.addRecipient(uEmail, uEmail, RecipientType.TO);
		return sendemail(email, mbn);
	}

	public static boolean sendemail(Email email, Mailbean mbn) {
		try {
			new Mailer(mbn.getSmtpServer(), Integer.parseInt(mbn.getSmtpPort()), mbn.getSmtpFrom(), mbn.getSmtpPwd(),
					TransportStrategy.SMTP_TLS).sendMail(email);
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
		return mbn;
	}

}
