<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>🖥 DongGeon's Bash 🖥</title>
</head>
<body bgcolor='#F7D4D6'>

	<%
	String id = "admin";
	String pw = "admin";

	String login_id = request.getParameter("loginId");
	String login_pw = request.getParameter("loginPw");

	if (id.equals(login_id) && pw.equals(login_pw)) {
	%>
	<iframe src="screen.jsp"
		style="display: block; width: 98vw; height: 58vh"></iframe>
	<iframe src="console.jsp"
		style="display: block; width: 98vw; height: 38vh"></iframe>
	<%
	} else {
	%>
	<h3><a href="login.jsp">login fail</a></h3>
	<%
	}
	%>



</body>
</html>