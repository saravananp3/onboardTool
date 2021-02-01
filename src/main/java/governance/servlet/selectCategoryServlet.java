package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.service.selectCategory;
@WebServlet("/selectCategoryServlet")
public class selectCategoryServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String operation = request.getParameter("operation");
     JsonArray jsonArray = getSelectCategoryOperation(operation);
     String json = new Gson().toJson(jsonArray);
     response.setContentType("application/json");
     response.setCharacterEncoding("UTF-8");
     response.getWriter().write(json);
	}
	
	private JsonArray getSelectCategoryOperation(String selectOperation)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			switch(selectOperation)
			{
				case "WAVE_OPTIONS":
					selectCategory category = new selectCategory();
					jsonArray = category.WavesDropdown();
					category = null;
					System.gc();
					break;
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}

}
