package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DecommIntakeRequirementServlet")
public class DecommIntakeRequirementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        String oppName=(String)details.getAttribute("SelectedOpportunity");
        JsonObject jsonobject=new IntakeInformationService().DecommIntakeRequirementDataRetrieve(Id,oppName);
        String json = new Gson().toJson(jsonobject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
