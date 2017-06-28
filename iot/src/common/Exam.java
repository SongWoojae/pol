package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Exam {

	public List<String> getUserIDLists(String name) {
		List<String> userlist = new ArrayList<String>();
		try {
			Connection con = DBConn2.getCon();// DB와 연결하는 메소드
			String sql = "select id,pwd,name from user";
			if (!name.equals("")) {
				sql += "where NAME ='" + name + "'";
			}
			PreparedStatement prestmt = con.prepareStatement(sql);// DB에서의 하얀 창
																	// 아직 실행 X
			ResultSet rs = prestmt.executeQuery();// 실행
			while (rs.next()) {
				userlist.add(rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3));
			}
			DBConn2.closeCon();// 연결 끊기
			return userlist;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean insertUser() {
		try {
			Connection con = DBConn2.getCon();
			String sql = "insert into user(id,pwd,name,age) values('blue','blue','청길동',40)";
			PreparedStatement prestmt = con.prepareStatement(sql);
			int result = prestmt.executeUpdate();
			DBConn2.closeCon();
			if (result == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean deleteUser(int num) {

		try {
			Connection con = DBConn2.getCon();
			String sql = "delete from user WHERE num = " + num;
			PreparedStatement prestmt = con.prepareStatement(sql);
			int result = prestmt.executeUpdate();
			DBConn2.closeCon();
			if (result > 0) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public static void main(String[] args) {
		Exam e = new Exam();
		if (e.insertUser()) {
			System.out.println("잘 들어갔네요 유저테이블에");
		}
		boolean isDel = e.deleteUser(1);
		if (isDel) {
			System.out.println("유저테이블에 잘 삭제가 되었네요!");
		}
		List<String> userlist = e.getUserIDLists("");
		for (int i = 0; i < userlist.size(); i++) {
			System.out.println(userlist.get(i));

		}

	}
}
