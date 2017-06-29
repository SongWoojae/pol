package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class UserDAO {
	public List<HashMap> doSelect(String sql) throws SQLException,ClassNotFoundException {
		List<HashMap> userlist = new ArrayList<HashMap>();
		try {
			Connection con = DBConn2.getCon();
			PreparedStatement prestmt = con.prepareStatement(sql);
			ResultSet rs = prestmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int rowNum =1;
			while (rs.next()) {
				//System.out.println(rowNum + "번째 로우");
				HashMap hm = new HashMap();
				int colCount = rsmd.getColumnCount();
				for(int i=1;i<=colCount;i++){
					String colName = rsmd.getColumnName(i);
					hm.put(colName, rs.getString(colName));
				}
				userlist.add(hm);
			}
			DBConn2.closeCon();
			return userlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
//	public boolean insertUser() {
//		try {
//			Connection con = DBConn2.getCon();
//		
//			HashMap<String, String>hm = new HashMap<String, String>();
//			hm.put("num", "3");
//			
//			hm.put("id", "green");
//			
//			hm.put("pwd", "green" );
//			
//			hm.put("name", "녹길동");
//			
//			hm.put("age", "22" );
//			
//			String sql = "insert into user_info(id,pwd,name,age) values(?,?,?,?,?)";
//			PreparedStatement prestmt = con.prepareStatement(sql);
//			prestmt.setString(1, hm.get("num"));
//			prestmt.setString(2, hm.get("id"));
//			prestmt.setString(3, hm.get("pwd"));
//			prestmt.setString(4, hm.get("name"));
//			prestmt.setString(5, hm.get("age"));
//			int result = prestmt.executeUpdate();
//			DBConn2.closeCon();
//			if (result > 0) {
//				return true;
//			}
//
//		} catch (SQLException | ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//		return false;
//
//	}
	
	public static void main(String[] args) throws SQLException,ClassNotFoundException{
		UserDAO ud = new UserDAO();
		String sql = "select class_num, class_name from class_info";
		List<HashMap> userList = ud.doSelect(sql);
		System.out.println(" = class_info List = ");
		for(HashMap hm : userList){
			System.out.println(hm);
		}
		sql = "select num, id, pwd, name, age, class_num from user_info";
		userList = ud.doSelect(sql);
		System.out.println(" = user_info List = ");
		for(HashMap hm : userList){
			System.out.println(hm);
		
		}
		sql = "select ui.num, ui.id, ui.pwd, ui.name, ui.age, ci.class_num, ci.class_name rom user_info as ui, class_info as ci where ci.class_num = ui.class_num";
		userList = ud.doSelect(sql);
		System.out.println(" = user_info class_info List = ");
		for(HashMap hm : userList){
			System.out.println(hm);
		
		}
	}
}
