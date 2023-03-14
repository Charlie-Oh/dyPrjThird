<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	try{
		String sql="delete from member where id=? and passwd=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,passwd);
		int cnt=ps.executeUpdate();
		
		if(cnt>0){
			out.print("회원탈퇴가 완료되었습니다.<br>아이디: "+id);
		}else{
			out.print("일치하는 회원이 없습니다.");
		}
		if(ps!=null){
			ps.close();
		}
	}catch(Exception ex){
		out.print("처리하는 도중 에러가 발생하였습니다.");
	}finally{
		if(conn!=null){
			conn.close();
		}
	}
	
%>

</body>
</html>