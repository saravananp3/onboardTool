package IntakeDetails.IntakeApproval.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.simplejavamail.email.Email;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import IntakeDetails.IntakeApproval.service.intakeMailApprovalService;
@WebServlet("/intakeMailApproval")
public class intakeMailApproval extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String oppId = (String)details.getAttribute("ID");
		String appName = (String)details.getAttribute("SelectedOpportunity");
		boolean check = false;
		try {
			intakeMailApprovalService intakeService = new intakeMailApprovalService(oppId,appName);
			check = intakeService.getUserListAndSendApprovalMail();
			intakeService=null;
		    System.gc();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("checkStatus",check);
		String json = new Gson().toJson(jsonObj);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(json);
	}
}
