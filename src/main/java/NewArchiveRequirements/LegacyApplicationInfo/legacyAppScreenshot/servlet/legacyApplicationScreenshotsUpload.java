package NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import onboard.DBconnection;

import java.util.List;
import java.util.Properties;

/**
 * Servlet implementation class legacyApplicationScreenshotsUpload
 */
@WebServlet("/legacyApplicationScreenshotsUpload")
public class legacyApplicationScreenshotsUpload extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	JsonObject jsonObj = new JsonObject();
    try
	{
	HttpSession details = request.getSession();
    String Id=(String)details.getAttribute("ID");
    Properties properties = new Properties();
    InputStream fileInput = legacyApplicationScreenshotsUpload.class
			.getResourceAsStream("/fileUpload.properties");
	properties.load(fileInput);
	fileInput.close();
	String path = properties.getProperty("FILE.REQUIREMENTS.SCREENSHOT.PATH"); 
	File directory=new File(path+File.separator+Id);
	if(!directory.exists())
		directory.mkdir();
	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
	 List<FileItem> multiFiles = sf.parseRequest(request);
	 DBconnection dBconnection = new DBconnection();
	 Connection	con = (Connection) dBconnection.getConnection();	 
	 int seq_num = 1;
	 for(FileItem item : multiFiles)
	 {
		 String selectQuery ="SELECT * FROM `Legacy_Application_Screenshot` WHERE appId='"+Id+"' and seq_num ='"+seq_num+"'";
		 Statement st = con.createStatement();
		 ResultSet rs = st.executeQuery(selectQuery);
		 if(rs.next()) {
			 String insertQuery = "UPDATE `Legacy_Application_Screenshot` SET doc = ?, File_name = ? WHERE appId = ? AND  seq_num = ?";
			 FileInputStream is  = (FileInputStream) item.getInputStream();
			 PreparedStatement pstmt = con.prepareStatement(insertQuery);
			 pstmt.setBinaryStream(1, is);
			 pstmt.setString(2, item.getName());
			 pstmt.setString(3, Id);
			 pstmt.setInt(4, seq_num++ );
			 pstmt.executeUpdate();
			 pstmt.close();
			 is.close();
		 }
		 else {
		 String insertQuery = "INSERT INTO `Legacy_Application_Screenshot` SET doc = ?, File_name = ?, seq_num = ?, appId = ?";
		 FileInputStream is  = (FileInputStream) item.getInputStream();
		 PreparedStatement pstmt = con.prepareStatement(insertQuery);
		 pstmt.setBinaryStream(1, is);
		 pstmt.setString(2, item.getName());
		 pstmt.setInt(3, seq_num++ );
		 pstmt.setString(4, Id);
		 pstmt.executeUpdate();
		 pstmt.close();
		 is.close();
		 }
		 st.close();
		 rs.close();
		 //item.write(new File(directory.getAbsolutePath()+File.separator+item.getName()));
	 }
	 System.out.println("File uploaded");
	 jsonObj.addProperty("checkFilesUpload",true);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		jsonObj.addProperty("checkFilesUpload",false);
	}
    String json = new Gson().toJson(jsonObj);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
	}
	
}
