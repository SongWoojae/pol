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
String biTitle = request.getParameter("bititle");
String biContent = request.getParameter("bicontent");
String bicreusr = request.getParameter("bicreusr");
String bipwd = request.getParameter("bipwd");

	String sql = "insert into board(bititle, bicontent, bipwd, creusr, credat)";
	sql += "values(?,?,?,?,now())";
Connection con = null;
PreparedStatement ps = null;

int resultNum = 0;
String result = "저장이 안되었어요";
try {
	con = DBConn2.getCon();

	ps = con.prepareStatement(sql);
	ps.setString(1, biTitle);
	ps.setString(2, biContent);
	ps.setString(3, bicreusr);
	ps.setString(4, bipwd);
	
	resultNum = ps.executeUpdate();
	if(resultNum==1){
		result = "정상적으로 저장되었습니다.";
		con.commit();
	}

} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
} finally {
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
<script>
alert("<%=result%>");
if(<%=resultNum%>==1){
	location.href="<%=rootPath%>/board/board_select.jsp";	
}else{
	history.back();
}
</script>
</body>
</html>