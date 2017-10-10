package onboard;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class xx {

 public static void main(String args[]) throws ParseException {
  List<Date> dates = new ArrayList<Date>();

  /*SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
  Date date;
  Date dateOne = fmt.parse("2017-05-06");
  Date dateTwo = fmt.parse("2001-01-06");

  dates.add(fmt.parse("2000-07-06"));
  dates.add(dateOne);
  dates.add(dateTwo);

  // Using java.util.Collections
  System.out.println("Minimum Element : "
    + fmt.format(Collections.min(dates)));

  // // Using Sort Technique of java.util.Collections
  Collections.sort(dates);
  System.out.println("Minimum Element After Sorting - "
    + fmt.format(dates.get(0)));*/
  
  String date="10/03/2017";
  SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
  Date currentdate;
  currentdate=sdf.parse(date);
  System.out.println(currentdate);

 }
}