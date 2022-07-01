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
		
		// 나가기 버튼 눌렀을 때
		$(".exitBtn").on("click", function()
		{
			exitRiding($(this).val());
		});
		
		// 수정 버튼 눌렀을 때
		$(".updateBtn").on("click", function()
		{
			updateRiding($(this).val());
		});
		
		// 삭제 버튼 눌렀을 때
		$(".deleteBtn").on("click", function()
		{
			deleteRiding($(this).val());
		});
		
		// 확정 버튼 눌렀을 때
		$(".confirmBtn").on("click", function()
		{
			confirmRiding();
		});
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
	
	function getReady(ready)
	{
		var user_id = $("#user_id").val();
		
		$.ajax(
		{
			type:"GET"
			, url:"getready.action?ready=" + ready + "&user_id=" + user_id
			, success:function(args)
			{
				//alert("변경");
				if(Number(args) > 0)
				{
					var str = String($("li#user_id"+user_id).html());
					
					if ( str.includes("X") )
						$("li#user_id"+user_id).html("준비 O");
					else
						$("li#user_id"+user_id).html("준비 X");
					
					$(".readyBtn").toggle();
					
				}
				
			}
			, error:function(e)
			{
				console.log(e.responseText);
			}
		});
	}
	
	function updateRiding(riding_id)
	{
		var updatable_date = new Date($("#start_date").html());
		
		updatable_date.setHours(updatable_date.getHours()-49);
		
		var now_date = new Date();
		
		if (updatable_date - now_date > 0)
			location.href = "updateridingform.action?riding_id="+riding_id;
		else
			alert("수정 불가 기간");
	}
	
	function deleteRiding(riding_id)
	{
		if (confirm("정말 삭제하시겠습니까?"))
		{
			location.href = "deleteriding.action?riding_id="+riding_id;
		}
	}
	
	// 나가기
	function exitRiding(riding_id)
	{
		if (confirm("정말 나가시겠습니까?"))
		{
			location.href = "exitriding.action?riding_id="+riding_id+"&user_id="+$("#user_id").val();
		}
	}
	
	// 확정하기
	function confirmRiding()
	{
		alert("확정하기 버튼 누름");
		
		$.ajax(
		{
			type:"GET"
			, url:"confirm.action?confirm=" + $(".confirmBtn").val() + "&riding_id=" + $("#riding_id").val()
			, success:function(args)
			{
				alert("확정하기 컨트롤러 다녀오기 성공 데이터는 " + args + "임");
				
				if (args > 0)
				{
					$(".confirmBtn").toggle();
				}				
			}
			, error:function(e)
			{
				console.log(e.responseText);
			}
		});
	}
	
</script>
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
				<td id="start_date">${info.start_date }</td>
			</tr>
			<tr>
				<td>모임 종료 일시</td>
				<td id="end_date">${info.end_date }</td>
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
		
		<!-- 경유지 정보 -->
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
	
	<!-- 현재 대기실 상황 -->
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
		<div id="memberContainer">
			<c:forEach var="member" items="${members }">
			<ul class="memberBox">
				<li>
					<c:if test="${member.pi_address != null && member.pi_address !='' }">
						<img src="${member.pi_address }" class="img-circle" />
					</c:if>
				</li>
				<li>
					<ul>
						<c:if test='${member.nickname != null && member.nickname != "" }'>
							<li>${member.nickname }</li>
						</c:if>
						<c:choose>
							<c:when test='${member.introduce == null || member.introduce == "" }'>
								<li>같이 달려요~</li>
							</c:when>
							<c:otherwise>
								<li>${member.introduce }</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
				<li>
					<ul>
						<c:if test='${member.sex != null && member.sex !="" }'>
							<c:choose>
							<c:when test="${member.sex == 'F' }">
								<li>여성</li>
							</c:when>
							<c:otherwise>
								<li>남성</li>
							</c:otherwise>		
							</c:choose>
						</c:if>
						
						<c:if test='${member.agegroup != null && member.agegroup != "" }'>
							<li>${member.agegroup } 대</li>
						</c:if>
					</ul>
				</li>
				<li>
					<ul>
						<li id="user_id${member.user_id }">
							<c:choose>
							<c:when test='${member.partici_date != null && member.partici_date != "" }'>
								준비 O
							</c:when>
							<c:otherwise>
								준비 X
							</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</li>
			</ul>
			</c:forEach>
		</div>
		
		<c:choose>
			<c:when test="${info.leader_id != user_id }">
				<c:choose>
				<c:when test="${checkReady != 1}">
					<div>
						<button type="button" class="btn btn-success readyBtn" value="SYSDATE">준비하기</button>
						<button type="button" style="display:none;" class="btn btn-warning readyBtn" value="NULL">준비 취소</button>
					</div>	
				</c:when>
				<c:otherwise>
					<div>
						<button type="button" style="display:none;" class="btn btn-success readyBtn" value="SYSDATE">준비하기</button>
						<button type="button" class="btn btn-warning readyBtn" value="NULL">준비 취소</button>
						<button type="button" class="btn btn-warning exitBtn" value="${info.riding_id }">나가기</button>
					</div>
				</c:otherwise>
				</c:choose>	
			</c:when>
			<c:otherwise>
				<div>
					<button type="button" class="btn btn-success confirmBtn" value="SYSDATE">확정하기</button>
					<button type="button" style="display:none;" class="btn btn-warning confirmBtn" value="NULL">확정 취소</button>
					<button type="button" class="btn btn-warning updateBtn" value="${info.riding_id }">수정하기</button>
					<button type="button" class="btn btn-warning deleteBtn" value="${info.riding_id }">삭제하기</button>
				</div>
			
			</c:otherwise>
		</c:choose>
		<br />
		<div>
			<input type="button" class="btn btn-default" value="목록으로" id="goList"/> 
		</div>
	</div>
	
	<input type="text" style="display: none;" name="user_id" id="user_id" value="${user_id}"/>
	<input type="text" style="display: none;" name="riding_id" id="riding_id" value="${riding_id}"/>
	
	
</div>


<!-- 푸터 -->
<jsp:include page="${request.contextPath}/WEB-INF/layout/Footer.jsp" />

</body>
</html>