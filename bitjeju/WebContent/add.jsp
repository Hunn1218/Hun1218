<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jspf" %>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	dl{
		border:1px solid gray;
		width: 800px;
		margin: 1px auto;
		text-align: center;
	}
	dl>dt,dl>dd,dl>dd>div{
		display: inline-block;
		margin-left: auto;
	}
	.table_main{
		margin-top: 30px;
	}
	.search{
		padding-left: 300px;
	}
	#footer{
		margin-top: 100px;
	}
</style>
<title>고객센터 입력페이지</title>
</head>
<body>
<%@ include file="template/header.jspf" %>
<%@ include file="template/menu.jspf" %>
   <div id="contents">
       <!--*****************비트캠프 메뉴******************-->
   	<div class="grid2">
        <div id="menuer">
        </div>
       </div>
        <!--*****************비트캠프 메뉴******************-->
       <div  id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
		<form action="add.bit" method="post">
			<table id="botice_add">
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" name="title" id="title"/></td>
					</tr>
					<tr>
						<th><label for="name">작성자</label></th>
						<td><input type="text" name="name" id="name" /></td>
					</tr>
					<tr>
						<th><label for="contents">내용</label></th>
						<td><input type="text" name="contents" id="contents" /></td>
					</tr>
				</table>
		<div>
			<button type="submit">입력</button>
			<button type="reset">취소</button>
			<button type="button" onclick="history.back();">뒤로</button>
		</div>
	</form>
       <!--*************content end******************-->
       </div>
<%@ include file="template/footer.jspf" %>
</body>
</html>