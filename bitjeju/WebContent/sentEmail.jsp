<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: 비밀번호 찾기</title>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom:1px solid #e4e4e4;
}
#deletedform{
	margin-bottom:500px;
}
#accounttable{
	border-collapse:collapse;
}
#accounttable tr{
}
#accounttable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#accounttable td{
	padding:25px;
	text-align:left;
}
#accountedit,#accountdelete,#accountback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 20px;
}
#accountback:hover{
		background-color:white;
		color:#000069;
		cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>계정관리</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="accountfind.bit">계정찾기</a></li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<form id="deletedform" action="main.bit">
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>아이디/비밀번호 찾기</h2>
				<h4>&nbsp;</h4>
				<table id="accounttable">
					<tr>
						<td>비밀번호를 이메일로 전송했습니다.</td>
					</tr>
				</table>
			</div>
			<div class="lmscontent">
			<button id="accountdelete" type="submit">뒤로</button>				
			</div>
			</form>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!-- 
-1번라인의 charset, pageEncoding 5번라인의 charset모두 utf-8로 맞춰주세요.
-2번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #gotolms #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->