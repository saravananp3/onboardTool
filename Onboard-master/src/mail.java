/**
 * Created by danges1 on 10/10/2017
 */

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import org.omg.CORBA.Environment;

//import com.mysql.cj.api.Session;

public class mail 
{
	public static void main(String[] args) {
		/*String username="balamurugan@platform3solutions.com";
		String password="Bala1996";*/
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class",
			"javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", "465");

	Session session = Session.getDefaultInstance(props,
		new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("balamuruganm96@gmail.com","Bala1996");
			}
		});

	try {

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("balamuruganm96@gmail.com"));
		message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("balamurugan@platform3solutions.com"));
		message.setSubject("Testing Subject");
		message.setText("Dear Mail Crawler," +
				"\n\n No spam to my email, please!");

		Transport.send(message);

		System.out.println("Done");

	} catch (MessagingException e) {
		throw new RuntimeException(e);
	}
}
}