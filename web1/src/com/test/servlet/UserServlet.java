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

import com.test.dto.UserInfo;
import com.test.service.UserService;

public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");

		// String name1 = req.getParameter("name");
		// String pass1 = req.getParameter("pass");
		//
		// System.out.println("아이디 : "+ name1 + " 비밀번호 " + pass1);

		Map<String, String[]> reqMap = req.getParameterMap();
		System.out.println(reqMap);
		Iterator<String> it = reqMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			// System.out.println(key + "," + reqMap.get(key)[0]);
		}
		
		String userNum = req.getParameter("usernum");
		String userId = req.getParameter("userid");
		String userPwd = req.getParameter("userpwd");
		String userName = req.getParameter("username");
		String address = req.getParameter("address");
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		String age = req.getParameter("age");
		UserInfo ui = new UserInfo();
		if(userNum!=null){
			ui.setUserNum(Integer.parseInt(userNum));
		}
		ui.setUserId(userId);
		ui.setUserPwd(userPwd);
		ui.setUserName(userName);
		ui.setAddress(address);
		ui.setHp1(hp1);
		ui.setHp2(hp2);
		ui.setHp3(hp3);
		if(age!=null){
			ui.setAge(Integer.parseInt(age));
		}
		
		// html화면에서 던진 값을 각각 String 변수로 받기 시작
		String command = req.getParameter("command");
		if (command == null) {
			return;
		}
		UserService us = new UserService();
		if (command.equals("LOGIN")){
			String result = us.loginUser(ui);
			doProcess(resq, result);

			//HashMap hm = new HashMap();
			// html화면에서 던진 id값을 "id"라는 키로 해쉬맵에 저장
			//hm.put("userid", userId);
			// html화면에서 던진 pwd값을 "pwd"라는 키로 해쉬맵에 저장
			//hm.put("userpwd", userPwd);
			//String result = us.loginUser(hm);
			//doProcess(resq, result);
		}

		// UserService에 있는 insertUser(HashMap hm)이라는 함수를 호출하기 위해
		// UserService로 us 레퍼런스 변수를 생성
		
		else if (command.equals("SIGNIN")) {
	
			// html화면에서 던진 name값을 "name"라는 키로 해쉬맵에 저장
		//	hm.put("username", username);
			// html화면에서 던진 class_num값을 "class_num"라는 키로 해쉬맵에 저장
		//	hm.put("address", address);
			// html화면에서 던진 age값을 "age"라는 키로 해쉬맵에 저장
		//	hm.put("hp1", hp1);
			//hm.put("hp2", hp2);
			//hm.put("hp3", hp3);
			//hm.put("age", age);
			// 위에서 생성한 us레퍼런스 변수를 사용해 insertUser함수를 호출하는데 파라메터값은
			// 위에서 생성하고 값을 저장한 HashMap인 hm레퍼런스 변수를 같이 던짐
			if (us.insertUser(ui)) {
				doProcess(resq, "저장 잘 됬꾸만!!!!");
			} else {
				doProcess(resq, "값 똑바로 입력 안하냐잉~");
			}
		} else if (command.equals("DELETE")) {		
			boolean isDelete = us.deleteUser(ui);
			String result = "";

			if (isDelete) {
				result = "삭제 완료 되었습니다.";
				// doProcess(resq, "= 삭제 완료 =");
			} else {
				result = "삭제 실패하였습니다.";
				// doProcess(resq, "값 다시 입력");
			}
			doProcess(resq, result);

		} else if (command.equals("UPDATE")) {
			boolean isUpdate = us.updateUser(ui);
			String result ="";
			if(isUpdate){
				result = "수정 완료되었습니다";
			}else{
				result = "수정 실패하였습니다.";
			}
			doProcess(resq, result);

			// 해쉬맵 생성
			//HashMap hm = new HashMap();

			// html화면에서 던진 name값을 "name"라는 키로 해쉬맵에 저장
			//hm.put("name", name);
			// html화면에서 던진 class_num값을 "class_num"라는 키로 해쉬맵에 저장
			//hm.put("class_num", class_num);
			// html화면에서 던진 age값을 "age"라는 키로 해쉬맵에 저장
			//hm.put("age", age);

			//hm.put("user_num", user_num);

		} else if (command.equals("SELECT")) {
			
			System.out.println("이름 : " + userName);
				
			if (userName != null && !userName.equals("")) {
				ui.setUserName("%" + userName + "%");
				//hm.put("name", "%" + name + "%");
			}
			List<UserInfo> userList = us.selectUser(ui);
			String result = "번호{/}이름{/}아이디{/}나이{+}";
			result += "dis{/}en{/}en{/}en{+}";
			
			for (UserInfo ui2 : userList) {
				result += ui2.getUserNum() + "{/}" + ui2.getUserName() + "{/}" + ui2.getUserId() + "{/}" + ui2.getAge() +  "{+}";						
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