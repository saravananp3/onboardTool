package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class governanceDeleteService {
	DBconnection dBconnection;
	Connection con;
	int seqNum;
	public governanceDeleteService(int seqNum) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
	     this.seqNum = seqNum;
	}
	
	public boolean DeleteService()
	{
		boolean deleteStatus = false;
		try
		{
		int seqmax = 0;
		ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
		ArrayList<String> arr_id = new ArrayList<String>();
		ArrayList<String> arr_wave = new ArrayList<String>();
		ArrayList<String> arr_prj = new ArrayList<String>();
		ArrayList<String> arr_options = new ArrayList<String>();
		ArrayList<String> arr_label_name = new ArrayList<String>();
		ArrayList<String> arr_column_name = new ArrayList<String>();
		ArrayList<String> arr_type = new ArrayList<String>();
		ArrayList<String> arr_mandatory = new ArrayList<String>();
		ArrayList<String> arr_value = new ArrayList<String>();

		ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
		ArrayList<String> arr_id_split = new ArrayList<String>();
		ArrayList<String> arr_wave_split = new ArrayList<String>();
		ArrayList<String> arr_prj_split = new ArrayList<String>();
		ArrayList<String> arr_options_split = new ArrayList<String>();
		ArrayList<String> arr_label_name_split = new ArrayList<String>();
		ArrayList<String> arr_column_name_split = new ArrayList<String>();
		ArrayList<String> arr_type_split = new ArrayList<String>();
		ArrayList<String> arr_mandatory_split = new ArrayList<String>();
		ArrayList<String> arr_value_split = new ArrayList<String>();

		String select_query = "select max(seq_no) from governance_info_details  order by seq_no;";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(select_query);
		if (rs.next()) {
			seqmax = Integer.parseInt(rs.getString(1));
		}
        st.close();
        rs.close();
		String query = "select * from governance_info_details order by seq_no;";
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(query);
		while (rs1.next()) {
			arr_seqmax.add(rs1.getInt(1));
			arr_id.add(rs1.getString(2));
			arr_wave.add(rs1.getString(3));
			arr_prj.add(rs1.getString(4));
			arr_options.add(rs1.getString(5));
			arr_label_name.add(rs1.getString(6));
			arr_column_name.add(rs1.getString(7));
			arr_type.add(rs1.getString(8));
			arr_mandatory.add(rs1.getString(9));
			arr_value.add(rs1.getString(10));
		}
         st1.close();
         rs1.close();
		for (int i = 0; i < seqmax; i++) {
			if (arr_seqmax.get(i) < seqNum) {
				arr_seqmax_split.add(arr_seqmax.get(i));
				arr_id_split.add(arr_id.get(i));
				arr_wave_split.add(arr_wave.get(i));
				arr_prj_split.add(arr_prj.get(i));
				arr_options_split.add(arr_options.get(i));
				arr_label_name_split.add(arr_label_name.get(i));
				arr_column_name_split.add(arr_column_name.get(i));
				arr_type_split.add(arr_type.get(i));
				arr_mandatory_split.add(arr_mandatory.get(i));
				arr_value_split.add(arr_value.get(i));
			} else if (arr_seqmax.get(i) > seqNum) {
				arr_seqmax_split.add((arr_seqmax.get(i) - 1));
				arr_id_split.add(arr_id.get(i));
				arr_wave_split.add(arr_wave.get(i));
				arr_prj_split.add(arr_prj.get(i));
				arr_options_split.add(arr_options.get(i));
				arr_label_name_split.add(arr_label_name.get(i));
				arr_column_name_split.add(arr_column_name.get(i));
				arr_type_split.add(arr_type.get(i));
				arr_mandatory_split.add(arr_mandatory.get(i));
				arr_value_split.add(arr_value.get(i));
			}
		}

		String delete_query = "delete from governance_info_details;";
		Statement st2 = con.createStatement();
		st2.executeUpdate(delete_query);
		st2.close();
		for (int j = 0; j < seqmax - 1; j++) {
			String insert_query = "insert into governance_info_details (seq_no,waveId,waveName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
			preparedStatement1.setInt(1, arr_seqmax_split.get(j));
			preparedStatement1.setString(2, arr_id_split.get(j));
			preparedStatement1.setString(3, arr_wave_split.get(j));
			preparedStatement1.setString(4, arr_prj_split.get(j));
			preparedStatement1.setString(5, arr_options_split.get(j));
			preparedStatement1.setString(6, arr_label_name_split.get(j));
			preparedStatement1.setString(7, arr_column_name_split.get(j));
			preparedStatement1.setString(8, arr_type_split.get(j));
			preparedStatement1.setString(9, arr_mandatory_split.get(j));
			preparedStatement1.setString(10, arr_value_split.get(j));
			preparedStatement1.execute();
			preparedStatement1.close();
		}
		OrderingColumnNameBySeq();
     	deleteStatus=true;
	  }
		catch(Exception e)
		{
			e.printStackTrace();
		}
     return deleteStatus;
	}
	
	public void OrderingColumnNameBySeq()
    {
  	  
  		  try {
  		  
     	      String SelectQuery ="Select * from governance_Info_details order by seq_no";
     	      Statement st = con.createStatement();
     	      ResultSet rs = st.executeQuery(SelectQuery);
     	      String startStr = "GovernanceAddInfo";
     	      while(rs.next())
     	      {
     	    	  if(rs.getString("column_name").startsWith("GovernanceAddInfo"))
     	    	  {
     	    		  String seqnum = rs.getString("seq_no");
     	    		  String column_name = rs.getString("column_name");
     	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
     	    		  if(!seqnum.equals(append_seq_num))
     	    		  {
     	    			String updateColumnName = startStr+seqnum;
     	    			String UpdateQuery = "Update governance_Info_details set column_name ='"+updateColumnName+"' where seq_no='"+seqnum+"';";  
     	    			Statement st1 = con.createStatement();
     	       	        st1.executeUpdate(UpdateQuery);
     	       	        st1.close();
     	    		  }
     	    	  }
     	      }
     	      st.close();
     	      rs.close();
  
  	  }
  	  catch(Exception e)
  	  {
  		  e.printStackTrace();
  		  System.out.println("Exception-----------[info]-------"+e);
  	  }
    }
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("Db connection closed.");
	}
}
