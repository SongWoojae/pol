package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.common.DBConn2;

public class UserService {
	Connection con = null;
	PreparedStatement ps = null;

	public boolean insertUser(HashMap<String, String> hm) {
		try {
			con = DBConn2.getCon();
			String sql = "insert into user_info(userid,userpwd, username, address,hp1, hp2, hp3, age)";
			sql += "values(?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("userid"));
			ps.setString(2, hm.get("userpwd"));
			ps.setString(3, hm.get("username"));
			ps.setString(4, hm.get("address"));
			ps.setString(5, hm.get("hp1"));
			ps.setString(6, hm.get("hp2"));
			ps.setString(7, hm.get("hp3"));
			ps.setString(8, hm.get("age"));

			int result = ps.executeUpdate();
			if (result == 1) {
				con.commit();
				return true;
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public boolean deleteUser(HashMap<String, String> hm) {
		try {
			con = DBConn2.getCon();
			String sql = "delete from user_info where usernum = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("usernum"));

			int result = ps.executeUpdate();
			if (result == 1) {
				con.commit();
				return true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public boolean updateUser(HashMap<String, String> hm) {
		try {
			String sql = "update user_info set user_name= ?, class_num= ?, age = ? where user_num= ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("name"));
			ps.setString(2, hm.get("class_num"));
			ps.setString(3, hm.get("age"));
			ps.setString(4, hm.get("user_num"));

			int result = ps.executeUpdate();
			if (result == 1) {
				con.commit();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public String checkPwd(String pwd1, String pwd2){
		if(pwd1.equals(pwd2)){
			return "로그인 성공";
		}
		return "비밀번호가 틀렸습니다!";
	}
	public String loginUser(HashMap<String, String> hm){
		try{
			con = DBConn2.getCon();
			String sql = "select userpwd from user_info where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("userid"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String userpwd = rs.getString("userpwd");
				return checkPwd(userpwd, hm.get("userpwd"));
			}
		}catch(Exception e){
			
		}
		return "아이디가 존재하지 않습니다";
	}

	public List<Map> selectUser(HashMap<String, String> hm) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select usernum,userid,username,age,address,hp1,hp2,hp3,userpwd from user_info";
			if (hm.get("name") != null) {
				sql += " where username like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if (hm.get("name") != null) {
				ps.setString(1, hm.get("name"));
			}
			ResultSet rs = ps.executeQuery();
			List userList = new ArrayList();
			while (rs.next()) {
				HashMap hm1 = new HashMap();
				hm1.put("usernum", rs.getString("usernum"));
				hm1.put("userid", rs.getString("userid"));
				hm1.put("username", rs.getString("username"));
				hm1.put("age", rs.getString("age"));
				hm1.put("address", rs.getString("address"));
				hm1.put("hp1", rs.getString("hp1"));
				hm1.put("hp2", rs.getString("hp2"));
				hm1.put("hp3", rs.getString("hp3"));
				hm1.put("userpwd", rs.getString("userpwd"));
				userList.add(hm1);
			}
			return userList;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConn2.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
