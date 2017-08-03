<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
<div class ="container">
		<div class="starter-template">
<form method="get" action="<%=rootPath%>/cal/json_insert_ok.jsp">
<table border="1"  class="table table-bordered table-hover">
<tr>
	<td>번호</td>
	<td> <input type="text" name="num" id="num" /></td>
</tr>
<tr>
	<td> 내용 </td>
	<td> <textarea name="jttext" id="jttext"></textarea></td>
</tr>

	</table>
	<input type="submit" value="글쓰기"  />
</body>
</html>