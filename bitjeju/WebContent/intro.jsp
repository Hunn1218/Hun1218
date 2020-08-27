<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jspf" %>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae7d0ee23b3febdcacf598483653bc52"></script>
<script type="text/javascript">
function Tabs(){
	$('#Tab>.tab_list>li').each(function(idx, ele){ /*하나 누를때마다 눌린 탭과 나머지탭의 border와 배경색, 이벤트 변경, 이미지 로드*/
		$(this).on('click', function(){
			$(this).css('border','1px solid #dddddd')
			.css('border-top-right-radius','10px')
			.css('border-top-left-radius','10px')
			.css('border-bottom','0px soild');
			$('#Tab>.tab_list>li').not($(this))
			.css('border','0px solid')
			.css('border-bottom','1px solid #dddddd');
			
			$(this).css('background-color','white');
			
			$('#Tab>.tab_list>li').not($(this)).on('mouseover',function(){ /*마우스 이벤트*/
					$(this).css('background-color','antiquewhite')
			});
			$('#Tab>.tab_list>li').not($(this)).on('mouseleave',function(){
					$(this).css('background-color','white')
			});
			$('.etcimg').attr('src','img/history'+idx+'.jpg');
		});
	});	
}
function Stu(){
	$('#teacher>.tab_teacher_list>li').each(function(idx, ele){ /*하나 누를때마다 눌린 탭과 나머지탭의 border와 배경색, 이벤트 변경, 이미지 로드*/
		$(this).on('click', function(){
			$(this).css('border','1px solid #dddddd')
			.css('border-top-right-radius','10px')
			.css('border-top-left-radius','10px')
			.css('border-bottom','0px soild');
			$('#teacher>.tab_teacher_list>li').not($(this))
			.css('border','0px solid')
			.css('border-bottom','1px solid #dddddd');
			
			$(this).css('background-color','white');
			
			$('#teacher>.tab_teacher_list>li').not($(this)).on('mouseover',function(){ /*마우스 이벤트*/
					$(this).css('background-color','antiquewhite')
			});
			$('#teacher>.tab_teacher_list>li').not($(this)).on('mouseleave',function(){
					$(this).css('background-color','white')
			});
			$('.stuimg').attr('src','img/stu'+idx+'.png');
		});
	});	
}
function kakaoMap(){
	container = document.getElementById('map');
	options = {
		//center: new kakao.maps.LatLng(33.450701, 126.570667),
		center: new kakao.maps.LatLng(37.503207, 127.024278),
		level: 3
	};

	map = new kakao.maps.Map(container, options);

	markerPosition  = new kakao.maps.LatLng(37.503207, 127.024278); 

	// 마커를 생성합니다
	marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);//marker를 지도에 표시
	
	
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	var iwContent = '<div style="padding:5px;">비트캠프 강남점</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.503207, 127.024278), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
	var infowindow = new kakao.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});



}
$(document). ready(function(){  
	Stu();
	Tabs();
	kakaoMap();
});

</script>
<style type="text/css">
	body{
	
	}
	.bar{
		background-color: darkblue;
		width: 4px;
		height: 18px;
		display: inline;
		vertical-align: middle;
	}
	.text{
		color: darkblue;
		font-size: 18px;
		font-weight: 900;
		margin-left: 20px;
		display: inline;
		vertical-align: middle;
	}
	#Tab{
		height: 70px;/*메뉴 크기*/
        border-top: 1px solid #e4e4e4;
        border-bottom: 1px solid #e4e4e4;
        margin-top: 20px;
        width: 100%;
        border-box
	}
	 #Tab>.tab_list>li{
		list-style: none;
		margin-top: 10px;
    	margin-left: 15px;
    	width: 100px;
    	border: 0px solid white;
    	float: left;
    	text-align: center;
    	font-size: 19px;
    	font-weight: 900;
    	border-style: double;
	} 
	.tab_content{
		display: block;
		border: 1px solid #dddddd;
		margin: 0px auto;
		margin-top: 10px;
		margin-bottom: 40px;
		width: 700px;
		}
	#teacher>.tab_teacher_list>li{
		list-style: none;
		margin-top: 10px;
    	margin-left: 15px;
    	width: 100px;
    	border: 0px solid white;
    	float: left;
    	text-align: center;
	}
	.tab_teacher{
		display: block;
		border: 1px solid #dddddd;
		margin: 0px auto;
		margin-top: 10px;
		margin-bottom: 40px;
		width: 700px;
		} 
	#footer{
		margin-top:800px;
	}
	#map{
		margin-top: 50px;
		width:400px;
		height:300px;
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
            <p class="blind">비트캠프</p>
            <ul class="list">
             		<li>학원 소개</li>
					<li>연혁</li>
					<li>강사진</li>
					<li>오시는길</li>
            </ul>
        </div>
       </div>
        <!--*****************비트캠프 메뉴******************-->
       <div id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
      <div id="intro_table" >
      	<div>
      		<span class="bar">&nbsp;</span>
      		<div class="text" >&nbsp;&nbsp;학원소개</div>
			</table>
		</div>
		<div>
			<span class="bar">&nbsp;</span>
      		<div class="text">&nbsp;&nbsp;연 혁</div>
		</div>
      		<div id="Tab" class="gird12">
      			<ul class="tab_list">
				  <li>2018-2020</li>
				  <li>2015-2017</li>
				  <li>2010-2014</li>
				  <li>2004-2009</li>
				  <li>1990-2003</li>
				</ul>
			</div>	
				<div class="tab_content">
					<img class="etcimg" src="img/history0.jpg"/>
				</div>	
		<div>
			<span class="bar">&nbsp;</span>
      		<div class="text">&nbsp;&nbsp;강사진</div>
		</div>
		<div id="teacher" class="gird12">
			<ul class="tab_teacher_list">
				<li>설민석</li>
				<li>황현민</li>
				<li>정승재</li>
			</ul>
		</div>
		<div class="tab_teacher">
			<img class="stuimg" src="img/stu0.png">
		</div>
		<div>
			<span class="bar">&nbsp;</span>
      		<div class="text">&nbsp;&nbsp;오시는 길</div>
      	</div>
      	<div>	
			<div id="div_map">
		<div id ="map"></div>
		<div id="map_info">
		
		<span>&#124;&nbsp;</span>
		<span>비트캠프 서울시 서초구 강남대로 459
(주)비트컴퓨터 서초본원</span>
		
		</div>
		</div>
	</div>
       <!--*************content end******************-->
       </div>
<%@ include file="template/footer.jspf" %>
</body>
</html>