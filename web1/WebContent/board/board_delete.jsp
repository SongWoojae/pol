<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn2" %>
<%@ page import="com.test.dto.UserInfo" %>
<%
String biNum = request.getParameter("binum");
String biPwd = request.getParameter("bipwd");
String sql = "delete from board_info";
sql += " where binum=? and bipwd=?";

Connection con = null;
PreparedStatement ps = null;
String result = "삭제 실패 했습니다.";
int resultNum = 0;
try{
	con = DBConn2.getCon();
	ps = con.prepareStatement(sql);
	ps.setString(1, biNum);
	ps.setString(2, biPwd);
	resultNum = ps.executeUpdate();
	if(resultNum==1){
		result = "삭제 완료 되었습니다";
		con.commit();
		}
	}catch(Exception e){
	System.out.println(e);
}finally{
	if(ps!=null){
		ps.close();
		ps = null;
	}
	DBConn2.closeCon();
}
%>

<script>
alert("<%=result%>");
if(<%=resultNum%> ==1){
	location.href = "<%=rootPath%>/board/board_select.jsp";
}else{
	history.back();
}
</script>