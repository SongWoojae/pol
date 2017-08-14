<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.test.dto.UserInfo"%>
	<div class="container-view"> 
		<table id="table"  data-height="460" class="table table-bordered table-hover">
		<thead>
			<tr> 
				<th colspan="3" class="text-center"><h5 class="form-signin-heading">등록 하기</h5></th>
			</tr>
			<tr>
				<td class="col-md-2">상품번호</td>
				<td><input type="text"/></td>
			<tr>
				<td>상품이름</td>
				<td><input type="text"/></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text"/></td>
			</tr>
			<tr>
				<td>생산자번호</td>
				<td><input type="text"/></td>
			</tr>
			<tr>
				<td>생산자이름</td>
				<td><input type="text"/></td>
			</tr>
					<tr>
				<td>
					<button id="btnUpdate" class="btn btn-md-2 btn-primary btn-block" 	type="button">등록</button>
				</td>
				
				<td>
					<button id="btnGoList" class="btn btn-md-2 btn-primary btn-block" 	type="button">리스트 이동</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- /container -->
	<script>
	$("#btnGoList").click(function(){
		location.href="/goods/goods_list.jsp?nowPage=" + <%=request.getParameter("nowPage")%>
	});
	</script>
<body>

</body>
</html>