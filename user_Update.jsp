<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>USER MANAGEMENT</title>
	<link rel=stylesheet href="initStyle.css"/>
	<link rel=stylesheet href="mainViewStyle.css"/>
	<script>
		function onUserUpdateCancel() {
			if (confirm("수정을 취소하시겠습니까?")) {
				history.go(-1);
			}
		}
	</script>
</head>
<body>
	<% 
	String formId = (String)session.getAttribute("userId");
	String formPassword = null;
	String formName = null;
	String formBirth = null;
	String formEmail = null;
	String formImage = null;
	
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
			if (rs.getString(1).equals(formId)) {
				formPassword = rs.getString(2);
				formName = rs.getString(3); 
				formBirth = rs.getString(4);
				formEmail = rs.getString(5);
				formImage = rs.getString(6);
			}
		rs.close();
		pstmt.close();
		conn.close();
	}
	catch (SQLException ex) { }
	%>
	<header id="header">
        <hgroup id="title">
            <h1>Daily Management System</h1>
        </hgroup>
    </header>
	<div id="content">
		<aside id="aside">
			<div id="profileMenu">Profile</div>
        </aside>
		<section id="mainSection">
			<section id="menu">
				<ul>
					<li id="phoneBookMenu"><a href="phoneBook.jsp">PhoneBook</a></li>
					<li id="scheduleMenu"><a href="scheduler.jsp">Schedule</a></li>
				</ul>
 			</section>
			<section id="contents">
				<form id="userUpdateForm" action="user_UpdateProcess.jsp" method="post">
					<table>
						<tr>
							<td>ID </td>
							<td><input type="text" name="formId" value="<%=formId %>" disabled/></td>
						</tr>
						<tr>
							<td>PASSWORD </td>
							<td><input type="text" name="formPassword" value="<%=formPassword %>"/></td>
						</tr>
						<tr>
							<td>NAME </td>
							<td><input type="text" name="formName" value="<%=formName %>"/></td>
						</tr>
						<tr>
							<td>BIRTH </td>
							<td><input type="text" name="formBirth" value="<%=formBirth %>"/></td>
						</tr>
						<tr>
							<td>EMAIL </td>
							<td><input type="text" name="formEmail" value="<%=formEmail %>"/></td>
						</tr>
						<tr>
							<td>IMAGE </td>
							<td><input type="text" name="formImage" value="<%=formImage %>"/></td>
						</tr>
					</table>
					<input type="submit" value="SAVE"/>
					<input type="reset" value="CANCEL" onclick="onUserUpdateCancel()"/>
				</form>
			</section>
		</section>
	</div>
</html>