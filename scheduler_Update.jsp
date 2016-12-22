<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>

<%
	String userid =  (String)session.getAttribute("userID");
	String username =  (String)session.getAttribute("userName");
	String userimg = (String)session.getAttribute("userImg");
	String no = request.getParameter("number");
	String time = null;
	String hour = null;
	String minute = null;
	String title = null;
	String content = null;
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>

<%
	Connection conn = null;                     
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String url = "jdbc:mysql://127.0.0.1:3306/se";        
		String dbid = "root";                                       
		String dbpw = "rkdud723";      
			
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbid,dbpw);			
		String sql = "SELECT * FROM schedule";  
		pstmt = conn.prepareStatement(sql);                
		rs = pstmt.executeQuery();
		while(rs.next()){
			int scheduleNumber = rs.getInt("no");
			if(scheduleNumber == Integer.parseInt(no)){
				time = rs.getString("scheduleTime");
				hour = time.substring(0, 2);
				minute = time.substring(3, 5);
				title = rs.getString("title");
				content = rs.getString("content");
			}
		}
		}catch(Exception e){                               
			e.printStackTrace();
			out.println("schedule 테이블 호출에 실패했습니다.");
		}finally{                                       
			if(rs != null) try{rs.close();}catch(SQLException sqle){}    
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scheduler_Update</title>
	<link rel=stylesheet href="initStyle.css"/>
	<link rel=stylesheet href="mainViewStyle.css"/>
<script>
function schdulerUpdate_check(){
	if(document.form.title.value == ""){
		alert("제목을 입력해주세요");
		document.form.title.focus();
		return false;
	}
	else if(document.form.content.value == ""){
		alert("내용을 입력해주세요");
		document.form.content.focus();
		return false;
	}
	else{
		document.form.submit();
	}
}
function onLogout() {
	if (confirm("로그아웃 하시겠습니까?")) {
		location.href="index.jsp";
	}
}
</script>
</head>
<body>
	<% 
	String formId = (String)session.getAttribute("userId");
	String formName = null;
	String formEmail = null;
	String formImage = null;
	
	conn = null;		
	pstmt = null;
	rs = null;
	
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
				formName = rs.getString(3);
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
			<div id="profile">
				<form id="profileForm" action="userUpdate.jsp" method="post">
					<img src="<%=formImage %>"></img>
					<table>
						<tr>
							<td>ID </td>
							<td><%=formId %></td>
						</tr>
						<tr>
							<td>NAME </td>
							<td><%=formName %></td>
						</tr>
						<tr>
							<td>EMAIL </td>
							<td><%=formEmail %></td>
						</tr>
					</table>
					<input type="submit" value="EDIT"/>
					<input type="button" value="LOGOUT" onclick="onLogout()"/>
				</form>
			</div>
        </aside>
		<section id="mainSection">
			<section id="menu" style="margin-bottom:10%">
				<ul>
					<li id="phoneBookMenu"><a href="phoneBook.jsp">PhoneBook</a></li>
					<li id="scheduleMenu"><a href="scheduler.jsp?year=<%=year%>&month=<%=month%>">Schedule</a></li>
				</ul>
 			</section>
            <form id="Updateform" action="scheduler_UpdateProcess.jsp" onsubmit="return schdulerUpdate_check();">
            <table id="review_table">
            	<tr>
					<td width="80" height="30">시간</td>
					<td><input type="text" name="number" size="40" value="<%=no%>" style="display:none;"/><input type="text" name="hour" size="40" value="<%=hour%>"/>시 <input type="text" name="minute" size="40" value="<%=minute%>"/>분</td>
				</tr>
				<tr>
					<td width="80" height="30">제목</td>
					<td><input type="text" name="title" size="105" value="<%=title%>"/></td>
				</tr>
				<tr>
					<td width="80" height="30">내용</td>
					<td><textarea rows="7" cols="80" name="content"><%=content%></textarea></td>
				</tr>
			</table>
			<input type="submit" value="수정완료" name="submitbtn">
			<input type="reset" value="취소" name="resetbtn" OnClick="javascript:history.back(-1)">
            </form>
        </section>
    </div>
</body>
</html>