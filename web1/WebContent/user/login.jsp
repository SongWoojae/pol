<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.test.dto.UserInfo"%>

<script>

	var setObj;
	var loopCnt = 0;
	function doStartTimer() {
		setObj = setInterval(function() {
			if (loopCnt == 10) {
				clearInterval(setObj);
			} else {
				loopCnt++;
				alert(loopCnt + "안녕하세요!!");
			}
		}, 1000);

	}
	function doStopTimer() {
		clearInterval(setObj);
	}
	function doLogout() {
		location.href = "/user/login_ok.jsp";
	}
	function doMovePage(){
		location.href = "/board/board_select.jsp";
	}
	
</script>
<body>
	<%
		if (login) {
			out.println("현재시간: " + toDateStr);
			out.println("<br/>");
			out.println(userId + "님 환영해요~");
			out.println("<br/>");
			out.println("==" + userId + "님 의 정보 ==");
			out.println("<br/>");
			out.println("성명 : " + userName);
			out.println("<br/>");
			out.println("나이 : " + age);
			out.println("<br/>");
			out.println("주소 : " + address);
			out.println("<br/>");
			out.println("전화번호 : " + hp1 + hp2 + hp3);
			out.println("<br/>");
			out.println("<input type='button' value='로그아웃' onclick='doLogout()'/>");
			out.println("<input type='button' value='게시판 가기' onclick='doMovePage(\"board\")'/>");
			out.println("<input type='button' value='스타트 타이머' onclick='doStartTimer()'/>");
			out.println("<input type='button' value='스탑 타이머' onclick='doStopTimer()'/>");
		} else {
	%>
	<form action="/user/login_ok.jsp">
		ID : <input type="text" name="id" /><br /> 
		PWD : <input type="password" name="pwd" /><br />
		<input type="submit" value="LOGIN" />
	</form>
	<%
		}
	%>
	
</body>
</html>