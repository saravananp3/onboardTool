package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ContactInfoDbUpdateServlet")
public class ContactInfoDbUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String roles=request.getParameter("Roles");
    String[] roleselected=roles.split(",");
    for(int i=0;i<roleselected.length;i++)
         {
             String rolename=roleselected[i].replace("-","").replace(" ","").replace("/","");
             String username=request.getParameter(rolename+"UserName"+i);
             String email=request.getParameter(rolename+"Email"+i);
             String userid=request.getParameter(rolename+"UserId"+i);
             String contactnumber=request.getParameter(rolename+"ContactNumber"+i);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
