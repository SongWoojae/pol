<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

	
		<div class="container">
		<table id="table2" data-height="460"
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
function callback(results){
	var vendorList = results.vendorList;
	var goodsList = results.goodsList;
	var pageInfo = results.pageInfo;
	
	var pageStr = "<li><a>◀◀</a></li>";
	pageStr += "<li><a>◀</a></li>";
	var blockCnt = new Number(pageInfo.blockCnt);
	var nowPage= new Number(pageInfo.nowPage);
	var startBlock = Math.floor((nowPage-1)/blockCnt) * 10+1;
	var endBlock = startBlock+blockCnt-1;
	var totalPageCnt = new Number(pageInfo.totalPageCnt);
	if(endBlock>totalPageCnt){
		endBlock = totalPageCnt;
	}

$(document).ready(function(){
	var params = {};
	params["nowPage"] = "1";
	params = JSON.stringify(params);
	var a = { 
    		type     : "POST"
	    ,   url      : "/cal/vendor_select.jsp"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : params
	    ,   success : function(results){
	    	var vendorList = results.vendorList;
	    	var goodsList = results.goodsList;
	    	var pageInfo = results.pageInfo;
	    	 

	    	var pageStr = "<li><a>◀◀</a></li>";
	    	pageStr += "<li><a>◀</a></li>";
	    	var blockCnt = new Number(pageInfo.blockCnt);
	    	var nowPage = new Number(pageInfo.nowPage);
	    	var startBlock = Math.floor((nowPage-1)/blockCnt)*10+1;
	    	var endBlock = startBlock+blockCnt-1;
	    	var totalPageCnt = new Number(pageInfo.totalPageCnt);
	    	if(endBlock>totalPageCnt){
	    		endBlock = totalPageCnt;
	    	}
	    	for(var i=startBlock,max=endBlock;i<=max;i++){
	    		if(i==pageInfo.nowPage){
	    			pageStr += "<li class='active'><a>" + i + "</a></li>";
	    		}else{
	    		pageStr += "<li><a>" + i + "</a></li>";
	    		}
	    	}
	    	pageStr += "<li><a>▶</a></li>";	
	    	pageStr += "<li><a>▶▶</a></li>";
	    	
	    	$("#page").html(pageStr);
	    	
	    	for(var i=0, max=vendorList.length;i<max;i++){
	    		$("#s_vendor").append("<option value='" + vendorList[i].vinum + "'>"+vendorList[i].viname +"</option>")
	    	}
	        $('#table2').bootstrapTable({
	            data: goodsList
	        });
	        setEvent();
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	};
$.ajax(a);
});

function goPage(page){
	var params = {};
	params["nowPage"] = page; 
	params = JSON.stringify(params);
	var a = { 
    		type     : "POST"
	    ,   url      : "/cal/vendor_select.jsp"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : params
	    ,   success : function(results){
	    	var vendorList = results.vendorList;
	    	var goodsList = results.goodsList;
			var pageInfo = results.pageInfo;
			
			var pageStr = "<li><a>◀◀</a></li>";
			pageStr += "<li><a>◀</a></li>";
			var blockCnt = new Number(pageInfo.blockCnt);
			var nowPage= new Number(pageInfo.nowPage);
			var startBlock = Math.floor((nowPage-1)/blockCnt) * 10+1;
			var endBlock = startBlock+blockCnt-1;
			var totalPageCnt = new Number(pageInfo.totalPageCnt);
			if(endBlock>totalPageCnt){
				endBlock = totalPageCnt;
			}
			for(var i=startBlock, max=endBlock;i<=max;i++){
				if(i==pageInfo.nowPage){
					pageStr += "<li class='active'><a>" + i + "</a></li>";
				}else{
					pageStr += "<li><a>" + i + "</a></li>";
				}
			}
			pageStr += "<li><a>▶</a></li>";
			pageStr += "<li><a>▶▶</a></li>";
			
			$("#page").html(pageStr);
	    	for(var i=0, max=vendorList.length;i<max;i++){
	    		$("#s_vendor").append("<option value='" + vendorList[i].vinum + "'>"+vendorList[i].viname +"</option>")
	    	}
	        $('#table').bootstrapTable('destroy');
	        $('#table').bootstrapTable({
	            data: goodsList
	        });
	        setEvent();
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	};
$.ajax(a);	
}
function setEvent(){
$("ul[class='pagination']>li>a").click(function(){	
	goPage(this.innerHTML);
	})
}


</script>
</body>
</html>