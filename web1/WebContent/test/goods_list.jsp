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
		<div class="jb-center" style="text-align:center">
		<ul class="pagination" id="page"></ul>
		
		</div>
<select id="s_vendor">
<option value="">회사선택</option>
</select> 
<input type="button" id="vendor" value="회사리스트"/>
		</div>
<div id="result_div" class="container"></div>

	
<script>
var thisBlockCnt = 0;
var thisNowPage = 0;
var thisTotalPage = 0;
function callback(results){
	var goodsList = results.list;
	var pageInfo = results.page;
	setPagination(pageInfo, "page");
	setEvent(pageInfo);
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
	
	goPage(params, "/list.goods", callback);
});
function setEvent(pageInfo){
	$("ul[class='pagination']>li:not([class='disabled'])>a").click(function(){
		var thisNowPage = pageInfo.nowPage;
		var goPageNum = new Number(this.innerHTML);
		if(isNaN(goPageNum)){
			if(this.innerHTML=="◀"){
				thisNowPage -= pageInfo.blockCnt;
			}else if(this.innerHTML=="◀◀"){
				thisNowPage = 1;
			}else if(this.innerHTML=="▶"){
				thisNowPage += pageInfo.blockCnt;
			}else if(this.innerHTML=="▶▶"){
				thisNowPage = pageInfo.totalPageCnt;
			}
			if(thisNowPage<=0){
				thisNowPage = 1;
			}else if(thisNowPage>pageInfo.totalPageCnt){
				thisNowPage = pageInfo.totalPageCnt;
			}
			goPageNum = thisNowPage;
		}

		var page = {};
		page["nowPage"] = "" + goPageNum;
		var params = {};
		params["page"] = page;
		params["command"] = "list";
		goPage(params, "/list.goods", callback);
	})
}

</script>
</body>
</html>