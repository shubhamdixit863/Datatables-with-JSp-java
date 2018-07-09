<%@ page buffer="none" session="false" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*,java.util.*,java.io.*,java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="org.json.JSONArray,org.json.JSONException"%>
	<%@ page import="org.json.simple.JSONObject"%>
    <%@ page import="java.util.Date"%>
<%

ArrayList<String> list = new ArrayList<String>();
//json array to hold all rows

JSONArray data = new JSONArray();

int count = 0;
 JSONObject result = new JSONObject();



try{


		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/schoolproject","root", "");
				Statement stmt = conn.createStatement();


PreparedStatement ps=conn.prepareStatement("select * from staff_attendance");



      ResultSet rs = ps.executeQuery();


      while(rs.next())
	  {
	  count++;
	  //json array to hold one row ,the row adds successively in while loop
	  JSONArray ja = new JSONArray();
	  ja.put(rs.getInt("id"));
	   ja.put(rs.getInt("staff_id"));
	   ja.put(rs.getDate("date_t"));
       ja.put(rs.getInt("status"));
	   ja.put(rs.getString("comments"));
	   ja.put(rs.getInt("image"));
//inserting in main array to be displayed in front
	   data.put(ja);
	   //break;
	  //out.println(arrayObj);
      //out.println(",");



}
	  }
	  catch(Exception e){
		out.println(e);

		}

//parameters needed for datable all into jsonobject
result.put("aaData", data);
result.put("sEcho",1);
result.put("iTotalRecords",count);
result.put("iTotalDisplayRecords", count);


   out.println(result);
 out.flush();


		%>
