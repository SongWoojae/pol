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
import com.test.dto.BoardInfo;

public class BoardService {
	Connection con = null;
	PreparedStatement ps = null;

	public boolean insertBoard(BoardInfo bi) {
		try {
			con = DBConn2.getCon();
			String sql = "insert into board(bititle, bicontent, bipwd, creusr)";
			sql += "values(?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, bi.getBiTitle());
			ps.setString(2, bi.getBiContent());
			ps.setString(3, bi.getbipwd());
			ps.setString(4, bi.getcreusr());

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

	public boolean deleteBoard(BoardInfo bi) {
		try {
			con = DBConn2.getCon();
			String sql = "delete from board where binum= ? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bi.getBiNum());

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

	public boolean updateBoard(BoardInfo bi) {
		try {

			con = DBConn2.getCon();

			String sql = "update board set bititle=?, bicontent=?, bipwd=? creusr=? where binum=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, bi.getBiTitle());
			ps.setString(2, bi.getBiContent());
			ps.setString(3, bi.getbipwd());
			ps.setString(4, bi.getcreusr());
			ps.setInt(5, bi.getBiNum());

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

	public List<BoardInfo> selectBoard(BoardInfo bi) {
		try {
			String sql = "select board_num, title,content,user_num for board";
			if (hm.get("title") != null) {
				sql += "where title like ?";
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
				hm1.put("title", rs.getString("title"));
				hm1.put("content", rs.getString("content"));
				hm1.put("user_num", rs.getString("user_num"));
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
