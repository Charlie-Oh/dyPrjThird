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
	String name=request.getParameter("name");
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select count(*) cnt from member where id=? and passwd=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		rs=pstmt.executeQuery();
		
		int a=0;
		
		if(rs.next()){
			a=rs.getInt("cnt");
		}
		if(a>0){
			session.setAttribute("id",id);
			out.print("로그인 되었습니다.");
		}else{
			if(a<=0){
			%><script>alert('로그인에 실패하였습니다');</script><%
			}
			response.sendRedirect("20_03_update01.jsp");
		}
		
	}catch(SQLException ex){
		out.println("에러가 발생하였습니다.");
		out.println("SQLException: "+ex.getMessage());
	}finally{
		if(rs!=null){
			rs.close();
		}
		if(pstmt!=null){
			pstmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
%>
</body>
</html>