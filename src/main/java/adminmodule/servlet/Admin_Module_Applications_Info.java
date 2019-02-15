package adminmodule.servlet;

import adminmodule.service.Admin_Module_Service;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Admin_Module_Applications_Info")
public class Admin_Module_Applications_Info extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String proj = request.getParameter("proj");
        System.out.println("sample--->"+proj);
        try {
            HttpSession session = request.getSession();
            System.out.println("sample---- >" + proj);
            proj=proj.replaceAll("\"","'").replaceAll("\\[", "").replaceAll("\\]","");
            JsonObject infojson = new Admin_Module_Service().applications_info(proj);
            String json = new Gson().toJson(infojson);
            System.out.println("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            System.out.println("system--->" + json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}
