<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
    			
<html>
<head><title>scheduler_AddProcess</title></head>
<body>
<%
//String userid = (String)session.getAttribute("userID");
String userid = "aaa";
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
String viewPageURI = null;
%>
<%
request.setCharacterEncoding("utf-8");
Connection conn = null;                     
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbid = "root";                                       
	String dbpw = "rkdud723";      
		
	Class.forName("com.mysql.jdbc.Driver");            
	conn=DriverManager.getConnection(url,dbid,dbpw);
	String sql = "INSERT INTO Schedule(userID,title,content,scheduleDate,scheduleTime) values(?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setDate(4, scheduleDate);
	pstmt.setString(5, time);
	pstmt.executeUpdate();
	viewPageURI = "schedulerView.jsp?&year=" + year + "&month=" + month + "&day=" + day;
	}catch(Exception e){                               
		e.printStackTrace();
		out.println("schedule 테이블 호출에 실패했습니다.");
	}finally{                                       
		if(rs != null) try{rs.close();}catch(SQLException sqle){}    
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}
%>
<%
response.sendRedirect("schedulerView.jsp?&year=" + year + "&month=" + month + "&day=" + day);
%>
</body>
</html>