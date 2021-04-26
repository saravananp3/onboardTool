package governance.wave.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.wave.service.waveListService;

@WebServlet("/waveListServlet")

public class waveListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession details = request.getSession();
      
      String phaseId = (String)details.getAttribute("phaseId");
      
      String phaseName = (String)details.getAttribute("phaseName");
      
      JsonArray jsonArray = new JsonArray();
      try
      {
    	  waveListService service = new waveListService(phaseId,phaseName);
    	  
    	  jsonArray = service.getWaveList();
    	  
    	  System.gc();
      }
      catch(Exception e)
      {
    	  e.printStackTrace();
      }
      
      String json = new Gson().toJson(jsonArray);
	     
	     response.setContentType("application/json");
	     
	     response.setCharacterEncoding("UTF-8");
	     
	     response.getWriter().write(json);
	}
}
