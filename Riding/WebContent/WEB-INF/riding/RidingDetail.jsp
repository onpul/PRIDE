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
<title>RidingDetail.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		//alert("확인");
	
		$("#goList").click(function()
		{
			//alert("확인");
			location.href="/Riding/ridinglist.action";
		});
		
		$("#attendBtn").click(function()
		{
			//alert("확인");
			
			var riding_id = $("#riding_id").val();
			var user_id = $("#user_id").val();
			
			//alert(riding_id);
			
			$.ajax(
			{
				type:"POST"
				, url:"participation.action?user_id="+user_id+"&riding_id="+riding_id
				, success:function(data)
				{
					if (data == 0) // 참여 인서트 완료
					{
						location.href="JoinRoom.jsp";
					}
					else if (data == 1) // 모임 생성 참여 패널티
					{
						alert("모임 생성 및 참여 패널티가 적용 중이므로 참여할 수 없습니다.")
					}
					else if (data == 2) // 모임 참여 개수 제한
					{
						alert("참여 중인 모임이 존재하므로 참여할 수 없습니다.");
					}
					else if (data == 3) // 성별 제한
					{
						alert("해당 모임의 성별 조건을 만족하지 않아 참여할 수 없습니다.");
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
		var memberList = JSON.parse('${memberList}');
		//alert(memberList);
		
		console.log(memberList.length);
		
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
				
			result += "</ul></div>"
		}
		console.log(result);
		
		$("#memberContainer").html(result);
	});
	
	
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
<div class="container">
	<c:forEach var="info" items="${ridingDetailList }">
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
		<h3>경로 보기</h3>
		<div class="map-box">지도 들어갈 div</div>
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
	</c:forEach>
	<div>
		<!-- 비회원은 블러 처리 후 로그인 페이지로 이동 버튼 -->
		<h3>멤버 정보</h3>
		<!-- 사용자 프로필 -->
		<div id="memberContainer">
		
		</div>
		
		<div>
			<input type="button" class="btn btn-default" value="목록으로" id="goList"/> 
			<input type="button" class="btn btn-default" value="참여하기" id="attendBtn"/>
		</div>
	</div>
	
	
	<input type="text" style="display: none;" name="user_id" id="user_id" value="${user_id}"/>
<!-- 푸터 -->
<jsp:include page="${request.contextPath}/WEB-INF/layout/Footer.jsp" />
</div>
</body>
</html>