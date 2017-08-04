<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

	<div class="container">
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="calnum"  class="text-center">번호</th>
					<th data-field="num1"  class="text-center">숫자1</th>
					<th data-field="num2"  class="text-center">숫자2</th>
					<th data-field="op"  class="text-center">연산자</th>
					<th data-field="result"  class="text-center">결과값</th>
				</tr>
			</thead>
			<tbody id="result_tbody">
			</tbody>
		</table>
연산자 : <input type="text" id="op"/><input type="button" id="getCal" value="계산리스트호출"/>
<div id="result_div" class="container"></div>
	</div>
	<br/>
	<br/>
	
		<div class="container">
		<table id="table2" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="vi.VINUM"  class="text-center">번호</th>
					<th data-field="vi.VINAME"  class="text-center">회사 이름</th>
					<th data-field="vi.VIDESC"  class="text-center">회사 구분</th>
					<th data-field="vi.VIADDRESS"  class="text-center">주소</th>
					<th data-field="vi.VIPHONE"  class="text-center">전화번호</th>
					<th data-field="vi.VICREDAT"  class="text-center">날짜</th>
					<th data-field="vi.VICRETIM"  class="text-center">시간</th>					
					<th data-field="gi.GINAME"  class="text-center">차종</th>
					<th data-field="gi.GIDESC"  class="text-center">구분</th>
				</tr>
			</thead>
			<tbody id="result_tbody">
			</tbody>
		</table>
<select id="s_vendor">
<option value="">회사선택</option>
</select> 
<input type="button" id="vendor" value="회사리스트"/>
		</div>
<div id="result_div" class="container"></div>

	
<script>
$(document).ready(function(){
	
	var a = {
			type : "POST"
		,	url : "/cal/vendor_select.jsp"
    	,   dataType : "json" 
		,	beforeSend:function(xhr){
			xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
		}
		,	data : null
		,	success : function(results){
			for(var i=0, max=results.length;i<max;i++){
	    		var result = results[i];
    	    	$("#s_vendor").append("<option value='" +result.vinum +  "'>" + result.viname + "</option>");
	    	}
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	};
$.ajax(a);
});

$("#vendor").click(function(){
	var vn = $("#vn").val();
	var aaa = {};
	aaa["vn"] = vn;
	aaa = JSON.stringify(aaa);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/cal/goods_select.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : aaa
	    	    ,   success : function(result){
	    	    	    $('#table2').bootstrapTable('destroy');
		    	        $('#table2').bootstrapTable({
		    	            data: result
		    	        });
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		complete : function(e) {
	    		}
	    		};
	$.ajax(a);
});

$("#getCal").click(function(){
	var op = $("#op").val();
	var param = {};
	param["op"] = op;
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/cal/cal_select.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : param
	    	    ,   success : function(result){
	    	    	    $('#table').bootstrapTable('destroy');
		    	        $('#table').bootstrapTable({
		    	            data: result
		    	        });
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		complete : function(e) {
	    		}
	    		};
	$.ajax(a);
});

$("input[id*='cal']").click(function(){
	var id = this.id;
	var idx = id.substring(id.length-1);
	var num1 = $("#num"+ idx + "_1").val();
	var num2 = $("#num"+ idx + "_2").val();

	var param = {};
	param["num1"] = num1;
	param["num2"] = num2;
	param["op"] = ops[idx];
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/cal/cal_ok.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : param
	    	    ,   success : function(result){ 
	    	    	alert(result.insert);
	    	    	$("#result" + idx).val(result.num);  
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		complete : function(e) {
	    		}
	    		};
	$.ajax(a);
});
</script>
</body>
</html>