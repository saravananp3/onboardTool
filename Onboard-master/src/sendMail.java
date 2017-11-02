import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

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
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String rol=request.getParameter("roless");
		String email=request.getParameter("mailid");
		String msg=request.getParameter("message");
		System.out.println(msg);
		Properties props = new Properties();
		 HttpSession ses=request.getSession();  
	        ses.setAttribute("My_Roles",rol);  
				
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
		message.setText(msg);

		Transport.send(message);
System.out.println("xxxxxxx");
pw.println("<html><body>");  
pw.println("Registration link have been sent to you\n");
pw.println("<a href=\"Registration.jsp\" style='color:blue'> click </a>");
pw.println("</body></html>");  
  
pw.close();
		} catch (MessagingException e) {
		throw new RuntimeException(e);
		} 
		//get the stream to write the data  
		  
		 
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
