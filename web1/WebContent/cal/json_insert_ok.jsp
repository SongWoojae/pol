<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>

<%
String Num = request.getParameter("num");
String Jttext = request.getParameter("jttext");

String sql =  "insert into json_test(num,jttext)";
sql += "values(?,?)";
Connection con = null;
PreparedStatement ps = null;

String result = "저장에 실패하였습니다.";
int resultNum = 0;
try{
	con = DBConn2.getCon();
	ps = con.prepareStatement(sql);
	ps.setString(1,Num);
	ps.setString(2,Jttext);
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
	location.href="<%=rootPath%>/cal/json_test.jsp";	
}else{
	history.back();
}
</script>