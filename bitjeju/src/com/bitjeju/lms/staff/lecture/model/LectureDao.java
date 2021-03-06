package com.bitjeju.lms.staff.lecture.model;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.*;

public class LectureDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public LectureDao() {
		// TODO Auto-generated constructor stub
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} // tryCatch
	}// constructor

	public ArrayList<LectureDto> selectAll() throws SQLException {

		ArrayList<LectureDto> list = new ArrayList<LectureDto>();
	//	String sql = "select * from lectures";
		String sql = "select lecture_name,start_day,end_day,num,lecture_room,lecture_num,recruit_num "
				+ "from lectures full outer join recruit on recruit_num = lecture_num";
		
		//String sql2 ="select lecture_name, st":
		LectureDto bean = null;
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			bean = new LectureDto();
			bean.setLecture_name(rs.getString("lecture_name"));
			bean.setStart_day(rs.getDate("start_day"));
			bean.setEnd_day(rs.getDate("end_day"));
			bean.setNum(rs.getInt("num"));
			bean.setLecture_room(rs.getInt("lecture_room"));
			bean.setLecture_num(rs.getInt("lecture_num"));
			bean.setRecruit_num(rs.getInt("recruit_num"));
			list.add(bean);
		} // while

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return list;
	}// selectAll()

	public LectureDto selectOne(int lecture_num) throws SQLException {
		LectureDto bean = null;
		String sql = "select lecture_name, name, lecture_num, num, lecture_room, start_day, end_day";
		sql += " from lectures natural join member where lecture_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lecture_num);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			bean = new LectureDto();
			bean.setLecture_name(rs.getString("lecture_name"));
			bean.setStart_day(rs.getDate("start_day"));
			bean.setEnd_day(rs.getDate("end_day"));
			bean.setNum(rs.getInt("num"));
			bean.setLecture_room(rs.getInt("lecture_room"));
			bean.setLecture_num(rs.getInt("lecture_num"));
			bean.setName(rs.getString("name"));
		} // while
		if (pstmt != null)
			pstmt.close();
		
		String sql2 = "select * from recruit where recruit_num = ?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, lecture_num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bean.setRecruit_num(rs.getInt("recruit_num"));
		}
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return bean;
	}// selectOne

	public void insertLecture(String lecture_name, Date start_day, Date end_day, String name, int lecture_room)
			throws SQLException {
		/*
		 * insert into lectures values
		 * ('산업기사취득과정A',sysdate,sysdate,22,401,lectures_seq.nextval);
		 * 
		 * (select num from member where name = ?) 강사의 이름으로 회원테이블에서 회원번호를 받아서 강좌테이블에
		 * 회원번호를 추가
		 */
		// String sql = "insert into lectures values
		// (?,?,?,name,?,lectures_seq.nextval);";
		String sql2 = "select num from member where name = ?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		int num = -1;
		if (rs.next()) {
			num = rs.getInt("num");
		}
		if (pstmt != null)
			pstmt.close();
		/*
		 * String sql = "insert into lectures values ('" + lecture_name + "','" +
		 * start_day + "','" + end_day + "'," + num + "," + lecture_room +
		 * ",lectures_seq.nextval)";
		 */

		String sql = "insert into lectures values (?,?,?," + num + ",?,lectures_seq.nextval)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, lecture_name);
		pstmt.setDate(2, start_day);
		pstmt.setDate(3, end_day);
		pstmt.setInt(4, lecture_room);

		System.out.println(sql);
		pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}// insert
	
	public void deleteLecture(String lecture_name, int lecture_num) throws SQLException {
		String sql ="delete from lectures where lecture_name=? and lecture_num=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lecture_name);
		pstmt.setInt(2, lecture_num);		
		System.out.println(sql);
		pstmt.executeQuery();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}//delete
	
	public void updateLecture(int lecture_num,String lecture_name,Date start_day,Date end_day, String name, int lecture_room) throws SQLException {
		String sql = "update lectures set lecture_name=?,start_day=?,end_day=?,";
			   sql+= "num=(select num from member where name = ?),lecture_room=? where lecture_num = ?";
			   			//회원테이블에서 강사의 회원번호를 받아서 update함
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, lecture_name);
	    pstmt.setDate(2, start_day);
	    pstmt.setDate(3, end_day);
	    pstmt.setString(4, name);
	    pstmt.setInt(5, lecture_room);	
	    pstmt.setInt(6, lecture_num);
	    
		System.out.println(sql);
		pstmt.executeQuery();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}//update
	
	public ArrayList<String> selectTeacher() throws SQLException{
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select name from member where lvl=3";
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			list.add(rs.getString("name")); //강사명을 리스트에 추가
		}//while
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return list;
	}//selectTeacher
	
	public void updateLectureToteacher(String name, String lecture_name) throws SQLException {
		String sql = "update member set lecture = ? where name=? and lvl=3";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lecture_name);
		pstmt.setString(2, name);
		pstmt.executeQuery(); //강사의 과목컬럼에 개설하는 렉쳐 추가.
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		
	}//updateLecturenametoTeacher
	
	public LectureDto selectInfo(int num) throws SQLException{
		LectureDto bean=null;
		String sql="select lecture_name,start_day,end_day,lecture_room,name from member full outer join lectures "
				+ "on member.num=lectures.num where lecture_name = (select lecture from member where num = ?)";
		System.out.println(sql);
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		try{
			while(rs.next()){
				bean=new LectureDto();
				bean.setLecture_name(rs.getString("Lecture_name"));
				bean.setStart_day(rs.getDate("start_day"));
				bean.setEnd_day(rs.getDate("end_day"));
				bean.setName(rs.getString("name"));
				bean.setLecture_room(rs.getInt("lecture_room"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return bean;
	}

	
}//classEnd