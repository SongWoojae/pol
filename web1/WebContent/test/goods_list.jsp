<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

	<div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="giNum" class="text-center">상품번호</th>
				<th data-field="giName" class="text-center">상품이름</th>
				<th data-field="giDesc" class="text-center">상품설명</th>
				<th data-field="viNum" class="text-center">생산자번호</th>
				<th data-field="viName" class="text-center">생산자이름</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
</div>
<div class="jb-center" style="text-align: center">
	<ul class="pagination" id="page">
	</ul>
</div>
<select id="s_vendor">
<option value="">회사선택</option>
</select> 
검색어
<input type="text" id="giName" />
<input type="button" id="searchGoods" value="제품명검색" />
<div id="result_div" class="container"></div>
<script>

var pageInfo = {};
$("#searchGoods").click(function(){
	var giName = $("#giName").val();
	var viNum = $("$s_vendor").val();
	var params = {};
	params["giName"] = giName;
	params["viNum"] = viNum;
	params["command"] = "list";
	var page = {};
	page["nowPage"] = "1";
	params["page"] = page;
	movepageWithAjax(params, "/list.goods", callback);
	
})
function callback(results){
	var goodsList = results.list;
	pageInfo = results.page;
	var vendorList = results.vendorList;
	var selStr = "<option value=''>회사선택</option>";
	for(var i=0, max = vendorList.length; i<max; i++){
		var vendor = vendorList[i];
		selStr += "<option value='" + vendor.viNum + "'>" + vendor.viName
				+ "</option>";
	}
	$("#s_vendor").html(selStr);
	makePagination(pageInfo, "page");
	setEvent(pageInfo, "/list.goods");
    $('#table').bootstrapTable('destroy');
    $('#table').bootstrapTable({
        data: goodsList
    });
}
$(document).ready(function(){
	var page = {};
	page["nowPage"] = "1";
	var params = {};
	params["page"] = page;
	params["command"] = "list";
	movePageWithAjax(params, "/list.goods", callback);
});


</script>
</body>
</html>