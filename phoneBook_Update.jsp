<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Date"%>

<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;


String _year = request.getParameter("year");
String _month = request.getParameter("month");

if(_year != null)
    year = Integer.parseInt(_year);

if(_month != null)
    month = Integer.parseInt(_month);

now.set(year, month-1, 1);    //출력할 년도, 월로 설정

year = now.get(Calendar.YEAR);    //변화된 년, 월
month = now.get(Calendar.MONTH) + 1;

int end = now.getActualMaximum(Calendar.DAY_OF_MONTH);    //해당월의 마지막 날짜
int w = now.get(Calendar.DAY_OF_WEEK);    //1~7(일~토)

	String userid =  (String)session.getAttribute("userID");
	String username =  (String)session.getAttribute("userName");
	String userimg = (String)session.getAttribute("userImg");
	String no = request.getParameter("number");
	String userName = null;
	String userPhone = null;
	String userBirth = null;
	String userEmail = null;
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
		String sql = "SELECT * FROM phonebook";  
		pstmt = conn.prepareStatement(sql);                
		rs = pstmt.executeQuery();
		while(rs.next()){
			int phonebookNumber = rs.getInt("no");
			if(phonebookNumber == Integer.parseInt(no)){
				userName = rs.getString("name");
				userPhone = rs.getString("phone");
				userBirth = rs.getString("birth");
				userEmail = rs.getString("email");
			}
		}
		}catch(Exception e){                               
			e.printStackTrace();
			out.println("phonebook 테이블 호출에 실패했습니다.");
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
<link rel=stylesheet href="initStyle.css" />
<link rel=stylesheet href="mainViewStyle.css" />
<script>
function phoneBookUpdate_check(){
	if(document.form.name.value == ""){
		alert("이름을 입력해주세요");
		document.form.name.focus();
		return false;
	}
	else if(document.form.phone.value == ""){
		alert("전화번호를 입력해주세요");
		document.phone.content.focus();
		return false;
	}
	else if(document.form.birth.value == ""){
		alert("생년월일를 입력해주세요");
		document.phone.content.focus();
		return false;
	}
	else if(document.form.email.value == ""){
		alert("이메일을 입력해주세요");
		document.email.content.focus();
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
				<form id="profileForm" action="user_Update.jsp" method="post">
					<img src="<%=formImage %>"></img>
					<table>
						<tr>
							<td>ID</td>
							<td><%=formId %></td>
						</tr>
						<tr>
							<td>NAME</td>
							<td><%=formName %></td>
						</tr>
						<tr>
							<td>EMAIL</td>
							<td><%=formEmail %></td>
						</tr>
					</table>
					<input type="submit" value="EDIT" /> 
					<input type="button" value="LOGOUT" onclick="onLogout()" />
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
			<form id="phoneBookUpdateform" action="phoneBook_UpdateProcess.jsp" onsubmit="return phoneBookUpdate_check();">
				<table border='2'>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="user_name" value="<%=userName%>"/>
							<input type="text" name="number" size="40" value="<%=no%>" style="display: none;"/>
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input type='text' size='20' name="user_phone" value="<%=userPhone%>" />
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<input type='text' size='20' name="user_birth" value="<%=userBirth%>" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type='text' size='20' name="user_email" value="<%=userEmail%>" />
						</td>
					</tr>
				</table>
				<input type="submit" value="저장"> 
				<input type="reset" value="취소" name="resetbtn" OnClick="javascript:history.back(-1)">
			</form>
		</section>
	</div>
</body>
</html>