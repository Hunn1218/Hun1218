<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%  request.setCharacterEncoding("UTF-8");
		Class.forName("com.oracle.jdbc.Driver");
		String url = "jdbc:oracle://localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		String title = request.getParameter("title");    // �Ѿ�� ������ �� ����
		String content = request.getParameter("content"); // �Ѿ�� �۳��� �� ����



	     try{

	       Connection conn = DriverManager.getConnection(url, user, password);    // ���� DB �����õ�



	       String sql = "insert into notice(title, content) values(?,?)"; // insert ������

	       PreparedStatement pstmt = conn.prepareStatement(sql);



	       pstmt.setString(1, title);

	       pstmt.setString(2, content);



	       pstmt.execute();

	       pstmt.close();

	     }catch(SQLException e){

	       out.println(e.toString());

	     }

	  %>

	  <script>

	    alert("�Խñ��� �Է� �Ǿ����ϴ�.");

	    window.location.href="List.jsp";

	  </script>
</body>
</html>