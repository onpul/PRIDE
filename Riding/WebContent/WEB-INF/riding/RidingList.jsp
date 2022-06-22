<!--
RidingList.jsp 
모임 리스트 페이지
메인 페이지 > 상단메뉴 > 모임 리스트
메인 페이지 > 캘린더 > 모임 리스트
-->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:set var="user_id" value="${user_id}" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RidingList.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		searchList();
		
		var th = ""; 
		th += "<tr id=\"first\"><th>모임명</th>"
		th += "<th>최대<input type=\"button\" value=\"정렬\"/></th>"
		th += "<th>참여가능<input type=\"button\" value=\"정렬\"/></th>"
		th += "<th>기간<input type=\"button\" value=\"정렬\"/></th>"
		th += "<th>참석가능여부<input type=\"button\" value=\"정렬\"/></th></tr>" 
		
		$(".ridingList").append(th);
	});
	
	$(function()
	{
		$("#myRidingBtn").click(function()
		{
			//alert("확인");
			
			// 사용자의 라이딩 스타일 받아오기 전 모든 체크를 해제
			$("input:radio[name='sex_p_id']").prop("checked", false);
			$("input:radio[name='age_p_id']").prop("checked", false);
			$("input:radio[name='speed_id']").prop("checked", false);
			$("input:radio[name='step_id']").prop("checked", false);
			$("input:radio[name='eat_p_id']").prop("checked", false);
			$("input:radio[name='dining_p_id']").prop("checked", false);
			$("input:radio[name='mood_p_id']").prop("checked", false);
			
			// 사용자의 라이딩 스타일을 받아와 checked 적용
			myRidingCheck();
		});
	});
	
	function myRidingCheck()
	{
		//alert("myRidingCheck()");
		
		var user_id = $("#user_id").val();
		
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"myRidingCheck.action?user_id="+user_id
			//, contentType:"application/json; charset:UTF-8"
			, success:function(data)
			{
				//alert("success 진입");
				//alert(data);
				
				console.log(typeof data);
				var jObj = JSON.parse(data);
				console.log("jObj", jObj);
				console.log(jObj[0].age_p_id);
				console.log(jObj[1].dining_p_id);
				console.log(jObj[2].eat_p_id);
				console.log(jObj[3].mood_p_id);
				console.log(jObj[4].sex_p_id);
				
				console.log("jObj.length", jObj.length);
				
				var age_p_id = jObj[0].age_p_id;
				var dining_p_id = jObj[1].dining_p_id;
				var eat_p_id = jObj[2].eat_p_id;
				var mood_p_id = jObj[3].mood_p_id;
				var sex_p_id = jObj[4].sex_p_id;
				
				//alert(mood_p_id);
				
				$('input:radio[name="age_p_id"][value=' + age_p_id + ']').prop('checked', true);
				$('input:radio[name="dining_p_id"][value=' + dining_p_id + ']').prop('checked', true);
				$('input:radio[name="eat_p_id"][value=' + eat_p_id + ']').prop('checked', true);
				$('input:radio[name="mood_p_id"][value=' + mood_p_id + ']').prop('checked', true);
				$('input:radio[name="sex_p_id"][value=' + sex_p_id + ']').prop('checked', true);
				
				// 속도, 숙련도는 제한 없음 디폴트
				$('input:radio[name="speed_id"][value=0]').prop('checked', true);
				$('input:radio[name="step_id"][value=0]').prop('checked', true);
				
				searchList();
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	$(function()
	{
		$("#openRidingBtn").click(function()
		{
			var user_id = $("#user_id").val();
			alert("확인");
			alert("user_id = " + user_id);
			
			// 패널티 적용 여부 확인해서 패널티 있으면 경고창, 없으면 라이딩 생성 요청
			$.ajax(
			{
				type:"POST"
				, url:"penaltycheck.action?user_id="+user_id
				, success:function(data)
				{
					if (data == 0)
					{
						location.href = "insertridingform.action";
					}
					else if (data > 0) 
					{
						alert("패널티가 적용 중이므로 모임을 생성할 수 없습니다.");
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
	
	$(document).ready(function()
	{
		$(".ridingListForm").change(function()
		{
			searchList();
		});
	});
	
	function searchList()
	{
		//alert("확인이용");
		
		var params = "ridinglistform.action?" + $(".ridingListForm").serialize();
		
		//alert(params);
		
		$.ajax(
		{
			type:"POST"
			, url:params
			, contentType:"application/json; charset:UTF-8"
			, success:function(data)
			{
				//alert("안녕 나 에이젝스야~ 컨트롤러 잘 다녀왔어!");
				//alert(data);
				
				console.log(typeof data);
				var jObj = JSON.parse(data);
				//console.log("jObj = ", jObj);
				//console.log("jObj.length = ", jObj.length);
				//console.log(jObj[0].riding_name);
				
				var th = ""; 
				th += "<tr id=\"first\"><th>모임명</th>"
				th += "<th>최대<input type=\"button\" value=\"정렬\"/></th>"
				th += "<th>참여가능<input type=\"button\" value=\"정렬\"/></th>"
				th += "<th>기간<input type=\"button\" value=\"정렬\"/></th>"
				th += "<th>참석가능여부<input type=\"button\" value=\"정렬\"/></th></tr>" 
				
				$(".ridingList").empty();
				$(".ridingList").append(th);
				
				if (jObj == "")
				{
					//alert("비었음");
					var html = "<tr><td colspan='5'>조건을 만족하는 라이딩 모임이 존재하지 않습니다.</td></tr>"
					$(".ridingList").append(html);
				}
				else if (jObj != "") 
				{
					var content = "";
					var open = "";
					var confirm_date = "";
					
					for (var i = 0; i < jObj.length; i++)
					{
						if (jObj[i].riding_name != undefined)
						{
							console.log("i = " + i);
							content += "<tr><td><a href='" + "ridingdetail.action?riding_id=" + jObj[i+6].riding_id + "'>" + jObj[i].riding_name + "</a></td>";
						}
						if (jObj[i].maximum != undefined)
						{
							console.log("i = " + i);
							content += "<td>" + jObj[i].maximum + "</td>";
						}
						if (jObj[i].open != undefined)
						{
							console.log("i = " + i);
							content += "<td>" + jObj[i].open + "</td>";
							open = jObj[i].open;
						}
						if (jObj[i].start_date != undefined)
						{
							console.log("i = " + i);
							content += "<td>" + jObj[i].start_date + " ~ ";
						}
						if (jObj[i].end_date != undefined)
						{
							console.log("i = " + i);
							content += jObj[i].end_date + "</td>";
						}
						if (jObj[i].confirm_date != undefined)
						{
							console.log("i = " + i);
							
							if (open<0 && jObj[i].confirm_date != null)
							{
								content += "<td>참여 불가</td>";
							}
							else
								content += "<td>참여 가능</td>"
							
							content += "</tr>";
						}
					}
					console.log("content = " + content);
					$(".ridingList").append(content);
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
	}
</script>
<style type="text/css">
</style>
</head>
<body>
<div>
	<c:import url="Header.jsp"></c:import>
</div>
<form class="ridingListForm" name="ridingListForm">
	<div class="form-group form-inline">
		<label for="gender" class="">모임명</label>
		<input type="text" class="form-control" placeholder="모임명">
		<button type="submit" class="btn btn-default">검색</button>
	</div>
	<div>
		<div class="form-group">
			<label for="gender" >성별</label>
			<label class="radio-inline">
				<input type="radio" name="sex_p_id" id="sex_p_id" value="-1" checked="checked">전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="sex_p_id" id="sex_p_id" value="0">제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="sex_p_id" id="sex_p_id" value="1"/>남성
			</label>
			<label class="radio-inline">
				<input type="radio" name="sex_p_id" id="sex_p_id" value="2"/>여성
			</label>
		</div>
		<div class="form-group">
			<label for="age">연령대</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="-1" checked="checked">전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="0">제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="1"/>10대
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="2"/>20대
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="3"/>30대
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="4"/>40대
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="5"/>50대
			</label>
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="6"/>60대 이상
			</label>
		</div>
		<div class="form-group">
			<label for="speed">속도</label>
			<label class="radio-inline">
				<input type="radio" name="speed_id" id="speed_id" value="-1" checked="checked">전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed_id" id="speed_id" value="0">제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed_id" id="speed_id" value="1"/>20미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed_id" id="speed_id" value="2"/>20이상 24미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed_id" id="speed_id" value="3"/>24이상
			</label>
		</div>
		<div class="form-group">
			<label for="step">숙련도</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="-1" checked="checked"> 전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="0">제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="1" />1년 미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="2" />1~3년
			</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="3" />3~5년
			</label>
			<label class="radio-inline">
				<input type="radio" name="step_id" id="step_id" value="4" />6년 이상
			</label>
		</div>
		<div class="form-group">
			<label for="eat">식사 여부</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat_p_id" value="-1" checked="checked">전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat_p_id" value="0">제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat_p_id" value="1"/>밥 안 먹고 달려요
			</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat_p_id" value="2"/>밥 먹고 달려요
			</label>
		</div>
		<div class="form-group">
			<label for="dinning">회식 여부</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining_p_id" value="-1" checked="checked"> 전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining_p_id" value="0"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining_p_id" value="1"/>끝나고 회식 안 해요
			</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining_p_id" value="2"/>끝나고 회식해요
			</label>
		</div>
		<div class="form-group">
			<label for="mood">분위기</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood_p_id" value="-1" checked="checked"> 전체
			</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood_p_id" value="0"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood_p_id" value="1"/>침묵이 좋아요
			</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood_p_id" value="2"/>친목이 좋아요
			</label>
		</div>
		<c:choose>
		<c:when test="${sessionScope.user_id!=null }">
		<div class="form-group myRidingBtn">
			<input type="button" class="btn btn-default" id="myRidingBtn" value="나의 라이딩스타일 적용"/>
		</div>
		</c:when>
		</c:choose>
	</div>
</form>
<div>
	<table class="table table-bordered ridingList">
		<!-- <tr id="first">
			<th>모임명</th>
			<th>최대<input type="button" value="정렬"/></th>
			<th>참여가능<input type="button" value="정렬"/></th>
			<th>기간<input type="button" value="정렬"/></th>
			<th>참석가능여부<input type="button" value="정렬"/></th>
		</tr>  -->
		<!-- 
		<tr>
			<td>인천 피플</td>
			<td>9</td>
			<td>2</td>
			<td>2022.06.20 12:00 ~ 2022.06.20 16:00</td>
			<td>참석 가능</td>
		</tr>
		<tr>
			<td>인천 피플</td>
			<td>9</td>
			<td>2</td>
			<td>2022.06.20 12:00 ~ 2022.06.20 16:00</td>
			<td>참석 가능</td>
		</tr>
		<tr>
			<td>인천 피플</td>
			<td>9</td>
			<td>2</td>
			<td>2022.06.20 12:00 ~ 2022.06.20 16:00</td>
			<td>참석 가능</td>
		</tr>
		<tr>
			<td>인천 피플</td>
			<td>9</td>
			<td>2</td>
			<td>2022.06.20 12:00 ~ 2022.06.20 16:00</td>
			<td>참석 가능</td>
		</tr>
		<tr>
			<td>인천 피플</td>
			<td>9</td>
			<td>2</td>
			<td>2022.06.20 12:00 ~ 2022.06.20 16:00</td>
			<td>참석 가능</td>
		</tr>
		-->
	</table>
	<input type="text" style="display: none;" name="user_id" id="user_id" value="${user_id}"/>
	<c:choose>
	<c:when test="${sessionScope.user_id!=null }">
	<input type="button" class="btn btn-default" id="openRidingBtn" value="라이딩 모임 만들기"/>
	</c:when>
	</c:choose>
</div>
<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</body>
</html>