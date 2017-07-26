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
			String sql = "insert into board(bititle, bicontent, bipwd, creusr, credat)";
			sql += "values(?,?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, bi.getBititle());
			ps.setString(2, bi.getBicontent());
			ps.setString(3, bi.getBipwd());
			ps.setString(4, bi.getCreusr());
			ps.setString(5, bi.getCredat());
			

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
			ps.setInt(1, bi.getBinum());

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

			ps.setString(1, bi.getBititle());
			ps.setString(2, bi.getBicontent());
			ps.setString(3, bi.getBipwd());
			ps.setString(4, bi.getCreusr());
			ps.setInt(5, bi.getBinum());

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
			if (bi.getBititle() != null && bi.getBititle().equals("")) {
				sql += "where bititle like ?";
			}
			con = DBConn2.getCon();
			ps = con.prepareStatement(sql);
			if (bi.getBititle() != null && !bi.getBititle().equals("")) {
				ps.setString(1, bi.getBititle());
			}
			ResultSet rs = ps.executeQuery();
			List boardList = new ArrayList();
			while (rs.next()) {
				BoardInfo bi2 = new BoardInfo();
				bi2.setBinum(rs.getInt("binum"));
				bi2.setBititle(rs.getString("bititle"));
				bi2.setBicontent(rs.getString("bicontent"));
				bi2.setBipwd(rs.getString("bipwd"));
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
