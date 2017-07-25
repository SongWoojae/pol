<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.test.dto.BoardInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%
	Connection con = null;
	PreparedStatement ps = null;
	
	try{
		con = DBConn2.getCon();
		String sql = "select binum, bititle, bicontent, bipwd, creusr, credat form board_info";
	}
	
		out.println("<input type='button' value='생성하기' onclick='doCreate()'/>");
		out.println("<input type='button' value='메인가기' onclick='goToMain()'/>");
	%>
</body>
</html>