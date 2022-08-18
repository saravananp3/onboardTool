package common.bean;

public class Mailbean {
	private String smtpServer;
	private String smtpPort;
	private String smtpFrom;
	private String smtpPwd;
	private String SMTP_AUTH;
	private String SMTP_DEBUG;
	private String SMTP_STARTTLS;
	private static Exception smtpException;
	
	public String getSmtpServer() {
		return smtpServer;
	}
	public String getSMTP_AUTH() {
		return SMTP_AUTH;
	}
	public void setSMTP_AUTH(String sMTP_AUTH) {
		SMTP_AUTH = sMTP_AUTH;
	}
	public String getSMTP_DEBUG() {
		return SMTP_DEBUG;
	}
	public void setSMTP_DEBUG(String sMTP_DEBUG) {
		SMTP_DEBUG = sMTP_DEBUG;
	}
	public String getSMTP_STARTTLS() {
		return SMTP_STARTTLS;
	}
	public void setSMTP_STARTTLS(String sMTP_STARTTLS) {
		SMTP_STARTTLS = sMTP_STARTTLS;
	}
	public void setSmtpServer(String smtpServer) {
		this.smtpServer = smtpServer;
	}
	public String getSmtpPort() {
		return smtpPort;
	}
	public void setSmtpPort(String smtpPort) {
		this.smtpPort = smtpPort;
	}
	public String getSmtpFrom() {
		return smtpFrom;
	}
	public void setSmtpFrom(String smtpFrom) {
		this.smtpFrom = smtpFrom;
	}
	public String getSmtpPwd() {
		return smtpPwd;
	}
	public void setSmtpPwd(String smtpPwd) {
		this.smtpPwd = smtpPwd;
	}
	public static Exception getSmtpException() {
		return smtpException;
	}
	public static void setSmtpException(Exception smtpException) {
		Mailbean.smtpException = smtpException;
	}

	
}
