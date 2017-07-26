<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.test.dto.BoardInfo"%>


<script>
function doWrite(){
	location.href = "/board/board_insert.jsp";
}
function doMovePage(){
	location.href = "/user/login.jsp";
}
</script>
<body>
	<%
	Connection con = null;
	PreparedStatement ps = null;
	
	try{
		con = DBConn2.getCon();
		String sql = "select binum, bititle, bicontent, bipwd, creusr, credat from board_info";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String tableStr="<table border='1'>";
		tableStr += "<tr>";
		tableStr += "<td>번호</td>";
		tableStr += "<td>제목</td>";
		tableStr += "<td>내용</td>";
		tableStr += "<td>비밀번호</td>";
		tableStr += "<td>작성자</td>";
		tableStr += "<td>작성일자</td>";
		tableStr += "</tr>";
		
		while(rs.next()){
			tableStr += "<tr>";
			tableStr += "<td>"+rs.getInt("binum") + "</td>";
			tableStr += "<td>"+rs.getString("bititle") + "</td>";
			tableStr += "<td>"+rs.getString("bicontent") + "</td>";
			tableStr += "<td>"+rs.getString("bipwd") + "</td>";
			tableStr += "<td>"+rs.getString("creusr") + "</td>";
			tableStr += "<td>"+rs.getString("credat") + "</td>";
			tableStr += "</tr>";
		}
		tableStr += "</table>";
		out.println(tableStr);
	}catch(Exception e){
		System.out.println(e);
	}finally{
		if(ps!=null){
		ps.close();
		ps = null;
		}
		if(con!=null){
			con.close();
			con=null;
		}
		DBConn2.closeCon();
		
	}
	%>
	
	<input type="button" value="게시글 작성" onclick="doWrite()"/>
	<input type="button" value="메인가기" onclick="doMovePage('main')"/>
</body>
</html>