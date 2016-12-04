<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>phoneBook_Add</title>
<link rel=stylesheet href="phoneBookStyle.css" />
        <style type="text/css">
            td{font-size: 9pt;}
            a{cusor: pointer; color: #000000; text-decoration: none; font-size: 9pt; line-height: 150%;}
            a:HOVER, a:ACTIVE{font-size: 9pt; color: #F28011; text-decoration: underline;}
        </style>
</head>
<body>
<jsp:include page="mainView.jsp" />
	<center>
	<h1>회원가입</h1>
	<table border='2' >
	<form action="">

	<tr>
	<td>이름</td>
	<td><input type="text"/></td>
	</tr>
	
	<tr>
	<td>전화번호</td>
	<td>
	<select>
		<option>010</option>
		<option>011</option>
		<option>016</option>
		<option>018</option>
		</select>
		- <input type='text' size='6'/>-<input type='text' size='6'/>
	</td>
	</tr>
	
	 <td>생년월일</td>
	 <br>
        <td><select name="user_birth_year">
        		<option value="1994" selected>1994</option>
                <option value="1995" selected>1995</option>
                <option value="1996" selected>1996</option>
                <option value="1997" selected>1997</option>
                <option value="1998" selected>1998</option>
                <option value="1999" selected>1999</option>
                <option value="2000" selected>2000</option>
            </select>
            년
            <select name="user_birth_month">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            월
            <select name="user_birth_day">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
            </select>
            일
        </td>
    </tr>
    
	<tr>
	<td>이메일</td>
	<td><input type="text"/>@<input type="text"/>
	</td>
	</tr>
	</form>
	</table>
	<input type="submit" value="저장">
	<a href="phoneBook.jsp"><input type="reset" value="취소"></a>
	</center>
</body>
</html>