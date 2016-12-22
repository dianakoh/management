<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String number = request.getParameter("number");
String formName = request.getParameter("user_name");
String formPhone = request.getParameter("user_phone");
String formBirth = request.getParameter("user_birth");
String formEmail = request.getParameter("user_email");

int phoneBookNumber = Integer.parseInt(number);%>
<html>
<head><title>scheduler_Delete</title></head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	String viewPageURI = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/se";        
	String dbuser = "root";                                       
	String dbpass = "rkdud723"; 
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "DELETE FROM phonebook where no = ?";      
		pstmt = conn.prepareStatement(sql); 
		pstmt.setInt(1, phoneBookNumber);
		pstmt.executeUpdate();
		pstmt.executeUpdate("update phonebook set no=no-1 where no > "+phoneBookNumber+"");
		%>
		삭제 처리 완료 <br/>
		<%
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
</html>>