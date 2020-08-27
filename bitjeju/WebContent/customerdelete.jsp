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
$(function(){
	$('#title,#name,#witme,#content').prop('readonly',true);
	$('form').one('submit',function(){ 
		$('#title,#name,#witme,#content').prop('readonly',false);
		$('form').find('input').css('border-width','2px');
		$('form').find('button').eq(1).text('취소');
		$('form').off('reset',del);
		$('#content h2').text('수정페이지');
		return false;
	});
	$('form').on('reset',del);
});
</script>
<style type="text/css">

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
       <form method="post">
    	<table>
    		<tr>
    			<th>제목</th>
    			<td><input type="text" name="title" id="title" value="${bean.title }"/></td>
    		</tr>	
    		<tr>
    			<th>작성자</th>
    			<td><input type="text" name="name" id="name" value="${bean.name }"/></td>
    		</tr>		
    		<tr>
    			<th>날짜</th>
    			<td><input type="text" name="wtime" id="wtime" value="${bean.wtime }"/></td>
    		</tr>	
    		<tr>
    			<th>내용</th>
    			<td><input type="text" name="content" id="content" value="${bean.content }"/></td>
    		</tr>	
    	</table>
		</form>
		<div>
			<button type="submit">수정</button>
			<button type="button" onclick="history.back();">뒤로</button>
		</div>
       <!--*************content end******************-->
       </div>
<%@ include file="template/footer.jspf" %>
</body>
</html>