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

import com.test.dto.BoardInfo;
import com.test.dto.UserInfo;
import com.test.service.BoardService;

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
		BoardInfo bi = new BoardInfo();
		if(binum!=null){
			bi.setBiNum(Integer.parseInt(binum));
		}
		bi.setBiTitle(bititle);
		bi.setBiContent(bicontent);
		bi.setbipwd(bipwd);
		bi.setcreusr(creusr);
		

		String command = req.getParameter("command");

		if (command == null) {
			return;
		}
		BoardService bs = new BoardService();

		if (command.equals("SIGNIN")) {
			
			if (bs.insertBoard(bi)) {
				doProcess(resq, "저장 완료되었습니다.");
			} else {
				doProcess(resq, "다시 입력하세요");
			}

		} else if (command.equals("DELETE")) {
			boolean isDelete = bs.deleteBoard(bi);
			String result="";
			if(isDelete){
				result = "삭제 완료되었습니다";
			}else{
				result = "다시 시도하세요";
			}
			doProcess(resq, result);
		} else if (command.equals("UPDATE")) {
			boolean isUpdate = bs.updateBoard(bi);
			String result ="";
			if(isUpdate){
				result = "수정완료";
			}else{
				result = "다시 시도하세요";
			}
			doProcess(resq, result);
		} else if (command.equals("SELECT")) {
			System.out.println("이름 : " + bititle);
			if (bititle != null && !bititle.equals("")) {
				bi.setBiTitle("%" + bititle + "%");
			}
			List<BoardInfo> boardList  = bs.selectBoard(bi);
			String result="번호{/}제목{/}내용{/}글쓴이{+}";
			result+="dis{/}en{/}en{/}en{+}";
			for(BoardInfo bi2 : boardList){
				result += bi2.getBiNum() + "{/}" + bi2.getBiTitle() + "{/}" + bi2.getBiContent() + "{/}" + bi2.getcreusr()+ "{+}"; 
			}
			result = result.substring(0, result.length()-3);
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