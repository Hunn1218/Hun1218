package com.bitjeju.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bitjeju.member.MemberDto;

public class NoticeDao {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public NoticeDao() throws SQLException{
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		conn = DriverManager.getConnection(url, user, password);

	}
	
	public ArrayList<NoticeDto> selectAll(int pageNum) throws SQLException{
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		
		int startNum = 1 + (pageNum - 1) * 5;
		int endNum = 5 + (pageNum - 1) * 5;// 페이지당 게시글 수
		
		String sql = "select * from notice";
		System.out.println(sql);
		NoticeDto bean = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new NoticeDto();
				bean.setNtnum(rs.getInt("ntnum"));
				bean.setTitle(rs.getString("title"));
				bean.setName(rs.getString("name"));
				bean.setNum(rs.getInt("num"));
				bean.setWtime(rs.getDate("wtime"));
				bean.setContent(rs.getString("content"));
				list.add(bean);
			}
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	public NoticeDto selectOne(int ntnum) throws SQLException{
		String sql = "select ntnum,title,name,wtime,content from notice where ntnum=?";
		NoticeDto bean = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ntnum);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				bean = new NoticeDto();
				bean.setNtnum(rs.getInt("ntnum"));
				bean.setTitle(rs.getString("title"));
				bean.setName(rs.getString("name"));
				bean.setWtime(rs.getDate("wtime"));
				bean.setContent(rs.getString("content"));
				return bean;	
			}
		} finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			if(rs!=null)rs.close();
		}
		return bean;
	}
	
	public int deleteNotice(int ntnum) throws SQLException{
		String sql="delete * from notice where ntnum=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ntnum);
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public int UpdateNotice(String title,String content,int ntnum) throws SQLException{
		String sql="update notice set title=?,content=? where ntnum=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, ntnum);
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}

	}
	
	
	public int insertOne(String title, String name, String content) throws SQLException{
		String sql="insert into notice values (notice_seq.nextval,?,?,1,sysdate,?)";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, content);
			System.out.println(sql);
//			rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
}
