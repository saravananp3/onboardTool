import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;



/**
 * Servlet implementation class date_update
 */
@WebServlet("/date_update")

public class date_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public date_update() {
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
		 try
		   {
			 
			
				 int level1=0,level=0,seq=0;
				 int sno=0;
				 Date d1,d2,d3,d4,d5,d6;
		     String myDriver = "org.gjt.mm.mysql.Driver";
		     String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
		     Class.forName(myDriver);
		     Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
		     String query = "select * from archive_exec order by seq_num";
		     Statement st = conn.createStatement();
		     ResultSet rs = st.executeQuery(query);
		     SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
		     //DateFormat d3 = new SimpleDateFormat("mm/dd/yyyy");
		     ArrayList<Integer> seq_num = new ArrayList<Integer>();
		     ArrayList<Integer> level_num = new ArrayList<Integer>();
		     ArrayList<String> task_name = new ArrayList<String>();
		     ArrayList<String> member_ass = new ArrayList<String>();
		    ArrayList<String> plan_startdate = new ArrayList<String>();
		     ArrayList<String> plan_enddate = new ArrayList<String>();
		     ArrayList<String> actual_startdate = new ArrayList<String>();
		     ArrayList<String> actual_enddate = new ArrayList<String>();
		     ArrayList<String> planned_hours = new ArrayList<String>();
		     ArrayList<String> actual_hours = new ArrayList<String>();
		     String temp;
		     int i=0,index=0;
		     while(rs.next())
		     {    	  
		  	  seq_num.add(rs.getInt(1));
		  	level_num.add(rs.getInt(2));
		  	task_name.add(rs.getString(3));
		  	member_ass.add(rs.getString(4));
		  	plan_startdate.add(rs.getString(7));
		  	plan_enddate.add(rs.getString(8));
		  	actual_startdate.add(rs.getString(5));
		  	actual_enddate.add(rs.getString(6));
		  	planned_hours.add(rs.getString(13));
		  	actual_hours.add(rs.getString(9));
		  	i++;
		     }
		     
		  String tasks_name=request.getParameter("name");
		  String sequence_no=request.getParameter("sequence_no");
		  String plan_start=request.getParameter("plan_start");
		  String plan_end=request.getParameter("plan_end");
		  String actual_start=request.getParameter("actual_start");
		  String planned_hrs=request.getParameter("plan_hrs");
		  String actual_hrs=request.getParameter("actual_hrs");
		     System.out.println("ab  "+actual_hrs);
		     for(int j=0;j<i;j++)
		     {
		  	   if (task_name.get(j).equals(tasks_name))
		  	   {
		  		   level=level_num.get(j);
		  		   seq=seq_num.get(j);
		  		   index=j;
		  		   level1=level;
		  		   System.out.println("seq no"+seq+"level1 : "+level1);
		  		 plan_startdate.set(index,plan_start);
		  		 plan_enddate.set(index,plan_end);
		  		 actual_startdate.set(index,actual_start);
		  		planned_hours.set(index,planned_hrs);
		  		actual_hours.set(index,actual_hrs);
		  		   for(int k=index-1;k>=0;k--)
		  		   {
		  			//   System.out.println("Inner loop level1 : "+level1);
		  			   //System.out.println("seq "+k);
		  			   if (level_num.get(k)==0)
		  			   {
		  				   break;
		  			   }
		  			   else if (level_num.get(k)>=level1)
		  			   {
		  				   System.out.println("continue");
		  				   continue;
		  				   
		  			   }
		  			   else
		  			   {
		  				//   System.out.println("seqnumber :"+k+"  "+level1);
		  				System.out.println("daate "+plan_start);
		  				 d1=fmt.parse(plan_start);
		  				 if(plan_startdate.get(k).equals(""))
		  					{
		  					 plan_startdate.set(k,plan_start);
		  					 System.out.println("bala murugan");
		  					}
		  				 else
		  				 {
		  				d2 = fmt.parse(plan_startdate.get(k));
		  			if(d1.compareTo(d2)<0)
		  				   {
		  					 plan_startdate.set(k,plan_start);
		  					System.out.println("min Date.. "+d1);
		  				   }
		  				 }
	  				d3=fmt.parse(plan_end);
	  				if(plan_enddate.get(k).equals(""))
	  				{
	  					plan_enddate.set(k,plan_end);
	  				}
	  				else{
	  				 d4 = fmt.parse(plan_enddate.get(k));
		  				 if(d3.compareTo(d4)>0)
		  				   {
		  					 plan_enddate.set(k,plan_end);
		  					System.out.println("max Date.. "+d3);
		  				   }
	  				}
		  				d5=fmt.parse(actual_start);
		  				if(actual_startdate.get(k).equals(""))
		  				{
		  					actual_startdate.set(k,actual_start);
		  				}
		  				else{
		  				 d6 = fmt.parse(actual_startdate.get(k));
		  				 if(d5.compareTo(d6)<0)
		  				   {
		  					 actual_startdate.set(k,actual_start);
		  					System.out.println(" actual Date.. "+d5);
		  				   }
		  				}
		  				
		  				   
		  				  
		  				   
		  				   level1=level1-1;
		  				// System.out.println("updated level :"+level1);
		  				   
		  			   }
		  		   }
		  	   }
		  	   
		  	   
		     }
		     
		     for(int n=0;n<i;n++)
			   {
			 //  System.out.println(seq_num.get(n)+"  "+level_num.get(n)+"  "+task_name.get(n)+"  "+plan_startdate.get(n)+" "+plan_enddate.get(n)+" "+actual_startdate.get(n));
			 
		    	 st.executeUpdate("update archive_exec set act_srt_date='"+actual_startdate.get(n)+"',pln_srt_date='"+plan_startdate.get(n)+"',pln_end_date='"+plan_enddate.get(n)+"',planned_hrs='"+planned_hours.get(n)+"',hours='"+actual_hours.get(n)+"'where seq_num='"+seq_num.get(n)+"'");
 // System.out.println("update archive_exec set act_srt_date='"+actual_startdate.get(n)+"',pln_srt_date='"+plan_startdate.get(n)+"',pln_end_date='"+plan_enddate.get(n)+"',planned_hrs='"+planned_hours.get(n)+"',hours='"+actual_hours.get(n)+"'where seq_num='"+seq_num.get(n)+"'");
  
			   }

		   }
		   catch (Exception e)
		   {
		   	 
		     System.err.println("Got an exception!");
		     System.err.println(e.getMessage());
		   }
		 response.sendRedirect("archive_exec_samp.jsp");

	}

}
