<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel=stylesheet href="mainViewStyle.css" />
<script>
</script>

</head>
<body>
    <header id="header">
        <hgroup id="title">
            <h1>Daily Management System</h1>
        </hgroup>
    </header>
    <div id="content">
		<aside id="aside">
		<h3>Profile</h3>
        </aside>
        <section id="main_section">
           <section class="buttons">
            <ul>
               <li id="phoneBook" onclick="location.href='phoneBook.jsp'" style="background:white; color:black;">PhoneBook</li>
               <li id="schedule" onclick="location.href='scheduler.jsp'" style="background:black; color:white;">Schedule</li>
            </ul>