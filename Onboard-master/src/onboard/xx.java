package onboard;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

class Show
{
String  name, mem_ass, date;
int seq_num, level;
	Show(int seq_num,int level,String name,String date){
		this.seq_num=seq_num;
		this.level=level;
		this.name=name;
		this.date=date;
		
		
	}
	
}

public class xx {
	public static void main(String s[]){
	 try
   {
		 String pls="20180608";
		 int level1=0,level=0,seq=0;
		 int sno=0;
     String myDriver = "org.gjt.mm.mysql.Driver";
     String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
     Class.forName(myDriver);
     Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
     String query = "select * from archive_exec order by seq_num";
     Statement st = conn.createStatement();
     ResultSet rs = st.executeQuery(query);
     Show[] sh=new Show[100];
     int i=0,index=0;
     while(rs.next())
     {    	  
  	   sh[i++]=new Show(Integer.parseInt(rs.getString(1)),Integer.parseInt(rs.getString(2)),rs.getString(3),rs.getString(4));
     }
     
     for(int n=0;n<i;n++)
	   {
	   System.out.println("BEFORE "+sh[n].seq_num+"  "+sh[n].level+"  "+sh[n].name+"  "+sh[n].date);
	   }
   
     
     for(int j=0;j<i;j++)
     {
  	   if (sh[j].name.equals("Update AIR and Load in Box"))
  	   {
  		   level=sh[j].level;
  		   seq=sh[j].seq_num;
  		   index=j;
  		   level1=level;
  		   System.out.println("seq no"+seq+"level1 : "+level1);
  		   for(int k=index-1;k>=0;k--)
  		   {
  			//   System.out.println("Inner loop level1 : "+level1);
  			   //System.out.println("seq "+k);
  			   if (sh[k].level==0)
  			   {
  				   break;
  			   }
  			   else if (sh[k].level>=level1)
  			   {
  				   System.out.println("continue");
  				   continue;
  				   
  			   }
  			   else
  			   {
  				   System.out.println("seqnumber :"+k+"  "+level1);
  				   sh[k].date=pls;
  				   level1=level1-1;
  				 System.out.println("updated level :"+level1);
  				   
  			   }
  		   }
  	   }
  	   
  	   
     }
     
     for(int n=0;n<i;n++)
	   {
	   System.out.println(sh[n].seq_num+"  "+sh[n].level+"  "+sh[n].name+"  "+sh[n].date);
	   }
	   System.out.println("\n\n");
    System.out.println("name : "+ sh[10].name);
     //System.out.println("level1 : "+ level1);
   }
   catch (Exception e)
   {
   	 
     System.err.println("Got an exception!");
     System.err.println(e.getMessage());
   }
   
	}
}
