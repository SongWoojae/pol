package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.test.dto.Goods;

public class GoodsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String resultStr = "";
		doProcess(response, resultStr);
	}
		


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		 Gson g = new Gson();
		 Type listType = new TypeToken<ArrayList<Goods>>(){}.getType();
		 
		 List<Goods> goodsList = g.fromJson(request.getReader(), listType);
		 for(Goods gs : goodsList){
			 System.out.println(gs);
		 }
		 
		 String jsonStr = g.toJson(goodsList);
		 doProcess(response,jsonStr);
		 
		 /*
		 HashMap<String, String> hm = g.fromJson(request.getReader(), HashMap.class);
		 Set<String> keys = hm.keySet();
		 for(String key:keys){
			 System.out.println(key + "=" + hm.get(key));
			 }
			 */
		 }

	

	public void doProcess(HttpServletResponse request, String writeStr) throws IOException {
		request.setContentType("text/html; charset = UTF-8");
		
		PrintWriter out = request.getWriter();
		out.print(writeStr);

	}
}