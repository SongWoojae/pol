<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn2"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.test.dto.Cal"%>
    
<%
	 Gson g = new Gson();
	Connection con = null;
	PreparedStatement ps = null;
	ArrayList<Map<String, String>> vendorList = new ArrayList<Map<String, String>>();
	try{
		con = DBConn2.getCon();
		String sql = "select vi.VINUM,vi.VINAME, vi.VIDESC, vi.VIADDRESS, vi.VIPHONE, vi.VICREDAT, vi.VICRETIM, gi.GINAME, gi.GIDESC";
		sql += " from vendor_info as vi, goods_info as gi ";
		sql += " where vi.VINUM  = gi.VINUM";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Map<String, String>rhm = new HashMap<String, String>();
			rhm.put("vi.VINUM", rs.getString("vi.VINUM"));
			rhm.put("vi.VINAME", rs.getString("vi.VINAME"));
			rhm.put("vi.VIDESC", rs.getString("vi.VIDESC"));
			rhm.put("vi.VIADDRESS", rs.getString("vi.VIADDRESS"));
			rhm.put("vi.VIPHONE", rs.getString("vi.VIPHONE"));
			rhm.put("vi.VICREDAT", rs.getString("vi.VICREDAT"));
			rhm.put("vi.VICRETIM", rs.getString("vi.VICRETIM"));			
			rhm.put("gi.GINAME", rs.getString("gi.GINAME"));
			rhm.put("gi.GIDESC", rs.getString("gi.GIDESC"));
			
			vendorList.add(rhm);
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

String json = g.toJson(vendorList);
System.out.println(json);
out.print(json);
	%>