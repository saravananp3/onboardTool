package onboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection{

	private Connection connection;
	
	public DBconnection() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
	}
	
	public Connection getConnection(){
		return this.connection;
	}
}