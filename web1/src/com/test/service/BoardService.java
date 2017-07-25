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
			ps.setString(3, bi.getbiPwd());
			ps.setString(4, bi.getCreusr());

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
			ps.setString(3, bi.getbiPwd());
			ps.setString(4, bi.getCreusr());
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
			String sql = "select binum, bititle,bicontent,bipwd,bicreusr for board";
			if (bi.getBiTitle() != null && bi.getBiTitle().equals("")) {
				sql += "where bititle like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if (bi.getBiTitle() != null && !bi.getBiTitle().equals("")) {
				ps.setString(1, bi.getBiTitle());
			}
			ResultSet rs = ps.executeQuery();
			List boardList = new ArrayList();
			while (rs.next()) {
				BoardInfo bi2 = new BoardInfo();
				bi2.setBiNum(rs.getInt("binum"));
				bi2.setBiTitle(rs.getString("bititle"));
				bi2.setBiContent(rs.getString("bicontent"));
				bi2.setbipwd(rs.getString("bipwd"));
				bi2.setCreusr(rs.getString("creusr"));
				boardList.add(bi2);
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
