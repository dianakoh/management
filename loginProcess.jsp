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
	String formId = request.getParameter("formId");
	String formPassword = request.getParameter("formPassword");
	boolean log = false;
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbId = "root";                                       
	String dbPassword = "rkdud723";   
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, dbId, dbPassword);
		
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
		session.setAttribute("userId", formId);
		%>
		<script>
			location.href="phoneBook.jsp";
		</script>
		<%
	}
	else %>
		<script>
			history.go(-1);
		</script>
</body>
</html>