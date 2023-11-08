package FinanceDetails.Servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import FinanceDetails.Service.EditTableDetailsService;
/**
 * Servlet implementation class Update_users_servlet
 */
@WebServlet("/EditTableDetailServlet")
public class EditTableDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTableDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
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
        // TODO Auto-generated method stub
        
        String Application_Name=request.getParameter("ApplicationName_modify");
        String ProjectNumber=request.getParameter("ProjectNumber_modify");
        String SoftwareAndLicensing=request.getParameter("Software_and_Licensing_modify");
        String ContractDate=request.getParameter("Contract_Date_Modify");
        String Scope=request.getParameter("Scope_modify");
        String Avoidance_Cost=request.getParameter("AvoidanceCost_modify");
        String Archive_Cost=request.getParameter("ArchiveCost_modify");
        String CBA=request.getParameter("CBA_modify");
        String FundingDetails=request.getParameter("Approval_modify");
        String Fundings=request.getParameter("Type_modify");
       
       System.out.println("Connected to Edit Servlet");
        //String seq_num = request.getParameter("seq_num");
       
        System.out.println("Application Name : "+Application_Name);
        System.out.println("Project Number: "+ProjectNumber);
        System.out.println("SoftwareAndLicensing: "+SoftwareAndLicensing);
        System.out.println("ContractDate: "+ContractDate);
        System.out.println("Scope_modify: "+Scope);
        System.out.println("Avoidance_Cost: "+Avoidance_Cost);
        System.out.println("Archive_Cost: "+Archive_Cost);
        System.out.println("CBA: "+CBA);
        System.out.println("FundingDetails: "+FundingDetails);
        System.out.println("Fundings Type: "+Fundings);
        
        
        JsonObject jsonObj =EditTableDetailsService.updateDetails(Application_Name, ProjectNumber, SoftwareAndLicensing, ContractDate, Scope,Avoidance_Cost, Archive_Cost,CBA,FundingDetails,Fundings);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON from Servlet"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
       
    }
}