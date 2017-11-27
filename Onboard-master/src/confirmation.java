

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class confirmation
 */
@WebServlet("/confirmation")
public class confirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Properties props = new Properties();
	  String email=request.getParameter("email");
				
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.office365.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getDefaultInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		//return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
			return new PasswordAuthentication("arun.vk@platform3solutions.com","arun@kid06");
		}
		});

		try {

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("arun.vk@platform3solutions.com"));
		
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
		message.setSubject("Registration Successfull");
		message.setText("Thanks for Registering...Please click on the below link\n\nhttp://localhost:8080/onboard/Login.html");

		Transport.send(message);

		System.out.println("Done");

		} catch (MessagingException e) {
		throw new RuntimeException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
