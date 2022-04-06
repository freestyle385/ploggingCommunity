// 파라미터 받아오기
function scriptQuery() {
    var script = document.getElementsByTagName('script');   
    script = script[script.length-1].src  
       .replace(/^[^\?]+\?/, '')           
       .replace(/#.+$/, '')                      
       .split('&');                                   
     var queries = {}                             
       , query;
     while(script.length){                      
          query = script.shift().split('=');    
          queries[query[0]] = query[1];   
     }
     return queries;
}

// Drawing Manager 옵션
var options = { 
    map: map,
    drawingMode: [
        kakao.maps.drawing.OverlayType.RECTANGLE,
        kakao.maps.drawing.OverlayType.POLYGON
    ],
    guideTooltip: ['draw', 'drag', 'edit'], 
    rectangleOptions: {
        draggable: true,
        removable: true,
        editable: true,
        strokeColor: '#39f', // 외곽선 색
        fillColor: '#39f', // 채우기 색
        fillOpacity: 0.5 // 채우기색 투명도
    },
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
var manager = new kakao.maps.drawing.DrawingManager(options);

// 그리기 버튼 클릭 이벤트
function selectOverlay(type) {
    // 이전 그리기 취소
    manager.cancel();

    // 클릭한 그리기 타입을 선택
    manager.select(kakao.maps.drawing.OverlayType[type]);
}