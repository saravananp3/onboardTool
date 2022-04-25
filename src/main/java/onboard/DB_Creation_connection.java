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
 
public class DB_Creation_connection{
 
	
private Connection connection;
public  DB_Creation_connection() throws ClassNotFoundException, SQLException{
			StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
			EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
			config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
			config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
			encryptor.setConfig(config);
			encryptor.setKeyObtentionIterations(1000);
			String dec_cred=null;
		try {
             
              ClassLoader loader = Thread.currentThread().getContextClassLoader();
              Properties prop = new Properties();
              String workingDir = System.getProperty("user.dir");
              InputStream resourceStream = (InputStream) loader.getResourceAsStream("Configuration.properties");
 
                   prop.load(resourceStream);

                   Class.forName(prop.getProperty("DRIVER"));
                   
                   String db_cred=prop.getProperty("PASSWORD");
                  
                   if(db_cred.startsWith("ENC("))
           			{
                	String separator =")";
           			String s=db_cred.substring(4);
           			int sepPos = s.lastIndexOf(separator);
           			String lc=s.substring(0,sepPos);
           			dec_cred=encryptor.decrypt(lc);
           			}
                   if(!db_cred.startsWith("ENC("))
                   {               	
                	   dec_cred=db_cred;
                	   
                   }
                   this.connection= DriverManager.getConnection(prop.getProperty("URL"),prop.getProperty("USERNAME"),dec_cred);

		}
		
		catch (Exception e) {
System.out.println(e.getMessage());
}
 
}
public Connection getConnection(){
return this.connection;

}


}