<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <body style='margin:30px'>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
 
 
<%
try {
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
 
String query1 = "select * from app_prior";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
 
%>
 
<div bgcolor='#e4e4e4' text='#ff6633' link='#666666' vlink='#666666' alink='#ff6633' style='font-family:Arial,Helvetica,sans-serif;'>
    <table background='' bgcolor='#e4e4e4' width='100%' style='padding:20px 0 20px 0' cellspacing='0' border='0' align='center' cellpadding='0'>
             <tbody>
                 <tr>
                           <td>
                                 <table width='620' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF' style='border-radius: 5px;'>
                                        <tbody>
                                              
                                               <tr>
                                                     <td valign='top' style='color:#404041;line-height:16px;padding:25px 20px 0px 20px'>
                                                            <p>
                                                                   <section style='position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;'>
                                                                         <h3 align='center' style='margin-top: -12px;background-color: #FFF;clear: both;width: 180px;margin-right: auto;margin-left: auto;padding-left: 15px;padding-right: 15px; font-family: arial,sans-serif;'>
                                                                                <span>Review</span>
                                                                         </h3>
                                                                   </section>
                                                            </p>               
                                                     </td>
                                               </tr>
                                               <tr align='left' >
                                                     <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                     <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Application Details</h2></span>
                                                           
                                                            <table width='0' border='0' align='left' cellpadding='0' cellspacing='0'>
                                                           
                                                                  <br>
                                                                   <tbody>
                                                                   <tr>
                                                                     <%
          
while(rs1.next()){

%>

        <tr>
        
         <tr class="edit_row">  <pre style="font-family:verdana;font-size:125%;">Application Name       : <strong align="right"><%=rs1.getString("proj_name") %></strong></pre></tr> 
          <tr class="row_s"> <pre style="font-family:verdana;font-size:125%;">Complexity               :  <strong><%=rs1.getString("complexity") %></strong></pre></tr>
          <tr class="row_t">    <pre style="font-family:verdana;font-size:125%;">Read Only Date         : <strong><%=rs1.getString("read_date") %></strong></pre></tr> 
          <tr class="row_d">    <pre style="font-family:verdana;font-size:125%;">SME Date                 : <strong><%=rs1.getString("sme_date") %></strong></pre></tr> 
           <tr class="row_d">   <pre style="font-family:verdana;font-size:125%;">Estimated DB Size      : <strong><%=rs1.getString("est_db_size") %></strong></pre></tr><br />
           
           <br />
       
         
        </tr>
        <% } 
        
	
        %>
    
                                                                   
                                                                         </tr>
                                                                                             </tbody>
                                                            </table>
                                                                                                         
                                                           
                                                     </td>
                                                    
                                               </tr>
                                       
                                               <tr>
                                                                                                                                                    
                                                                                                                                                 
                                                                                                          <tr>
                                                                                                       
                                              
                                        </tbody>
                                 </table>
                           </td>
                    </tr>
             </tbody>
       </table>
      
</div>
      
        <%

                                                                 
}
catch(Exception e){}
%>