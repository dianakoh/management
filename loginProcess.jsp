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
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbid = "root";                                       
	String dbpw = "rkdud723";   
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, dbid, dbpw);
		
		String sql = "select * from users";
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