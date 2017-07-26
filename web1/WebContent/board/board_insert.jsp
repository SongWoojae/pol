<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.test.dto.BoardInfo"%>

</head>
<script>
function movePage(){
location.href="/board/board_select.jsp";
}
</script>
<body>


<form action="/board/board_insert_ok.jsp">

	제목 :<input type="text" name="title" id="bititle" />
	<br />
	 내용 : <textarea name="content" id="bicontent"></textarea>
	<br /> 
	글쓴이 :<input type="text" name="bicreusr" id="bicreusr" />
	<br /> 
	비밀번호 :<input type="password" name="bipwd" id="bipwd" />
	<br />
	작성 일자 : <input type="datetime" name="credat" id="credat" />
	<br />
	
	<input type="submit" value="글쓰기" onclick="doWrite()" />
	<input type="button" value="뒤로가기" onclick="movePage()" />

</form>
	


</body>
</html>