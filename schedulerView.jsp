<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Date"%>

<%
	String userid =  (String)session.getAttribute("userId");
	String formId =  (String)session.getAttribute("userId");
%>
<%
	// paginator
	String pageNum = request.getParameter("pageNum");
	String year = request.getParameter("year");
	session.setAttribute("Year", year);
	String month = request.getParameter("month");
	session.setAttribute("Month", month);
	String day = request.getParameter("day");
	session.setAttribute("Day", day);
	String schedule = year + "-" +  month + "-" + day;
	Date scheduleDate = Date.valueOf(schedule);
	
	if(pageNum == null){
		pageNum = "1";
	}

	int listSize = 10;
	int currentPage = Integer.parseInt(pageNum);
	int nextPage = currentPage + 1;
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	int num[] = {0};
	int row = startRow;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SchedulerView</title>
	<link rel=stylesheet href="initStyle.css"/>
	<link rel=stylesheet href="mainViewStyle.css"/>
<style>
</style>
	<script>
		function onLogout() {
			if (confirm("로그아웃 하시겠습니까?")) {
				location.href="index.jsp";
			}
		}
	</script>

</head>
<body>
	<% 
	String formName = null;
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
 			<input type=button value="추가"
			onclick="location.href='scheduler_Add.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>'" />
		<TABLE style="width: 100%; table-layout: fixed">
			<TR>
				<TD style="border: 1px solid #bcbcbc;" align="center">Time</TD>
				<TD style="border: 1px solid #bcbcbc;" align="center">Title</TD>
				<TD style="border: 1px solid #bcbcbc;" align="center">Content</TD>
				<TD style="border: 1px solid #bcbcbc;" align="center">Manage</TD>
			</TR>
			<%
	conn = null;		
	pstmt  = null;
	rs = null;
	
	url = "jdbc:mysql://127.0.0.1:3306/se";        
	dbId = "root";                                       
	dbPassword = "rkdud723";  
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbId,dbPassword);

		// Statement 생성
		
		// ReseltSet의 레코드 수를 lastRow 변수에 저장
		String strSQL = "SELECT count(*) FROM Schedule WHERE userID = ? and scheduleDate = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setString(1, userid);
		pstmt.setDate(2, scheduleDate);
		rs = pstmt.executeQuery();
		if(rs.next())
			lastRow = rs.getInt(1);
		rs.close();
		
		// ResultSet에 레코드가 존재할 때
		if(lastRow > 0) {
				strSQL = "SELECT * FROM Schedule WHERE userID = ? and scheduleDate = ? ORDER BY scheduleTime ASC";
				pstmt = conn.prepareStatement(strSQL);
				pstmt.setString(1, userid);
				pstmt.setDate(2, scheduleDate);
				rs = pstmt.executeQuery();				
				for(i=1;rs.next(); i++){
					if(i >= startRow && i <=endRow){
%>
			<TR>
				<TD style="border: 1px solid #bcbcbc;" align="center"><%=rs.getString("scheduleTime")%></TD>
				<TD style="border: 1px solid #bcbcbc;" align="center"><%=rs.getString("title")%></TD>
				<TD style="border: 1px solid #bcbcbc; word-wrap: break-word"
					align="center"><%=rs.getString("content") %></TD>
				<TD style="border: 1px solid #bcbcbc;" align="center"><a
					href=scheduler_Update.jsp?number=<%=rs.getInt("no")%>>수정</a> <a
					href="scheduler_DeleteProcess.jsp?number=<%=rs.getInt("no")%>&year=<%=year%>&month=<%=month%>&day=<%=day%>"
					onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></TD>
			</TR>
			<%						row++;
					}
				}
				rs.close();
			// 사용한 Statement 종료
			pstmt.close();
			// 커넥션 종료
			//conn.close();
		}
		else
		{
%>
			<TR>
				<TD colspan="4">레코드 없음</TD>
			</TR>
			<%
		}

	}catch(SQLException ex){ 
%>
			<TR>
				<TD colspan="4">에러: <%=ex %>
				</TD>
			</TR>
			<%
	}
%>

		</TABLE>
		<%
	if(lastRow > 0) {
		// 페이지가 넘어갈 때 넘겨줄 파라미터
		int setPage = 1;
		
		// 마지막 페이지의 번호를 저장
		int lastPage = 0;
		if(lastRow % listSize == 0)
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;
		
		// 레코드 수에 따라 쪽번호를 매긴다.
		if(currentPage != 1) {
%> <a
			href="schedulerView.jsp?pageNum=<%=currentPage-1%>&year=<%=year%>&month=<%=month%>&day=<%=day%>">[◀]</a>
		<%		}
		while(setPage <= lastPage) {
			if(setPage == currentPage){
%> [<%=setPage%>] <% }else{ %> <a
			href="schedulerView.jsp?pageNum=<%=setPage%>&year=<%=year%>&month=<%=month%>&day=<%=day%>">[<%=setPage%>]
		</a> <%
}
			setPage = setPage + 1;
		}
	
		// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
%> <%
		if(lastPage > currentPage){
%> <a
			href="schedulerView.jsp?pageNum=<%=currentPage+1%>&year=<%=year%>&month=<%=month%>&day=<%=day%>">[▶]</a>
		<%
		}
	}
%> </section>
	</div>
</body>
</html>