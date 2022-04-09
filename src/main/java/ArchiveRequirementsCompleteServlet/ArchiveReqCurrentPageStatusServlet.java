package ArchiveRequirementsCompleteServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
@WebServlet("/ArchiveReqCurrentPageStatusServlet")
public class ArchiveReqCurrentPageStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArchiveReqCurrentPageStatusServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession details = request.getSession();
		String id = (String) details.getAttribute("ID");
		
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObject = new JsonObject();
		ArchiveReqCompleteService archiveReqCompleteService = new ArchiveReqCompleteService();
		jsonObject=archiveReqCompleteService.getCurrentPage(id);
		System.out.println("CurrentPage    :  "+jsonObject+"  Id : "+id);
		String json = new Gson().toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}


}
