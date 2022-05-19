package applicationList.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ArchiveExecutionIssueRisk.ArchiveExeIssueSaveService;
import applicationList.service.applicationListService;
/**
 * Servlet implementation class applicationList
 */@WebServlet("/applicationList")
public class applicationList extends HttpServlet {
	  private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	  /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        response.getWriter().append("Served at: ").append(request.getContextPath());
	    }
	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession details = request.getSession();
			/*
			 * String OppId = (String)details.getAttribute("ID"); String id =
			 * (String)details.getAttribute("app_Id");
			 */
			/* int seq_no = Integer.parseInt(request.getParameter("seq_no"))+1; */
	        JsonArray jsonArray = new JsonArray();
	        String opportunityName  = request.getParameter("opportunityName");
	        String opportunityId  = request.getParameter("opportunityId");
	        String phase  = request.getParameter("phase");
	        String wave  = request.getParameter("wave");
	        String resource  = request.getParameter("resource");
	        JsonObject jsonObj = applicationListService.applicationListSave(opportunityName, opportunityId, phase, wave, resource);
	        jsonArray.add(jsonObj);
	        String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8"); 
	        response.getWriter().write(json);
	    }

}
