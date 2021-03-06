package com.bitjeju.lms.teacher.att.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.teacher.att.model.AttendanceDao;
import com.bitjeju.lms.teacher.att.model.AttendanceDto;
import com.bitjeju.member.MemberDto;



@WebServlet("/lmsteacherattsearchbyname.bit")
public class AttSearchByNameController extends HttpServlet {
	HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		   request.setCharacterEncoding("utf-8");
		   MemberDto bean2=(MemberDto) session.getAttribute("login");
		   int num=bean2.getNum();
		   System.out.print("num: "+num);
		String name=null;
		request.setCharacterEncoding("utf-8");
		try {
			name = request.getParameter("name").trim();
			AttendanceDao dao=new AttendanceDao();
			ArrayList<AttendanceDto> list=dao.selectName(name,num);
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("teacherAttList.jsp").forward(request, response);
		
	}

}