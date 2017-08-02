<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="java.sql.*"%>
<%
Gson g = new Gson();
HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);
String numStr1 = hm.get("num1");
String numStr2 = hm.get("num2");
int num1 = Integer.parseInt(numStr1);
int num2 = Integer.parseInt(numStr2);
String op = hm.get("op");

int result = 0;
switch (op){
case "+" : 
	result = num1 + num2;
	break;
case "-" : 
	result = num1 - num2;
	break;
case "*" : 
	result = num1 * num2;
	break;
case "/" : 
	result = num1 / num2;
	break;
}
int insertResult = 0;

Connection con = null;
PreparedStatement ps = null;


try{
	 con = DBConn2.getCon();
	String sql ="insert into cal(num1,op,num2,result) values(?,?,?,?)";
	 ps = con.prepareStatement(sql);
	ps.setInt(1,num1);
	ps.setString(2, op);
	ps.setInt(3, num2);
	ps.setInt(4, result);
	insertResult = ps.executeUpdate();
	
		con.commit();
	
}catch(Exception e){
	out.println(e);	
}finally{
	
	ps.close();
	con.close();
	DBConn2.closeCon();
}

HashMap<String, Integer> resultMap = new HashMap<String,Integer>();
resultMap.put("num", result);
String json = g.toJson(resultMap);
System.out.println(json);
out.print(json);
%>