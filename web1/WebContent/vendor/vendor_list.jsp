<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="container">
	<div class="container"
		style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
		<label>회사이름 : </label> <input type="text" id="viName" /> <input
			type="button" id="searchGoods" value="검색" />
	</div>
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="viNum" class="text-center">회사번호</th>
				<th data-field="viName" class="text-center">회사이름</th>
				<th data-field="viDesc" class="text-center">회사설명</th>
				<th data-field="viAddress" class="text-center">회사주소</th>
				<th data-field="viPhone" class="text-center">연락처</th>


			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
	<button id="btnInsert" class="btn btn-primary" type="button">회사등록</button>
</div>
<div class="jb-center" style="text-align: center">
	<ul class="pagination" id="page">
	</ul>
</div>
<script>
	$("#btnInsert").click(function() {
		location.href = "/goods/goods_insert.jsp";
	})
	$("#searchGoods").click(function() {
		var viName = $("#viName").val().trim();
		if (viName == "") {
			alert("회사명을 입력해주세요.");
			return;
		}
		var params = "command=list&viName=" + viName;
		$.ajax({
			type : "POST",
			url : "/list.vendor",
			dataType : "text",
			data : params,
			success : function(result) {
				$("#result_tbody").html(result);
			},
			error : function(xhr, status, e) {
				alert("에러 : " + e);
			},
			complete : function() {
			}
		});

	});
	function callback(rseults){
		
	}
	$(document).ready(function(){
		var params = "command=list";
		$.ajax({ 
    		type     : "POST"
	    ,   url      : "/list.vendor"
	    ,   dataType : "text" 
	    ,   data     : params
	    ,   success : function(result){
	    	$("#result_tbody").html(result);
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	});
	});
</script>
</body>
</html>