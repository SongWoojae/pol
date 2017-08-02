<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.test.common.DBConn2"%>
    
<script>

	var list = [{"result":"4","calnum":"6","op":"+","num1":"2","num2":"2"},
   {"result":"4","calnum":"7","op":"+","num1":"2","num2":"2"},
   {"result":"1","calnum":"8","op":"-","num1":"4","num2":"3"},
   {"result":"6","calnum":"9","op":"*","num1":"2","num2":"3"},
   {"result":"2","calnum":"10","op":"/","num1":"10","num2":"5"}];
$("#getCal").click(function(){
   for(var i=0, max=list.length;i<max;i++){
      var m = list[i];
      alert(m.result);
   }
});
</script>