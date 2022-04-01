package common.resource;

import java.io.InputStream;
import java.util.Properties;

import common.constant.EMAIL_SERVICE_CONSTANT;
import common.email.service.EmailApprovalService;

public class resourceUtils {
	
    private String path =  null;
	public resourceUtils(String path) {
		this.path = path;
	}
	
	
	public Properties loadProperties() {
		Properties properties = new Properties();
		try {
			InputStream fileInput = EmailApprovalService.class
					.getResourceAsStream(path);
			properties.load(fileInput);
			fileInput.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return properties;
	}
}
