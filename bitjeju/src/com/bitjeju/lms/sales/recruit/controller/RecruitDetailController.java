package com.bitjeju.lms.sales.recruit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;

/**
 * Servlet implementation class RecruitDetailController
 */
@WebServlet("/lmssalesrecruitdetail.bit")
public class RecruitDetailController extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
		
		LectureDao dao = new LectureDao();
		LectureDto bean = null;
		try {
			bean = dao.selectOne(lecture_num); //강좌넘버로 강좌정보를 받아옴.
			request.setAttribute("lecture", bean); // 다음페이지에 강좌정보를 전달함
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("salesRecruitDetail.jsp").forward(request, response);
		
	}//doget

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}