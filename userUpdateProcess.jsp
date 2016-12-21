<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>USER MANAGEMENT</title>
</head>
<body>
	<%
	String formId = "aaa";//(String)session.getAttribute("userId");
	String formPassword = request.getParameter("formPassword");
	String formName = request.getParameter("formName");
	String formBirth = request.getParameter("formBirth");
	String formEmail = request.getParameter("formEmail");
	String formImage = request.getParameter("formImage");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbId = "root";                                       
	String dbPassword = "rkdud723";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");            
		conn = DriverManager.getConnection(url, dbId, dbPassword);
		
		String sql = "update users set pw=?, name=?, birth=?, email=?, img=? where id=?";     
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, formPassword);
		pstmt.setString(2, formName);
		pstmt.setString(3, formBirth);
		pstmt.setString(4, formEmail);
		pstmt.setString(5, formImage);
		pstmt.setString(6, formId);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	} catch (SQLException ex) {}
	
	pageContext.forward("phoneBook.jsp");
	%>
</body>
</html>