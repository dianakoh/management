<%@ page import="java.sql.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scheduler_UpdateProcess</title>
</head>
<body>
<%
String no = request.getParameter("number");
String userid = (String)session.getAttribute("userID");
String hour = request.getParameter("hour");
String minute = request.getParameter("minute");
String title = request.getParameter("title");
String content = request.getParameter("content");
String year = (String)session.getAttribute("Year");
String month = (String)session.getAttribute("Month");
String day = (String)session.getAttribute("Day");
String time = hour + ":" + minute;
String schedule = year + "-" +  month + "-" + day;
Date scheduleDate = Date.valueOf(schedule);
int scheduleNumber = 0;
%>

<%
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	String viewPageURI = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbuser = "root";                                       
	String dbpass = "rkdud723"; 
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "UPDATE schedule SET scheduleTime=?, title=?, content=? where no=?";      
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, time);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setInt(4, Integer.parseInt(no));
		pstmt.executeUpdate();	
	}catch(SQLException ex){		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>
<%
response.sendRedirect("schedulerView.jsp?&year=" + year + "&month=" + month + "&day=" + day);
%>

</body>
</html>