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
import com.test.dto.UserInfo;

public class UserService {
	Connection con = null;
	PreparedStatement ps = null;

	public boolean insertUser(UserInfo ui) {
		try {
			con = DBConn2.getCon();
			String sql = "insert into user_info(userid,userpwd, username, address,hp1, hp2, hp3, age)";
			sql += "values(?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserId());
			ps.setString(2, ui.getUserName());
			ps.setInt(3, ui.getAge());
			ps.setString(4, ui.getAddress());
			ps.setString(5, ui.getHp1());
			ps.setString(6, ui.getHp2());
			ps.setString(7, ui.getHp3());
			ps.setString(8, ui.getUserPwd());

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

	public boolean deleteUser(UserInfo ui) {
		try {
			con = DBConn2.getCon();
			String sql = "delete from user_info where usernum = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, ui.getUserNum());

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
	
	public boolean updateUser(UserInfo ui) {
		try {
			String sql = "update user_info ";
			sql += " set userid=?,";
			sql += " username=?,";
			sql += " age=?";
			sql += " where usernum=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserId());
			ps.setString(2, ui.getUserName());
			ps.setInt(3, ui.getAge());
			ps.setInt(4, ui.getUserNum());
			

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
	public String loginUser(UserInfo ui){
		try{
			con = DBConn2.getCon();
			String sql = "select userpwd from user_info where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserId());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String userpwd = rs.getString("userpwd");
				return checkPwd(userpwd, ui.getUserPwd());
			}
		}catch(Exception e){
			
		}
		return "아이디가 존재하지 않습니다";
	}

	public List<UserInfo> selectUser(UserInfo ui) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select usernum,userid,username,age,address,hp1,hp2,hp3,userpwd from user_info";
			if (ui.getUserName() != null && ui.getUserName().equals("")) {
				sql += " where username like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if (ui.getUserName() != null && !ui.getUserName().equals("")) {
				ps.setString(1, ui.getUserName());
			}
			ResultSet rs = ps.executeQuery();
			List userList = new ArrayList();
			while (rs.next()) {
				UserInfo ui2 = new UserInfo();
				ui2.setUserNum(rs.getInt("usernum"));
				ui2.setUserId(rs.getString("userid"));
				ui2.setUserPwd(rs.getString("userpwd"));
				ui2.setUserName(rs.getString("username"));
				ui2.setAddress(rs.getString("address"));
				ui2.setHp1(rs.getString("hp1"));
				ui2.setHp1(rs.getString("hp2"));
				ui2.setHp1(rs.getString("hp3"));
				ui2.setAge(rs.getInt("age"));
				userList.add(ui2);
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
