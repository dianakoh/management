<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>주소록 등록 처리</title></head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbId = "root";                                       
	String dbPassword = "rkdud723";  
	
	String userID = (String)session.getAttribute("userId");
	String formName = request.getParameter("user_name");
	String formPhone = request.getParameter("user_phone");
	String formBirth = request.getParameter("user_birth");
	String formEmail = request.getParameter("user_email");

	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn = DriverManager.getConnection(url, dbId, dbPassword);
		
		String sql = "INSERT INTO phoneBook(userID, name, phone, birth, email) values(?, ?, ?, ?, ?)";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, userID);
		pstmt.setString(2, formName);
		pstmt.setString(3, formPhone);
		pstmt.setString(4, formBirth);
		pstmt.setString(5, formEmail);
		
		pstmt.executeUpdate();
		
	}catch(SQLException ex){
		out.println("에러: "+ex);		
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