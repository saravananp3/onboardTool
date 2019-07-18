package DecommManager.servlet;

import onboard.DBconnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/DecommManageSerCatCheckDtRetrieveSaveServlet")
public class DecommManageSerCatCheckDtRetrieveSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname = request.getParameter("ApplicationName");
        String projectname = request.getParameter("ProjectName");

        String others_value = "";
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        String select_query = "select * from decomm_manage_service_categories_checklist where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and type = 'Others' ";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(select_query);
        if(rs.next()){
            others_value = rs.getString("value");
        }
        String arr_value[] = others_value.split(",");
        for (int i=0; i<arr_value.length; i++){
            String remove_space = arr_value[i].replace(" ","");
            String dev_value = request.getParameter(remove_space+"_dev");
            String test_value = request.getParameter(remove_space+"_test");
            String stage_value = request.getParameter(remove_space+"_stage");
            String prod_value = request.getParameter(remove_space+"_prod");

            String update_query = "update decomm_manage_service_categories_checklist_others set dev=?, test=?, stage=?, prod=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and others = '"+arr_value[i]+"' ";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, dev_value);
            preparedStmt1.setString(2, test_value);
            preparedStmt1.setString(3, stage_value);
            preparedStmt1.setString(4, prod_value);
            preparedStmt1.execute();
        }

    }
    catch(Exception e){
        System.out.println("Exception--->>>"+e);
    }
        //response.sendRedirect("DecommManageKeyMileStone.jsp?appname="+applicationname+"&projectname="+projectname);
        RequestDispatcher rd = request.getRequestDispatcher("DecommManageKeyMileStoneTableServlet");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
