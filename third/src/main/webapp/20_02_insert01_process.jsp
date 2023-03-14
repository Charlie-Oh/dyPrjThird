<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
<%@ include file="20_01_dbconn.jsp" %>
<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	String name=request.getParameter("name");
	Statement stmt=null;
	
	try{
		if(id.equals("admin")){
			String sql="DELETE FROM Member WHERE ID NOT IN ('user1','user2','user3','admin')";
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			out.println("Member 테이블 삭제에 성공했습니다.");
		}else{
		String sql="INSERT INTO Member(id, passwd, name) VALUES('"+id+"','"+passwd+"','"+name+"')";
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		out.println("Member 테이블 삽입에 성공했습니다.");
		}
	}catch(SQLException ex){
		out.println("Member 테이블 삽입에 실패했습니다.<br>");
		out.println("SQLException: "+ex.getMessage());
	}finally{
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
%>
</body>
</html>