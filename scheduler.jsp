<% // calendar source - http://it79.egloos.com/98109 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.Date" %>
<%
	//String userid =  (String)session.getAttribute("userID");
	String userid = "aaa";
	String username =  (String)session.getAttribute("userName");
	String userimg = (String)session.getAttribute("userImg");
%>
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scheduler</title>
<link rel=stylesheet href="schedulerStyle.css" />
<link rel=stylesheet href="mainViewStyle.css" />
        <style type="text/css">
            td{font-size: 9pt;}
            a{cusor: pointer; color: #000000; text-decoration: none; font-size: 9pt; line-height: 150%;}
            a:HOVER, a:ACTIVE{font-size: 9pt; color: #F28011; text-decoration: underline;}
        </style>
<script>
function onLogout() {
	if (confirm("로그아웃 하시겠습니까?")) {
		<%
		session.invalidate();
		%>
		location.href="index.jsp";
	}
}
</script>
</head>
<body>
	<% 
	String formId = "aaa";//request.getParameter("sessionId");
	//String formId = (String)session.getAttribute("userId");
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
			<section id="menu">
				<ul>
					<li id="phoneBookMenu"><a href="phoneBook.jsp">PhoneBook</a></li>
					<li id="scheduleMenu"><a href="scheduler.jsp">Schedule</a></li>
				</ul>
 			</section>
        <center>
            <table width="80%" border="0" cellpadding="1" cellspacing="2">
                <tr height="30">
                    <td align="center">
                        <a href="scheduler.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
                        <b><%=year %>年 <%=month %>月</b>
                        <a href="scheduler.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
                    </td>
                </tr>
            </table>
            
            <table width="80%" border="0" cellpadding="2" cellspacing="1" bgcolor="#cccccc">
                <tr height="25">
                    <td align="center" bgcolor="#e6e4e6"><font color="red">일</font></td>
                    <td align="center" bgcolor="#e6e4e6">월</td>
                    <td align="center" bgcolor="#e6e4e6">화</td>
                    <td align="center" bgcolor="#e6e4e6">수</td>
                    <td align="center" bgcolor="#e6e4e6">목</td>
                    <td align="center" bgcolor="#e6e4e6">금</td>
                    <td align="center" bgcolor="#e6e4e6"><font color="blue">토</font></td>
                </tr>
                <%
                    int newLine = 0;
                    //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
                    out.println("<tr height='25'>");
                    for(int i=1; i<w; i++)
                    {
                        out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
                        newLine++;
                    }
                    
                    String fc, bg;
                    for(int i=1; i<=end; i++)
                    {
                        
                        fc = (newLine == 0)?"red":(newLine==6?"blue":"#000000");
                        bg = "#ffffff";
                        out.println("<td align='center' bgcolor=" + bg + "><font color=" + fc + ">"
                                + "<a href=schedulerView.jsp?year=" + year + "&month=" + month+ "&day="+ i + ">" + i + "</a></font></td>");
                        newLine++;
                        if(newLine == 7 && i != end)
                        {
                            out.println("</tr>");
                            out.println("<tr height='25'>");
                            newLine = 0;
                        }
                    }
                    
                    while(newLine>0 && newLine<7)
                    {
                        out.println("<td bgcolor='ffffff'>&nbsp;</td>");
                        newLine++;    
                    }
                    out.println("</tr>");
                %>
            </table>
        </center>

            
        </section>
    </div>
</body>
</html>