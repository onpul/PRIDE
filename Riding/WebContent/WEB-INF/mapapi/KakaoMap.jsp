<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KakaoMap</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=929c19987c7012d98e56f65300690f4a"></script>
	<script>
		var startMarker = null
			, endMarker = null; // 출발지 마커, 도착지 마커
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption =
		{
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.566826, 126.9786567);
		
		// 마커 모음
		var markers = [];
		
		// 지역 정보 나타내는 말풍선 모음
		var infoWindows = [];
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker(
		{
			position : markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		markers.push(marker);
		
		var iwContent = '<div style="width:250px; padding:5px;">어떠한 지점도 설정되지 않았어요.</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow(
		{
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
		
		infoWindows.push(infowindow);
		
		
		function reset()
		{
			for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    
		    
		    for ( var i = 0; i < infoWindows.length; i++ ) {
		        infoWindows[i].close();
		    }   
		    infoWindows = [];
		    
		}
		// 마커 추가
		function addMarker(lng, lat, addr, typeStr)
		{
			// 위치
			var position = new kakao.maps.LatLng(lat, lng);
			
			// type 분리
			var type, num;
			if (!typeStr.includes("point"))
				type = typeStr;
			else
			{
				type = typeStr.split(" ")[0];
				num = typeStr.split(" ")[1];
			}
			
			// infoWindow에 노출될 markerType.
			var markerType = "";
			
			if (type == 'start')
				markerType = "시작지점";
			else if (type == 'end')
				markerType = "도착지점";
			else if (type == 'meet')
				markerType = "모이는 곳";
			else
				markerType = "경유지" + num;
			
			var content = '<div style="width:250px; height:auto; padding:5px;">'
							+markerType+'<br>'
							+addr+'</div>';
			
			var markerInst = new kakao.maps.Marker(
			{
				position : position,
				image : addImage(type)
			});
			
			var infoWindowInst = new kakao.maps.InfoWindow(
			{
				position : position,
				content : content
			});
			
			
			infoWindows.push(infoWindowInst);
			

			kakao.maps.event.addListener(markerInst, 'mouseover', function()
			{
				infoWindowInst.open(map, markerInst);
			});
			
			kakao.maps.event.addListener(markerInst, 'mouseout', function()
			{
				infoWindowInst.close();
			});
			
			markerInst.setMap(map);
			markers.push(markerInst);
			
			
			// 지도 중심 설정
			map.setCenter(position);
			
			/*
			if(type=='start')
				startMarker = markerInst;
			else if(type=='end')
				endMarker = endInst;
			
			var startPosition = startMarker != null ? startMarker.getPosition() : new kakao.maps.LatLng(0, 0);
			var endPosition = endMarker != null ? endMarker.getPosition() : new kakao.maps.LatLng(0, 0);
			
			var center_lati =
			*/
			
		}
		
		function addImage(type)
		{
			var imageSrc = "<%=cp%>" + "/images/" + type + "_marker.png";
			var imageSize = new kakao.maps.Size(25, 37.5);
			var imageOption = {offset: new kakao.maps.Point(12.5, 37.5)};
			
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
			return markerImage;
		}
		
	</script>
</body>
</html>