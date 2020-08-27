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
	dl>dt{
		width: 100px;
	}
	dl>dd{
		width: 600px;
	}
	dl>dd>div{
		 padding-left: 155px;
	}
	.table_main{
		margin-top: 30px;
	}
	.search{
		padding-left: 300px;
	}
	#footer{
		margin-top: 300px;
	}
</style>
<title>Insert title here</title>
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
       <div id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
    	<table>
    		<tr>
    			<th>제목</th>
    			<td>${bean.title }</td>
    		</tr>	
    		<tr>
    			<th>작성자</th>
    			<td>${bean.name }</td>
    		</tr>		
    		<tr>
    			<th>날짜</th>
    			<td>${bean.wtime }</td>
    		</tr>	
    		<tr>
    			<th>내용</th>
    			<td>${bean.content }</td>
    		</tr>	
    	</table>
		<div>
			<button type="button" onclick="history.back();">목록</button>
		</div>
       <!--*************content end******************-->
       </div>
<%@ include file="template/footer.jspf" %>
</body>
</html>