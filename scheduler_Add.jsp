<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Date"%>

<%
	//String userid =  (String)session.getAttribute("userID");
	String userid = "testid";
	String username =  (String)session.getAttribute("userName");
	String userimg = (String)session.getAttribute("userImg");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scheduler_Add</title>
<link rel=stylesheet href="schedulerStyle.css" />
<script>
function schduleradd_check(){
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
</script>
</head>
<body>
	<header id="header"> <hgroup id="title">
	<h1>Daily Management System</h1>
	</hgroup> </header>
	<div id="content">
		<aside id="aside">
		<h3>Profile</h3>
		</aside>
		<section id="main_section"> <section class="buttons">
		<ul>
			<li id="phoneBook" onclick="location.href='phoneBook.jsp'"
				style="background: white; color: black;">PhoneBook</li>
			<li id="schedule" style="background: black; color: white;">Schedule</li>
		</ul>
		</section>
		<form id="Addform" action="scheduler_AddProcess.jsp?"
			onsubmit="return schduleradd_check();">
			<table id="review_table">
				<tr>
					<td width="80" height="30">시간</td>
					<td><input type="text" name="hour" size="40" />시 <input
						type="text" name="minute" size="40" />분</td>
				</tr>
				<tr>
					<td width="80" height="30">제목</td>
					<td><input type="text" name="title" size="105" /></td>
				</tr>
				<tr>
					<td width="80" height="30">내용</td>
					<td><textarea rows="7" cols="80" name="content"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="등록" name="submitbtn"> <input
				type="reset" value="취소" name="resetbtn"
				OnClick="javascript:history.back(-1)">
		</form>
		</section>
	</div>
</body>
</html>