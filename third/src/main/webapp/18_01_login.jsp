<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
String memberId=request.getParameter("memberId");
out.print("memberId: "+memberId+"<br>");
session.setAttribute("MEMBER",memberId);
%>
로그인 성공<br>
<a href="<%=request.getContextPath()%>/board/boardList.jsp">게시판 보기</a>
</body>
</html>