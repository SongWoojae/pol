package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.service.BoardService;
import com.test.service.UserService;

public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		
//		String name1 = req.getParameter("name");
//		String pwd1 = req.getParameter("pass");
//		String a = req.getParameter("a");
//		System.out.println(name1 + pwd1 + a);
		
		Map<String, String[]> reqMap = req.getParameterMap();
		System.out.println(reqMap);
		Iterator<String> it = reqMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			// System.out.println(key + "," + reqMap.get(key)[0]);
		}
		
		String binum = req.getParameter("binum");
		String bititle = req.getParameter("bititle");
		String bicontent = req.getParameter("bicontent");
		String bipwd = req.getParameter("bipwd");
		String creusr = req.getParameter("creusr");
		if(binum!=null){
			bi.setBiNum(Integer.parseInt(binum));
		}
		bi.setBiTitle(bititle);
		bi.setBicontent(bicontent);
		bi.setBibipwd(bipwd);
		bi.setcreusr(creusr);
		

		String command = req.getParameter("command");

		if (command == null) {
			return;
		}
		BoardService bs = new BoardService();

		if (command.equals("SIGNIN")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String user_num = req.getParameter("user_num");

			System.out.println(title + "," + content + "," + user_num);

			
			if (bs.insertBoard(hm)) {
				doProcess(resq, "저장 완료되었습니다.");
			} else {
				doProcess(resq, "다시 입력하세요");
			}

		} else if (command.equals("DELETE")) {
			String board_num = req.getParameter("board_num");
			System.out.println("삭제할 번호 : " + board_num);

			if (bs.deleteBoard(Integer.parseInt(board_num))) {

				doProcess(resq, "삭제 완료되었습니다!!");
			} else {
				doProcess(resq, "다시 입력하세요");
			}
		} else if (command.equals("UPDATE")) {

			String board_num = req.getParameter("board_num");
			System.out.println("수정 할 게시물 번호 : " + board_num);
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String user_num = req.getParameter("user_num");

			HashMap hm = new HashMap();

			hm.put("title", title);
			hm.put("content", content);
			hm.put("user_num", user_num);
			hm.put("board_num", board_num);

			if (bs.updateBoard(hm)) {
				doProcess(resq, "업데이트 완료 되었습니다.");
			} else {
				doProcess(resq, "다시 입력해주세요");
			}
		} else if (command.equals("SELECT")) {
			String title = req.getParameter("title");
			System.out.println("게시물 제목 : " + title);
			HashMap hm = new HashMap();
			if (title != null && !title.equals("")) {
				hm.put("title", "%" + title + "%");
			}
			List<Map> boardList = bs.selectBoard(hm);
			String result = "<script>";
			
			result += "function deleteBoard(board_num)";
			result += "location.href='delete.board?command=DELETE&board_num' + board_num";
			result += "}";
			result += "</script>";
			result += "<form action='1.board'>";
			result += "제목 : <input type='text' name='title' id='title'/><input type='submit' value='검색'/>";
			result += "<input type='hidden' name='command' value='SELECT'/>";
			result += "</form>";
			result += "<table border='1'>";
			result += "<tr>";
			result += "<td>게시물번호</td>";
			result += "<td>제목</td>";
			result += "<td>내용</td>";
			result += "<td>유저번호</td>";
			result += "<td>삭제버튼</td>";
			result += "</tr>";
			
			
			for (Map m : boardList) {
				//result += m.toString();
				result += "<tr align='center'>";
				result += "<td>" + m.get("board_num") + "</td>";
				result += "<td>" + m.get("title") + "</td>";
				result += "<td>" + m.get("content") + "</td>";
				result += "<td>" + m.get("user_num") + "</td>";
				result += "<td><input type='button' value='삭제' onclick='deleteBoard(" + m.get("board_num") +")'/></td>";
				result += "</tr>";
			}
			result += "</table>";
			doProcess(resq, result);

		}

	}

	public void dePost(HttpServletRequest req, HttpServletResponse reqs) throws IOException {

	}

	public void doProcess(HttpServletResponse resq, String writeStr) throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);

	}
}