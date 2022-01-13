package common.email.service;

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

import com.google.gson.JsonObject;

import common.bean.Mailbean;
import common.constant.APPROVAL_CONSTANT;
import common.constant.EMAIL_SERVICE_CONSTANT;
import common.constant.INTAKE_TABLE;
import common.constant.MODULE_NAME;
import onboard.DBconnection;

public class EmailApprovalService extends EmailService {

	static Properties properties = new Properties();
	private Connection con = null;
	private DBconnection dBconnection = null;
	private String oppId = null;
	private String appName = null;
	private String tableName = null;
	private String approval_Link = null;

	public EmailApprovalService(String oppId, String appName, String module)
			throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		properties = loadProperties();
		this.oppId = oppId;
		this.appName = appName;
		setTableName(module);
	}

	public void setTableName(String module) {
		switch (module) {
		case MODULE_NAME.INTAKE_MODULE:
			tableName = INTAKE_TABLE.STAKE_HOLDER_TABLE;
			this.approval_Link = "'http://" + properties.getProperty("EMAIL.LINK.HOST") + ":"
					+ properties.getProperty("EMAIL.LINK.PORT") + properties.getProperty("EMAIL.JSP.LINK");
			break;
		}
	}

	public JsonObject getUserListAndSendApprovalMail() {

		int priorityNumber = 0;
		boolean checkStatus = true;
		JsonObject jsonObject = new JsonObject();
		try {
			String mailCont = properties.getProperty("EMAIL.APPROVAL");
			priorityNumber = getMailPriorityNumber();
			String selectQuery = "SELECT * FROM " + tableName + " WHERE OPPID='" + oppId + "' AND PRIORITY_ORDER_NUM='"
					+ priorityNumber + "';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while (rs.next()) {
				String user_name = rs.getString("name");
				String user_mail = rs.getString("emailId");
				String approval_id = rs.getString("approvalId");
				String approvalLink = approval_Link + approval_id + "'";
				Object[] replaceValues = new Object[] { user_name, appName, approvalLink };
				System.out.println(user_name + " : " + user_mail);
				sendApprovalEmail(user_name, user_mail, approvalLink, mailCont,
						EMAIL_SERVICE_CONSTANT.INTAKE_APPROVAL_SUBJECT, replaceValues);
				setFlagAndDecisionForApproverId("true", APPROVAL_CONSTANT.DECISION_PENDING, approval_id);
			}

			rs.close();
			st.close();

		} catch (Exception e) {
			checkStatus = false;
			e.printStackTrace();
		}

		jsonObject.addProperty("checkStatus", checkStatus);
		jsonObject.addProperty("priorityNumber", priorityNumber);

		return jsonObject;

	}

	public boolean checkCurrentApproverCanDecide(String approverId) {
		try {
			String selectQuery = "SELECT * FROM " + tableName + " WHERE APPROVALID='" + approverId + "'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if (rs.next()) {
				if (!rs.getBoolean("mail_flag")) {
					return false;
				} else if (rs.getString("intakeApproval").equals(APPROVAL_CONSTANT.DECISION_PENDING)
						|| rs.getString("intakeApproval").equals(APPROVAL_CONSTANT.REJECTED)) {
					return true;
				}
			}
			st.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public int getMailPriorityNumber() {
		int priorityNum = 0;
		try {
			String selectQuery = "SELECT * FROM " + tableName + " WHERE OPPID = '" + oppId
					+ "' ORDER BY PRIORITY_ORDER_NUM";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while (rs.next()) {
				boolean mailFlag = Boolean.parseBoolean(rs.getString("mail_flag"));
				String decision = rs.getString("intakeApproval");
				if (!mailFlag && decision.equals(APPROVAL_CONSTANT.DECISION_PENDING)) {
					return rs.getInt("priority_order_num");
				} else if (mailFlag && decision.equals(APPROVAL_CONSTANT.REJECTED)) {
					setFlagAndDecision("false", APPROVAL_CONSTANT.DECISION_PENDING);
					return 1;
				} else if (mailFlag && decision.equals(APPROVAL_CONSTANT.DECISION_PENDING)) {
					return 0;
				}
			}
			st.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return priorityNum;
	}

	public void setFlagAndDecision(String mailFlag, String approval) {
		try {
			String selectQuery = "UPDATE " + tableName + " SET MAIL_FLAG ='" + mailFlag + "', INTAKEAPPROVAL = '"
					+ approval + "' WHERE OPPID = '" + oppId + "'";
			Statement st = con.createStatement();
			st.executeUpdate(selectQuery);
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setFlagAndDecisionForApproverId(String mailFlag, String approval, String approverId) {
		try {
			String selectQuery = "UPDATE " + tableName + " SET MAIL_FLAG ='" + mailFlag + "', INTAKEAPPROVAL = '"
					+ approval + "' WHERE OPPID = '" + oppId + "' AND APPROVALID='" + approverId + "'";
			Statement st = con.createStatement();
			st.executeUpdate(selectQuery);
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void finalize() throws Throwable {
		con.close();
	}
}
