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

public class BoardService {
	Connection con = null;
	PreparedStatement ps = null;

	public boolean insertBoard(HashMap<String, String> hm) {
		try {
			con = DBConn2.getCon();
			String sql = "insert into board(title,content,user_num)";
			sql += "values(?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("title"));
			ps.setString(2, hm.get("content"));
			ps.setString(3, hm.get("user_num"));

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

	public boolean deleteBoard(int num) {
		try {
			con = DBConn2.getCon();
			String sql = "delete from board where board_num= ? ";
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

	public boolean updateBoard(HashMap<String, String> hm) {
		try {

			con = DBConn2.getCon();

			String sql = "update board set title=?, content=?, user_num=? where board_num=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, hm.get("title"));
			ps.setString(2, hm.get("content"));
			ps.setString(3, hm.get("user_num"));
			ps.setString(4, hm.get("board_num"));

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

	public List<Map> selectBoard(HashMap<String, String> hm) {
		try {
			String sql = "select title,content,user_num for board";
			if (hm.get("title") != null) {
				sql += "where board like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if (hm.get("title") != null) {
				ps.setString(1, hm.get("title"));
			}
			ResultSet rs = ps.executeQuery();
			List boardList = new ArrayList();
			while (rs.next()) {
				HashMap hm1 = new HashMap();
				hm1.put("board_num", rs.getString("board_num"));
				boardList.add(hm1);
			}
			return boardList;
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
