package NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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

import java.util.List;

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
	String path= "H:\\Decom3Sixty\\Screenshot\\Files\\DecommRequirements\\LegacyApplicationScreenshots";
	File directory=new File(path+File.separator+Id);
	if(!directory.exists())
		directory.mkdir();
	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
	 List<FileItem> multiFiles = sf.parseRequest(request);
	 for(FileItem item : multiFiles)
	 {
		 item.write(new File(directory.getAbsolutePath()+File.separator+item.getName()));
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
