<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plogging Community</title>
<!-- header.jspf 불러오기 -->
<%@ include file="../common/header.jspf"%>

<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>

<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b19782161c7ce90da40671e961e586a"></script>

<!-- css / js -->
<link rel="stylesheet" type="text/css" href="/resource/css/main.css">
<script src="/resource/js/datepicker.js"></script>
</head>
<body>
<article>
	<section id="search-wrap">
	  <form action="/history/list" method="POST" id="search-form">
	  		<select name="hashtag">
            	<option value="0">전체 선택</option>
            	<option value="1">매우 쉬움</option>
            	<option value="2">쉬움</option>
            	<option value="3">보통</option>
            	<option value="4">어려움</option>
            	<option value="5">매우 어려움</option>
            </select>	
	  	    <input id="datepicker" name="pDate" placeholder="yyyy-mm-dd"/>
	  	    <button type="submit" class="search-btn">검색</button>
	  </form>  
	</section>
	
	<section id="map-wrap">
		<div id="map" style="width:100%;height:350px;"></div>
	</section>
</article>


<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function () {
	// 페이지 로딩 시 날짜 선택 캘린더 불러오기
	$('#datepicker').datepicker();
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(36.349078175747444, 127.38508945191273), // 지도의 디폴트 중심좌표
    level: 6 // 지도의 디폴트 확대 레벨
};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);
</script>

</body>
</html>