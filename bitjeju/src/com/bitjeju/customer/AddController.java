package com.bitjeju.customer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.model.NoticeDao;
import com.bitjeju.model.NoticeDto;

@WebServlet("/add.bit")
public class AddController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("customeradd.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
	
		try {
			NoticeDao dao = new NoticeDao();
			dao.insertOne(title, name, content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("customercenter.bit");
	}
	

}
