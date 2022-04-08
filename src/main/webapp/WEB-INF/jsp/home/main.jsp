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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b19782161c7ce90da40671e961e586a&libraries=drawing"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resource/css/main.css">
</head>
<body>
<article>
	<section id="tools-section">
	  <div id="tools-wrap">	
	  	<form action="/history/list" method="POST" id="filter-tools">
  		  <div id="filter-select">
  		  	<select name="difficulty">
	          	<option value="0">전체 선택</option>
	          	<option value="1">매우 쉬움</option>
	          	<option value="2">쉬움</option>
	          	<option value="3">보통</option>
	          	<option value="4">어려움</option>
	          	<option value="5">매우 어려움</option>
         	</select>
  		  </div>
  		  <div id="filter-date">
	  	    <input id="datepicker" name="pDate" placeholder="yyyy-mm-dd"/>
  		  </div>
  	      <button type="submit" class="search-btn">검색</button>
	  	</form>
	  	<div id="drawing-tools">
		    <button onclick="selectOverlay('POLYGON')">영역 추가</button>
	  	</div>
	  </div>
	</section>
	
	<section id="map-wrap">
		<div id="map"></div>
	</section>
</article>


<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function () {
	// 페이지 로딩 시 날짜 선택 캘린더 불러오기
	$('#datepicker').datepicker();
});

// 지도를 표시할 영역 선택
const mapContainer = document.getElementById('map'),  
mapOption = { 
    center: new kakao.maps.LatLng(36.349078175747444, 127.38508945191273), // 지도의 디폴트 중심좌표
    level: 6 // 지도의 디폴트 확대 레벨
};

// 지도 생성
const map = new kakao.maps.Map(mapContainer, mapOption);

// 지도 줌 컨트롤 생성
const zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// Drawing Manager 생성
let manager;
// Drawing Manager로 새로 그린 도형의 좌표를 담을 배열
let newPolygonPath = [];

</script>

<!-- 날짜 선택 캘린더 생성 js -->
<script src="/resource/js/datepicker.js"></script>
<!-- 사각형, 다각형 그리기 js -->
<script src="/resource/js/maps-drawing.js?map=${map}&manager=${manager}&newPolygonPath=${newPolygonPath}"></script>
<!-- 오버레이 생성 js -->
<script src="/resource/js/maps-overlay.js?map=${map}&manager=${manager}"></script>
</body>
</html>