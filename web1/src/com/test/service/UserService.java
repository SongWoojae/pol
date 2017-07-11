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
			String sql = "insert into user_info(user_id,user_pwd, user_name, class_num, age)";
			sql += "values(?,?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("id"));
			ps.setString(2, hm.get("pwd"));
			ps.setString(3, hm.get("name"));
			ps.setString(4, hm.get("class_num"));
			ps.setString(5, hm.get("age"));

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
			String sql = "delete from user_info where user_num = ?";
			
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("user_num"));

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

	public List<Map> selectUser(HashMap<String, String> hm) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select user_num, user_id, user_pwd, user_name, class_num from user_info";
			if (hm.get("name") != null) {
				sql += " where user_name like ?";
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
				hm1.put("user_num", rs.getString("user_num"));
				hm1.put("user_id", rs.getString("user_id"));
				hm1.put("user_pwd", rs.getString("user_pwd"));
				hm1.put("user_name", rs.getString("user_name"));
				hm1.put("class_num", rs.getString("class_num"));
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
