<!--
RidingDetail.jsp 
모임 상세보기 페이지
메인 페이지 > 모임 생성하기 > 모임 상세보기
모임 리스트 > 모임 상세보기

참여하기 누르면 라이딩 대기실로 이동 처리
-->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WatingRoom.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		//alert("확인");
		
		// 지도 마커 표시
		setMarkers();
		
		// 라이딩 모임 목록으로 돌아가기
		$("#goList").click(function()
		{
			//alert("확인");
			location.href="/Riding/ridinglist.action";
		});
		
		// 준비 or 준비 취소 버튼 눌렀을 때
		$(".readyBtn").on("click", function()
		{
			getReady($(this).val());
		});
		
		
		var memberList = JSON.parse('${memberList}');
		//alert(memberList);
		
		//console.log(memberList.length);
		
		var result = "";
		
		for (var i = 0; i < memberList.length; i++)
		{
			console.log(i);
			console.log(memberList[i].pi_address);
			console.log(memberList[i].nickname);
			console.log(memberList[i].introduce);
			
			result += "<div><ul class=\"memberBox\">";
			
			if (memberList[i].pi_address != null && memberList[i].pi_address != "")
				result += "<li><img src=\"" + memberList[i].pi_address + "\"class=\"img-circle\"/></li>";
			if (memberList[i].nickname != null && memberList[i].nickname != "")
				result += "<li><ul><li>" + memberList[i].nickname + "</li>";
			if (memberList[i].introduce != null && memberList[i].introduce != "")
			{
				console.log(i + "여기");
				
				if (memberList[i].introduce == "null")
				{
					result += "<li>" + "같이 달려요~" + "</li></ul>";
				}
				else
					result += "<li>" + memberList[i].introduce + "</li></ul>";
			}
			if (memberList[i].sex != null && memberList[i].sex != "")
			{
				if (memberList[i].sex == "F")
				{
					result += "<li><ul><li>여성</li>";
				}
				else
					result += "<li><ul><li>남성</li>";
			}
			if (memberList[i].agegroup != null && memberList[i].agegroup != "")
				result += "<li>" + memberList[i].agegroup + "대</li>";
			
			result += "</ul>"
			
			if (memberList[i].partici_date != 'null' && memberList[i].partici_date != "")
				result += "<li><ul><li>준비 완료</li></ul></li>";
			else
				result += "<li><ul><li>준비 X</li></ul></li>";
			//result += "<li><ul><li><button type='button' value='ready'>준비하기</button></li>"
			//result += "<li><button type='button' value='ready'>모임 나가기</button></li></ul></li>"
			
			result += "</div>"
		}
		console.log(result);
		
		$("#memberContainer").html(result);
	});
	
	// 지도에 마커 넣기
	function setMarkers()
	{
		// KakaoMap.jsp 안에 작성된 마커, 인포윈도우 초기화 function
		reset();
		
		// 모임 장소 설정했다면
		if ($("input[name='meet_lati']").length)
		{
			var lat = $("input[name='meet_lati']").val();
			var lng = $("input[name='meet_longi']").val();
			var addr = $("input[name='meet_address']").val();
			addMarker(lng, lat, addr, 'meet');
		}
		
		// 출발점 설정했다면
		if ($("input[name='start_lati']").length)
		{
			var lat = $("input[name='start_lati']").val();
			var lng = $("input[name='start_longi']").val();
			var addr = $("input[name='start_address']").val();
			addMarker(lng, lat, addr, 'start');
		}
		
		// 도착점 설정했다면
		if ($("input[name='end_lati']").length)
		{
			var lat = $("input[name='end_lati']").val();
			var lng = $("input[name='end_longi']").val();
			var addr = $("input[name='end_address']").val();
			addMarker(lng, lat, addr, 'end');
		}
		
		// 경유지 설정했다면...
		if ($("input[name='latitude']").length)
		{
			for (var i=0; i<$("input[name='latitude']").length; i++)
			{
				var lat = $("input[name='latitude']:eq("+i+")").val();
				var lng = $("input[name='longitude']:eq("+i+")").val();
				var addr = $("input[name='address']:eq("+i+")").val();
				var num = String(i+1);
				addMarker(lng, lat, addr, 'point '+num);	
			}
		}
		
		// 지도 중심 세팅
		var centerLat = (Number($("input[name='start_lati']").val()) 
						+ Number($("input[name='end_lati']").val())) / 2;
		
		var centerLng = (Number($("input[name='start_longi']").val()) 
						+ Number($("input[name='end_longi']").val())) / 2;
		
		setCenter(centerLat, centerLng)
	}
	
	function getReady()
	{
		
	}
	
</script>
<style type="text/css">
	.memberBox
	{
		border: 1px solid lightgray;
		border-radius: 30px;
		padding: 20px;
		list-style: none;
		display: inline-flex;
		flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: stretch;
	    justify-content: space-between;
	    align-items: center;
	}
	li
	{
		display: block;
	}
	img
	{
		width: 80px;
	}
	.container
	{
		text-align: center;
	}
	.map-box
	{
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		width: 500px;
		height: 400px;
		background-color: lightgray;
	}
	.property > p
	{
		margin-left: auto;
		margin-right: auto;
		width: 200px;
		border: 1px solid gray;
		border-radius: 30px;
	}
	.memberBox
	{	
		width: 500px;
	}
</style>
</head>
<body>
<div>
	<c:import url="${request.contextPath}/WEB-INF/layout/Header.jsp"/>
</div>

<!-- 라이딩 모임 상세 정보 변수-->
<c:set var="info" value="${ridingDetailList.get(0)}"/>

<div class="container">
	
	<div>
		<input type="text" style="display: none;" name="riding_id" id="riding_id" value="${info.riding_id }"/>
		<h1>${info.riding_name }</h1>
		<div class="property">
			<c:if test="${info.sex_p_id != 0}">
				<p>${info.sp_content }</p>
			</c:if>
			<c:if test="${info.age_p_id != 0}">
				<p>${info.ap_content }</p>
			</c:if>
			<c:if test="${info.eat_p_id != 0}">
				<p>${info.ep_content }</p>
			</c:if>
			<c:if test="${info.dining_p_id != 0}">
				<p>${info.dp_content }</p>
			</c:if>
			<c:if test="${info.step_id != 0}">
				<p>${info.step_type }</p>
			</c:if>
			<c:if test="${info.speed_id != 0}">
				<p>${info.speed_type }</p>
			</c:if>
		</div>
	</div>
	
	<div>
		<h3>모임 정보</h3>
		<table class="table">
			<tr>
				<td>모임 시작 일시</td>
				<td>${info.start_date }</td>
			</tr>
			<tr>
				<td>모임 종료 일시</td>
				<td>${info.end_date }</td>
			</tr>
			<tr>
				<td>최대 인원수</td>
				<td>${info.maximum }명</td>
			</tr>
		</table>
	</div>
	
	<div>
		<div>
			<h3>경로 보기</h3>
			<div class="map-box">
				<c:import url="/displaymap.action"/>
			</div>
		</div>
		<br />
		<div>
			<table class="table table-bordered">
				<tr>
					<td></td>
					<th style="text-align:center;">주소(상세주소)</th>
				</tr>
				<tr>
					<th>모이는 곳</th>
					<td>${info.meet_address } (${info.meet_detail })</td>
					<td style="display:none;">
						<input type="text" name="meet_address" value="${info.meet_address }">
						<input type="text" name="meet_detail" value="${info.meet_detail }">
						<input type="text" name="meet_lati" value="${info.meet_lati }">
						<input type="text" name="meet_longi" value="${info.meet_longi }">
					</td>
				</tr>
				<tr>
					<th>라이딩 출발지점</th>
					<td>${info.start_address } (${info.start_detail })</td>
					<td style="display:none;">
						<input type="text" name="start_address" value="${info.start_address }">
						<input type="text" name="start_detail" value="${info.start_detail }">
						<input type="text" name="start_lati" value="${info.start_lati }">
						<input type="text" name="start_longi" value="${info.start_longi }">
					</td>
				</tr>
				<tr>
					<th>라이딩 도착지점</th>
					<td>${info.end_address } (${info.end_detail })</td>
					<td style="display:none;">
						<input type="text" name="end_address" value="${info.end_address }">
						<input type="text" name="end_detail" value="${info.end_detail }">
						<input type="text" name="end_lati" value="${info.end_lati }">
						<input type="text" name="end_longi" value="${info.end_longi }">
					</td>
				</tr>
			</table>
		</div>
		<br />
		<div>
			<table class="table table-bordered">
				<c:choose>
					<c:when test="${ridingPoint.size() > 0}">
						<tr>
							<th>경유지</th>
							<th style="text-align:center;">주소(상세주소)</th>
						</tr>
						<c:forEach var="i" begin="0" end="${ridingPoint.size()-1 }">
						<tr>
							<th>경유지${i+1 }</th>
							<td>${ridingPoint.get(i).address }(${ridingPoint.get(i).detail_address })</td>
							
							<td style="display:none;">
								<input type="text" name="address" value="${ridingPoint.get(i).address }"/>
								<input type="text" name="detail_address" value="${ridingPoint.get(i).detail_address }"/>
								<input type="text" name="latitude" value="${ridingPoint.get(i).latitude }">
								<input type="text" name="longitude" value="${ridingPoint.get(i).longitude }">
							</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th>경유지 없음</th>
						</tr>
					</c:otherwise>
				</c:choose>
				
			</table>
		</div>
	</div>
	
	<div>
		<table class="table table-bordered" style="width: 400px; margin-left: auto; margin-right: auto; text-align: center;">
			<thead>
				<tr>
					<th>준비</th>
					<th>대기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>4</td>
					<td>2</td>
				</tr>
				<tr>
					<th colspan="2">확정</th>
				</tr>
				<tr>
					<td colspan="2">○</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	<div>
		<!-- 비회원은 블러 처리 후 로그인 페이지로 이동 버튼 -->
		<h3>멤버 정보</h3>
		<!-- 사용자 프로필 -->
		<div id="memberContainer"></div>
		
		
		<c:if test="${info.leader_id != user_id }">
			<c:choose>
			<c:when test="${checkReady != 1}">
				<div>
					<button type="button" class="btn btn-success readyBtn" value="SYSDATE">준비하기</button>
				</div>	
			</c:when>
			<c:otherwise>
				<div>
					<button type="button" class="btn btn-warning readyBtn" value="NULL">준비 취소</button>
				</div>
			</c:otherwise>
			</c:choose>		
		</c:if>
		
		<br />
		<div>
			<input type="button" class="btn btn-default" value="목록으로" id="goList"/> 
		</div>
	</div>
	
	<input type="text" style="display: none;" name="user_id" id="user_id" value="${user_id}"/>
	
	
</div>


<!-- 푸터 -->
<jsp:include page="${request.contextPath}/WEB-INF/layout/Footer.jsp" />

</body>
</html>