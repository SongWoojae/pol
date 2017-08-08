<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

	
		<div class="container">
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="ginum"  class="text-center">번호</th>
					<th data-field="viname"  class="text-center">회사 이름</th>
					<th data-field="videsc"  class="text-center">회사 구분</th>
					<th data-field="viaddress"  class="text-center">주소</th>
					<th data-field="viphone"  class="text-center">전화번호</th>
					<th data-field="vicredat"  class="text-center">날짜</th>
					<th data-field="vicretim"  class="text-center">시간</th>					
					<th data-field="giname"  class="text-center">차종</th>
					<th data-field="gidesc"  class="text-center">구분</th>
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
var thisBlockCnt=0;
var thisNowPage = 0;
var thisTotalPage = 0;

function callback(results){
	var vendorList = results.vendorList;
	var goodsList = results.goodsList;
	var pageInfo = results.pageInfo;
	
	
	var blockCnt = new Number(pageInfo.blockCnt);
	thisBlockCnt = blockCnt;
	var nowPage = new Number(pageInfo.nowPage);
	thisNowPage = nowPage;
	var startBlock = Math.floor((nowPage-1)/blockCnt) * 10+1;
	var endBlock = startBlock+blockCnt-1;
	var totalPageCnt = new Number(pageInfo.totalPageCnt);
	thisTotalPage = totalPageCnt;
	if(endBlock>totalPageCnt){
		endBlock = totalPageCnt;
	}
	setPagination(startBlock, endBlock, nowPage,"page");
	
	for(var i=0, max=vendorList.length;i<max;i++){
		$("#s_vendor").append("<option value='" + vendorList[i].vinum + "'>"+vendorList[i].viname +"</option>")
	}
    $('#table').bootstrapTable('destroy');
    $('#table').bootstrapTable({
        data: goodsList
    });
    setEvent();
}
$(document).ready(function(){
	var params = {};
	params["nowPage"] = "1";
	goPage(params, "/cal/vendor_select.jsp", callback);
});
function setEvent(){
	$("ul[class='pagination']>li>a").click(function(){
		var goPageNum = new Number(this.innerHTML);
		if(isNaN(goPageNum)){
			if(this.innerHTML=="◀"){
				thisNowPage -= thisBlockCnt;
			}else if(this.innerHTML=="◀◀"){
				thisNowPage = 1;
			}else if(this.innerHTML=="▶"){
				thisNowPage += thisBlockCnt;
			}else if(this.innerHTML=="▶▶"){
				thisNowPage = thisTotalPage;
			}
			if(thisNowPage<=0){
				thisNowPage = 1;
			}else if(thisNowPage>thisTotalPage){
				thisNowPage = thisTotalPage;
			}
			goPageNum = thisNowPage;
		}
		var params = {};
		params["nowPage"] = "" + goPageNum;
		goPage(params, "/cal/vendor_select.jsp", callback);
	})
}

</script>
</body>
</html>