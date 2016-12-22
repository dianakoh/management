<%@ page import="java.sql.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>phoneBook_UpdateProcess</title>
</head>
<body>
	<%
	String no = request.getParameter("number");
	String userID = (String)session.getAttribute("userId");
	String formName = request.getParameter("user_name");
	String formPhone = request.getParameter("user_phone");
	String formBirth = request.getParameter("user_birth");
	String formEmail = request.getParameter("user_email");
	int phonebookNumber = Integer.parseInt(no);
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
		
		String sql = "UPDATE phonebook SET userID=?, name=?, phone=?, birth=?, email=? where no=?";      
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, userID);
		pstmt.setString(2, formName);
		pstmt.setString(3, formPhone);
		pstmt.setString(4, formBirth);
		pstmt.setString(5, formEmail);
		pstmt.setInt(6, phonebookNumber);
		
		pstmt.executeUpdate();	
	}catch(SQLException ex){		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>
	<%
response.sendRedirect("phoneBook.jsp");
%>
</body>
</html>