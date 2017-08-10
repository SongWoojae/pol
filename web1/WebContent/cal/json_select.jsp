<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>

<%
    Gson g = new Gson();
    HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);

   Connection con = null;
   PreparedStatement ps = null;
   ArrayList<Map<String, String>> calList = new ArrayList<Map<String, String>>();
   try{
      con = DBConn2.getCon();
      String sql = "select num, jttext from json_test";
      ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      while(rs.next()){
         Map<String, String>rhm = new HashMap<String, String>();
         rhm.put("num", rs.getString("num"));
         rhm.put("jttext", rs.getString("jttext"));

         calList.add(rhm);
      }
   }catch(Exception e){
      System.out.println(e);
   }finally{
      if(ps!=null){
         ps.close();
         ps = null;
      }
      DBConn2.closeCon();
   }

String json = g.toJson(calList);
System.out.println(json);
out.print(json);
   %>