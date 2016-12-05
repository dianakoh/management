<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>USER MANAGEMENT</title>
</head>
<body>
	<%
	String formId = request.getParameter("id");
	String formPassword = request.getParameter("pw");
	boolean log = false;
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://203.252.195.138:3306/fanpage?useSSL=false";        
	String dbuser = "";                                       
	String dbpass = "";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, dbuser, dbpass);
		
		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) 
			if (rs.getString(1).equals(formId) && rs.getString(2).equals(formPassword))
				log = true;
		rs.close();
		pstmt.close();
		conn.close();
	} 
	catch (SQLException ex) {}
	
	if (log) {
		session.setAttribute("userID", formId);
		pageContext.forward("phoneBook.jsp");
	}
	else %>
		<script>history.go(-1);</script>
</body>
</html>