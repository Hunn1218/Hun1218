package com.bitjeju.customer;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.model.NoticeDao;
import com.bitjeju.model.NoticeDto;

@WebServlet("/detail.bit")
public class CustomerDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		int ntnum=Integer.parseInt(req.getParameter("idx"));
		try {
			NoticeDao dao = new NoticeDao();
			NoticeDto bean = dao.selectOne(ntnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
	/*	req.setCharacterEncoding("utf-8");
		int ntnum=Integer.parseInt(req.getParameter("ntnum"));
		String title=req.getParameter("title").trim();
		String name=req.getParameter("name").trim();
		String content=req.getParameter("content").trim();
		
		
		try {
			NoticeDao dao = new NoticeDao();
			dao.updateOne(ntnum, title,content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect("customercenter.bit");*/
	}
	
}
