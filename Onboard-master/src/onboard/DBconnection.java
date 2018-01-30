package onboard;

import java.io.BufferedReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBconnection{

	private Connection connection;
	
	public  DBconnection() throws ClassNotFoundException, SQLException{
		try {
			Properties prop = new Properties();
			File file = new File("C:\\my_project\\Onboard-master_latest\\Onboard-master\\src\\Configuration.properties");
                   FileInputStream fn = new FileInputStream(file);
                   prop.load(fn);
                   Class.forName(prop.getProperty("DRIVER"));
                   this.connection= DriverManager.getConnection(prop.getProperty("URL")+prop.getProperty("DATABASENAME"),prop.getProperty("USERNAME"),prop.getProperty("PASSWORD"));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
			}
	
	public Connection getConnection(){
		return this.connection;
	}
}