<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="onboard.DBconnection"%>
<%@page import="org.owasp.encoder.Encode" %>
<%@page import="org.apache.log4j.BasicConfigurator"%>
<%@page import="org.apache.log4j.MDC"%>
<%@page import="org.apache.log4j.Logger"%>

<%String File = request.getParameter("File_Name");%>

 <%
HttpSession details = request.getSession();
		String Id=(String)details.getAttribute("ID");
		System.out.println("File Name : "+File);
        try {
		 DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();
	        System.out.println("Connected...");
	        String selectQuery = "select AppId,File_Name,doc from legacy_application_screenshot where AppId=? and File_Name=?";
	        PreparedStatement st=connection.prepareStatement(selectQuery);
	        st.setString(1, Id);
	        st.setString(2,File);
	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            // gets file name and file blob data
	            String fileName = rs.getString("File_Name");
	            Blob blob = rs.getBlob("doc");
	            InputStream inputStream = blob.getBinaryStream();
	            int fileLength = inputStream.available();
	             
	            System.out.println("fileLength = " + fileLength);

	            ServletContext context = getServletContext();

	            // sets MIME type for the file download
	            String mimeType = context.getMimeType(fileName);
	            if (mimeType == null) {        
	                mimeType = "application/octet-stream";
	            }              
	             
	            // set content properties and header attributes for the response
	            response.setContentType(Encode.forJava(mimeType));
	            response.setContentLength(fileLength);
	            String headerKey = "Content-Disposition";
	            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
	            response.setHeader(Encode.forJava(headerKey), Encode.forHtmlContent(headerValue));

	            // writes the file to the client
	            OutputStream outStream = response.getOutputStream();
	             int BUFFER_SIZE=4096;
	            byte[] buffer = new byte[BUFFER_SIZE];
	            int bytesRead = -1;
	             
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outStream.write(buffer, 0, bytesRead);
	            }
	            
	            System.out.println("Downloaded File : "+fileName);
	            inputStream.close();
	            outStream.close();
	            connection.close();
	            response.flushBuffer();
	            } else {
	            // no file found
	            response.getWriter().print("File not found for the id: " );  
	        }
		
		
	}
        catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().print("Check Database Connection");
        } 
 
 %>
 