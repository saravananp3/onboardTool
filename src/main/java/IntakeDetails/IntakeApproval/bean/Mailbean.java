package IntakeDetails.IntakeApproval.bean;

public class Mailbean {
	private String smtpServer;
	private String smtpPort;
	private String smtpFrom;
	private String smtpPwd;
	private static Exception smtpException;
	
	public String getSmtpServer() {
		return smtpServer;
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
