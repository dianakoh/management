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
</head>
<body>
	<%
	String userId =  (String)session.getAttribute("userId");
	%>
	<jsp:include page="mainView.jsp">
		<jsp:param name="sessionId" value="<%=userId %>"/>
	</jsp:include>
		</section>
    </div>
</body>
</html>