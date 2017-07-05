package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

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

	public boolean deleteUser(int num) {
		try {
			con = DBConn2.getCon();
			String sql = "delete from user_info where user_num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);

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

}
