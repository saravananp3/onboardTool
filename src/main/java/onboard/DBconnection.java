package onboard;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig; 
 
public class DBconnection{
 
	
private Connection connection;
public  DBconnection() throws ClassNotFoundException, SQLException{
			
			StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
			EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
			config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
			config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
			encryptor.setConfig(config);
			encryptor.setKeyObtentionIterations(1000);
			String decPw=null;
		try {
             
              ClassLoader loader = Thread.currentThread().getContextClassLoader();
              Properties prop = new Properties();
              String workingDir = System.getProperty("user.dir");
              InputStream resourceStream = (InputStream) loader.getResourceAsStream("Configuration.properties");
 
                   prop.load(resourceStream);
                   resourceStream.close();
                   Class.forName(prop.getProperty("DRIVER"));
                   
                   String dbcPw=prop.getProperty("Pw");
                  
                   if(dbcPw.startsWith("ENC("))
           			{
                	String separator =")";
           			String s=dbcPw.substring(4);
           			int sepPos = s.lastIndexOf(separator);
           			String lc=s.substring(0,sepPos);
           			decPw=encryptor.decrypt(lc);
           			}
                   if(!dbcPw.startsWith("ENC("))
                   {               	
                	   decPw=dbcPw;
                	   
                   }
                   this.connection= DriverManager.getConnection(prop.getProperty("URL")+prop.getProperty("DATABASENAME"),prop.getProperty("USERNAME"),decPw);
                   
		} catch (Exception e) {
System.out.println(e.getMessage());
}
		
		
}
public  DBconnection(boolean create_db_Flag) throws ClassNotFoundException, SQLException{
	StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
	EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
	config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
	config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
	encryptor.setConfig(config);
	encryptor.setKeyObtentionIterations(1000);
	String decPw=null;
	try {
	 
	  ClassLoader loader = Thread.currentThread().getContextClassLoader();
	  Properties prop = new Properties();
	  String workingDir = System.getProperty("user.dir");
	  InputStream resourceStream = (InputStream) loader.getResourceAsStream("Configuration.properties");
	
	       prop.load(resourceStream);
	       resourceStream.close();
	       Class.forName(prop.getProperty("DRIVER"));
	       
	       String dbcPw=prop.getProperty("Pw");
	      
	       if(dbcPw.startsWith("ENC("))
				{
	    	String separator =")";
				String s=dbcPw.substring(4);
				int sepPos = s.lastIndexOf(separator);
				String lc=s.substring(0,sepPos);
				decPw=encryptor.decrypt(lc);
				}
	       if(!dbcPw.startsWith("ENC("))
	       {               	
	    	   decPw=dbcPw;
	    	   
	       }
	       this.connection= DriverManager.getConnection(prop.getProperty("URL"),prop.getProperty("USERNAME"),decPw);
	       
	}
	
	catch (Exception e) {
	System.out.println(e.getMessage());
	}
	
}
public Connection getConnection(){
return this.connection;
}

protected void finalize() throws Throwable {
	   System.out.println("Db connection closed.");
	   this.connection.close();
	}
}