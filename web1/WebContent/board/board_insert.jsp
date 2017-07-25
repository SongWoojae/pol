<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function doWrite(){
	var titleObj = document.getElementById("biTitle");
	if(titleObj.value.trim()==""){
		alert("제목을 입력 하세요")
		return false;
	}
	var contentObj = document.getElementById("biContent");
	if(contentObj.value.trim()==""){
		
		alert("내용을 입력하세요");
		return false;
	}
	var biPwdObj= document.getElementById("biPwd");
	var creusrObj = document.getr
	
	
	if(isNaN(userNum)){
		alert("숫자를 입력하세요");
		return false;
	}
	return true;
	
}
</script>
<body>
<%
out.println("<input type='button' value='글쓰기' onclick='doWrite()'/>");
%>
제목 : <input type="text" name="title" id="title"/><br/>
내용 : <textarea name="content" id="content"></textarea><br/>
글쓴이 : <input type="text" name="user_num" id="user_num"/><br/>

<input type="hidden" name = "command" id = "command" value = "SIGNIN"/>

</body>
</html>