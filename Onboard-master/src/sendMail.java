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
 * Servlet implementation class sendMail
 */
@WebServlet("/sendMail")
public class sendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String rol=request.getParameter("roless");
		String email=request.getParameter("mailid");
		System.out.println(rol);
		System.out.println(email);
		Properties props = new Properties();
				
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.office365.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getDefaultInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		//return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
			return new PasswordAuthentication("balamurugan@platform3solutions.com","Bala1996");
		}
		});

		try {

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("balamurugan@platform3solutions.com"));
		
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
		message.setSubject("Registration Link");
		message.setText("http://localhost:8080/onboard/user_reg.jsp?role="+rol);

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
		doGet(request, response);
	}

}
