package IntakeDetails.IntakeApproval.service;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Message.RecipientType;

import org.simplejavamail.email.*;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.config.TransportStrategy;

import IntakeDetails.IntakeApproval.bean.Mailbean;
import IntakeDetails.IntakeApproval.constant.EmailServicesConstants;
import onboard.DBconnection;

public class intakeMailApprovalService {

	static Properties properties = new Properties();
	private Connection con = null;
	private DBconnection dBconnection = null;
	private String oppId = null;
	private String appName = null;
	public intakeMailApprovalService(String oppId,String appName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.oppId = oppId;
		this.appName = appName;
	}

	public void loadProperties() {
		try {
			InputStream fileInput = intakeMailApprovalService.class
					.getResourceAsStream(EmailServicesConstants.MAIL_PROPS);
			properties.load(fileInput);
			fileInput.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean getUserListAndSendApprovalMail() {

		boolean checkStatus = true;

		try {
			loadProperties();
			String selectQuery = "select * from intake_stake_holder_info where OppId='" + oppId + "';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while (rs.next()) {
				String user_name = rs.getString("name");
				String user_mail = rs.getString("emailId");
				String approval_id = rs.getString("approvalId");
				String approval_Link ="'http://"+properties.getProperty("EMAIL.LINK.HOST")+":"+properties.getProperty("EMAIL.LINK.PORT")+properties.getProperty("EMAIL.JSP.LINK")+approval_id+"'";
				System.out.println(user_name+" : "+user_mail);
				sendApprovalEmail(user_name, user_mail, approval_Link);
			}

			rs.close();
			st.close();

		} catch (Exception e) {
			checkStatus = false;
			e.printStackTrace();
		}

		return checkStatus;

	}

	public boolean sendApprovalEmail(String username, String uEmail, String approval_Link) {
		loadProperties();
		Mailbean mbn = getMailProps();
		Email email = new Email();
		String mailCont = properties.getProperty("EMAIL.APPROVAL");
		email.setFromAddress(properties.getProperty("TOOL.EMAIL"), mbn.getSmtpFrom());
		email.setSubject(EmailServicesConstants.INTAKE_APPROVAL_SUBJECT);
		Object[] replaceValues = new Object[] { username, appName,approval_Link };
		email.setTextHTML(MessageFormat.format(mailCont, replaceValues));
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

	@Override
	protected void finalize() throws Throwable {
		con.close();
	}

//	public static void main(String[] args) {
//        intakeMailApprovalService service = new intakeMailApprovalService();
//        service.loadProperties();
//        service.sendApprovalEmail("vinoth", "vinothonmission@gmail.com");
//	}
}
