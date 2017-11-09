package onboard;

import java.util.HashMap;

public class xx {

 public static void main(String args[]){
String roles="ArchivalAdmin";
	 
System.out.println("bal");
	 HashMap<String,String> hm=new HashMap<String,String>(); 
		hm.put("Admin","XXXXXXXX");
		hm.put("ArchivalAdmin","XXXXXXRR");
		hm.put("LegacyProgramManager","NXXRRNNN");
		
		System.out.println(hm.get(roles));

 }
}