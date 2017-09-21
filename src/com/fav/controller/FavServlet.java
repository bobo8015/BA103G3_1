package com.fav.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;


import com.fav.model.FavService;
import com.fav.model.FavVO;

public class FavServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
//		System.out.println(action);
//		System.out.println(mem_no);
		
	if("getAll_For_Fav".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			FavService favSvc = new FavService();
			List<FavVO> favVO = favSvc.getoneFav(mem_no);
			
			if(favVO == null){
				errorMsgs.add("查無最愛店家");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/fav/member_favorite.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			req.setAttribute("favVO", favVO); // 資料庫取出的favVO物件,存入req
			String url = "/fav/member_favorite.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
	if("delete_For_Fav".equals(action)){
		List<String> errorMsgs = new LinkedList<String>();
		
		req.setAttribute("errorMsgs", errorMsgs);
		
		try{
			String str_no = new String(req.getParameter("str_no"));
			
			FavService favSvc = new FavService();
			System.out.println(action);
			System.out.println(mem_no);
			System.out.println(str_no);
			favSvc.deleteFav(mem_no,str_no);
			
			String url = "/fav/member_favorite.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		} catch(Exception e){
			errorMsgs.add("刪除資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/fav/member_favorite.jsp");
			failureView.forward(req, res);
		}
		
	}
	
	if("insert_For_Fav".equals(action)){
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);
		
		try{String str_no = new String(req.getParameter("str_no"));
			
			FavVO favVO = new FavVO();
			
			favVO.setMem_no(mem_no);
			favVO.setStr_no(str_no);
			
			FavService favSvc = new FavService();
			
			favVO = favSvc.addFav(mem_no, str_no);
			
			String url = "/search/serarch.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);	
			
			
		}catch(Exception e){
			errorMsgs.add(e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/search/serarch.jsp");
			failureView.forward(req, res);
			
		}
	}
	
}
	
	
	
	
	
	}