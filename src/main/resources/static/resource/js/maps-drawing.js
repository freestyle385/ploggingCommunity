// 파라미터 받아오기
function scriptQuery() {
	var script = document.getElementsByTagName('script');
	script = script[script.length - 1].src
		.replace(/^[^\?]+\?/, '')
		.replace(/#.+$/, '')
		.split('&');
	var queries = {}
		, query;
	while (script.length) {
		query = script.shift().split('=');
		queries[query[0]] = query[1];
	}
	return queries;
}

// Drawing Manager 옵션
var options = {
	map: map,
	drawingMode: [
		kakao.maps.drawing.OverlayType.POLYGON
	],
	guideTooltip: ['draw', 'drag', 'edit'],
	polygonOptions: {
		draggable: true,
		removable: true,
		editable: true,
		strokeColor: '#39f',
		fillColor: '#39f',
		fillOpacity: 0.5,
		hintStrokeStyle: 'dash',
		hintStrokeOpacity: 0.5
	}
};

// Drawing Manager 생성
manager = new kakao.maps.drawing.DrawingManager(options);

// 그리기 버튼 클릭 이벤트
function selectOverlay(type) {
	// 이전 그리기 취소
	manager.cancel();

	// 클릭한 그리기 타입을 선택
	manager.select(kakao.maps.drawing.OverlayType[type]);
}

// 도형 그리기 끝나는 시점 이벤트
manager.addListener('drawend', function(data) {
	// 그려진 도형의 좌표를 WGS84 좌표로 변경하여 배열에 추가
	newPolygonPath = data.target.getPath().map(coord => coord.toLatLng());
	// 도형 다중 생성을 방지하기 위해 버튼 비활성
	// 도형+오버레이 제출 or 도형 삭제 시 다시 활성화 
	$("#drawing-tools button").attr("disabled", true);
	$("#drawing-tools button").css("backgroundColor", "#a6a6a6");
	$("#drawing-tools button").css("cursor", "default");
	alert("도형이 생성되었습니다.\n도형에 마우스 우클릭하여 후기를 작성해주세요.")
});

// 그려진 도형 삭제 이벤트
manager.addListener('remove', function(e) {
	// 도형 삭제 후 버튼 활성화
	$("#drawing-tools button").attr("disabled", false);
	$("#drawing-tools button").css("backgroundColor", "#4ad988");
	$("#drawing-tools button").css("cursor", "pointer");
	alert("도형이 삭제되었습니다.")
});