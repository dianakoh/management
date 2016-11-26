<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>USER MANAGEMENT</title>
	<link rel=stylesheet href="initStyle.css"/>
	<link rel=stylesheet href="indexStyle.css"/>
</head>
<body>
	<header id="header">
        <hgroup id="title">
            <h1>Daily Management System</h1>
        </hgroup>
    </header>
	<div id="content">
		<aside id="aside">
			<div>Profile</div>
        </aside>
        <section id="mainSection">
           <section id="menu">
            	<ul>
               		<li id="phoneBook">PhoneBook</li>
               		<li id="schedule">Schedule</li>
            	</ul>
            </section>
            <section id="contents">
            	<form id="form" action="loginProcess.jsp" method="post">
					<table>
						<tr>Login<hr/><br/></tr>
						<tr>
							<td>id </td>
							<td><input type="text" name="id" size="15"/></td>
						</tr>
						<tr>
							<td>password </td>
							<td><input type="password" name="pw" size="15"/></td>
						</tr>
					</table>
					<br/><hr/>
					<input type="submit" id="submit" value="LOGIN"/>
				</form>
            </section>
        </section>
    </div>
</body>
</html>