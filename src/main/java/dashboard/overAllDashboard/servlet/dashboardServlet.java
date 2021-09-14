package dashboard.overAllDashboard.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import dashboard.overAllDashboard.service.dashboardGanttChartService;
import dashboard.overAllDashboard.service.dashboardService;

@WebServlet("/dashboardServlet")

public class dashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonArray jsonArray =  new JsonArray();
		
		try {
			
			dashboardService dashboard = new dashboardService();
			
			jsonArray.add(dashboard.dashboardCardDetails());
			jsonArray.add(dashboard.donetChartDetails());
			jsonArray.add(dashboard.getOppNameList());
			jsonArray.add(dashboard.GanttChartJsonArray);
			jsonArray.add(dashboard.getApplicationFromPhaseDataTable("All"));
			jsonArray.add(dashboard.getPieChartDetails());
			dashboard = null;
			System.gc();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
		
	}

}
