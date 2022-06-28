<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!--
RidingList.jsp 
모임 리스트 페이지
메인 페이지 > 상단메뉴 > 모임 리스트
메인 페이지 > 캘린더 > 모임 리스트
-->

<c:set var="user_id" value="${user_id}" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RidingList.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	// 문서 로드 시 모임 리스트 출력하기
	$(document).ready(function()
	{
		var params = "ridinglistsort.action?riding_name="+$("#riding_name").val()+"&"+$(".ridingListForm").serialize()+"&maximum_sort="+$("#maximum").val()+"&open_sort="+$("#open").val()+"&start_date_sort="+$("#start_date").val();
		printList(params);
	});
	
	// 검색 버튼 클릭 시 모임 리스트 출력하기
	$(document).ready(function()
	{
		$("#search").click(function()
		{
			var params = "ridinglistsort.action?riding_name="+$("#riding_name").val()+"&"+$(".ridingListForm").serialize()+"&maximum_sort="+$("#maximum").val()+"&open_sort="+$("#open").val()+"&start_date_sort="+$("#start_date").val();
			printList(params);
		});
	});
	
	// 나의 라이딩스타일 적용
	$(function()
	{
		$("#myRidingBtn").click(function()
		{
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
		var user_id = $("#user_id").val();
		
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"myRidingCheck.action?user_id="+user_id
			, success:function(data)
			{
				var jObj = JSON.parse(data);
				
				var age_p_id = jObj[0].age_p_id;
				var dining_p_id = jObj[1].dining_p_id;
				var eat_p_id = jObj[2].eat_p_id;
				var mood_p_id = jObj[3].mood_p_id;
				var sex_p_id = jObj[4].sex_p_id;
				
				$('input:radio[name="age_p_id"][value=' + age_p_id + ']').prop('checked', true);
				$('input:radio[name="dining_p_id"][value=' + dining_p_id + ']').prop('checked', true);
				$('input:radio[name="eat_p_id"][value=' + eat_p_id + ']').prop('checked', true);
				$('input:radio[name="mood_p_id"][value=' + mood_p_id + ']').prop('checked', true);
				$('input:radio[name="sex_p_id"][value=' + sex_p_id + ']').prop('checked', true);
				
				// 속도, 숙련도는 제한 없음 디폴트
				$('input:radio[name="speed_id"][value=0]').prop('checked', true);
				$('input:radio[name="step_id"][value=0]').prop('checked', true);

			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	// 라이딩 모임 만들기 버튼 클릭 시 패널티 여부 확인
	$(function()
	{
		$("#openRidingBtn").click(function()
		{
			var user_id = $("#user_id").val();
			
			// 패널티 적용 여부 확인해서 패널티 있으면 경고창, 없으면 라이딩 생성 요청
			// 참여 중인 모임 존재하면 경고창, 없으면 라이딩 생성 요청
			$.ajax(
			{
				type:"POST"
				, url:"ridingcheck.action"
				, success:function(data)
				{
					console.log(data);
					if (Number(data) == 1) 
					{
						alert("패널티가 적용 중이므로 모임을 생성할 수 없습니다.");
					}
					else if (Number(data) == 2)
					{
						alert("참여 중인 모임이 존재하므로 모임을 생성할 수 없습니다.");
					}
					else
					{
						location.href = "insertridingform.action";
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	// 분류, 정렬 클릭할 때마다 목록 새로 불러오기
	$(document).ready(function()
	{
		// 정렬 버튼 눌렀을 때 클래스와 value 값 전환
		$(".ridingListForm, #maximum, #open, #start_date").click(function()
		{	
			// 분류 선택이 아닐 때
			if ($(this).attr("class") != "ridingListForm") 
			{
				// 하나의 요소만 정렬이 가능하도록
				if ($(this).attr("id") == "maximum") 
				{
					$("#open, #start_date").addClass("glyphicon-sort").removeClass("glyphicon-arrow-down");
					$("#open, #start_date").addClass("glyphicon-sort").removeClass("glyphicon-arrow-up");
				    $("#open, #start_date").val("");
				}
				else if ($(this).attr("id") == "open") 
				{
					$("#maximum, #start_date").addClass("glyphicon-sort").removeClass("glyphicon-arrow-down");
					$("#maximum, #start_date").addClass("glyphicon-sort").removeClass("glyphicon-arrow-up");
				    $("#maximum, #start_date").val("");
				}
				else if ($(this).attr("id") == "start_date") 
				{
					$("#maximum, #open").addClass("glyphicon-sort").removeClass("glyphicon-arrow-down");
					$("#maximum, #open").addClass("glyphicon-sort").removeClass("glyphicon-arrow-up");
				    $("#maximum, #open").val("");
				}
				
				// 정렬 순환
				if($(this).hasClass("glyphicon-sort")) 
				{
					$(this).addClass("glyphicon-arrow-up").removeClass("glyphicon-sort");
					$(this).val("desc");
				} 
				else if($(this).hasClass("glyphicon-arrow-up"))
				{
				    $(this).addClass("glyphicon-arrow-down").removeClass("glyphicon-arrow-up");
				    $(this).val("asc");
				}
				else if($(this).hasClass("glyphicon-arrow-down"))
				{
				    $(this).addClass("glyphicon-sort").removeClass("glyphicon-arrow-down");
				    $(this).val("");
				}
			}
			var maximum = $("#maximum").val();
			var open = $("#open").val();
			var start_date = $("#start_date").val();
			
			var params = "ridinglistsort.action?riding_name="+$("#riding_name").val()+"&"+$(".ridingListForm").serialize()+"&maximum_sort="+$("#maximum").val()+"&open_sort="+$("#open").val()+"&start_date_sort="+$("#start_date").val();
			
			printList(params);
		});
	});
	
	// 리스트 출력
	function printList(params)
	{
		console.log(params);
		
		$(document).ready(function()
		{
			$.ajax(
			{
				type:"POST"
				, url:params
				, contentType: "charset:UTF-8"
				, success:function(data)
				{
					var jObj = JSON.parse(data);
					console.log(jObj);
					
					$(".ridingList > tbody").empty();
					
					if (jObj.length == 0)
					{
						var html = "<tbody><tr><td colspan='5'>조건을 만족하는 라이딩 모임이 존재하지 않습니다.</td></tr></tbody>"
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
								content += "<tbody><tr><td><a href='" + "ridingdetail.action?riding_id=" + jObj[i+7].riding_id + "&status=\"" + jObj[i+6].status + "\"'>" + jObj[i].riding_name + "</a></td>";
							if (jObj[i].maximum != undefined)
								content += "<td>" + jObj[i].maximum + "</td>";
							if (jObj[i].open != undefined)
							{
								content += "<td>" + jObj[i].open + "</td>";
								open = jObj[i].open;
							}
							if (jObj[i].start_date != undefined)
								content += "<td>" + jObj[i].start_date + " ~ ";
							if (jObj[i].end_date != undefined)
								content += jObj[i].end_date + "</td>";
							if (jObj[i].status != undefined)
							{
								content += "<td>" + jObj[i].status + "</td>";
								content += "</tr></tbody>";
							}
						}
						console.log(content);
						$(".ridingList").append(content);
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	}
	
</script>
<style type="text/css">
.paging-div 
{
  padding: 15px 0 5px 10px;
  display: table;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
</style>
</head>
<body>
<div>
	<c:import url="${request.contextPath}/WEB-INF/layout/Header.jsp"/>
</div>
<div class="form-group form-inline">
	<label for="gender">모임명</label>
	<input type="text" class="form-control" id="riding_name" placeholder="모임명">
	<button type="submit" class="btn btn-default" id="search">검색</button>
</div>
<form class="ridingListForm" name="ridingListForm">
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
		<thead>
			<tr id="first" class="sorting">
				<th>모임명</th>
				<th>
					최대 인원<button type="button" id="maximum" class="glyphicon glyphicon-sort" value=""></button>
				</th>
				<th>
					참여 가능 인원<button type="button" id="open" class="glyphicon glyphicon-sort"  value=""></button>
				</th>
				<th>
					라이딩 모임 기간<button type="button" id="start_date" class="glyphicon glyphicon-sort" value=""></button>
				</th>
				<th>
					상태
				</th>
			</tr> 
		</thead>
	</table>
	
	<!-- 페이징 처리 -->
	
	
	<input type="text" style="display: none;" name="user_id" id="user_id" value="${user_id}"/>
	<c:choose>
	<c:when test="${sessionScope.user_id!=null }">
	<input type="button" class="btn btn-default" id="openRidingBtn" value="라이딩 모임 만들기"/>
	</c:when>
	</c:choose>
</div>
<!-- 푸터 -->
<jsp:include page="${request.contextPath}/WEB-INF/layout/Footer.jsp" />
</body>
</html>