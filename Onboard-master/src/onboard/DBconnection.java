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
<<<<<<< HEAD
			File file = new File("C:\\onboardng\\onboardTool\\Onboard-master\\src\\Configuration.properties");
=======
			File file = new File("C:\\on\\Onboard-master\\src\\Configuration.properties");
>>>>>>> 910c9ad7ace7ddefe381023b7a459be84935d576
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