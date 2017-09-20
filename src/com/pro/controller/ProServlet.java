package com.pro.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if("Insert_For_Pro".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			java.sql.Date datestr = null;
			java.sql.Date dateend = null;
			String condition = "";
			Double discount = null;
			datestr = java.sql.Date.valueOf(req.getParameter("datestr").trim());
			dateend = java.sql.Date.valueOf(req.getParameter("dateend").trim());
			
			if(datestr.equals(dateend) ){
				datestr=new java.sql.Date(System.currentTimeMillis());
				dateend=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("開始結束日期相同");
			}
			
			String style =req.getParameter("style"); 		
				
			if ("money".equals(style)){
				
				try{
					condition = req.getParameter("condition").trim();
					if(condition == null|| (condition.trim()).length() == 0){
						errorMsgs.add("金額請勿空白");
					}
				} catch(NumberFormatException e){
					errorMsgs.add("請輸入數字");
				}
				try{
					discount = new Double(req.getParameter("discount").trim());
				} catch(){
					
				}
			}else{
				
				
			}
				
			}
	}

	
}