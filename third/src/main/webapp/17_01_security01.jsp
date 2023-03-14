<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%if(request.isUserInRole("manager")==true){
	response.sendRedirect("17_01_security02.jsp");
} %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Security</title>
</head>
<body>
    <%@ include file="17_01_menu.jsp"%>
	<%!String greeting = "인증 성공했습니다.";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="text-center">
			<h3>인증 성공!</h3>
			<%
				//response.setIntHeader("Refresh", 5);
				Date day = new java.util.Date();
				out.println("현재 접속  시각: " + day.toLocaleString() + "\n");
			%>
		</div>
		<hr>
	</div>	
	<%@ include file="17_01_footer.jsp"%>
</body>
</html>