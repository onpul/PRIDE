<!--
Main.jsp 
메인페이지(최초 접속 페이지)
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
<title>Main.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	// 달력 구현 ---------------------------------------------------------------------------
	var today = new Date();
	// alert(today); 
	// Sat Jun 11 2022 20:54:35 GMT+0900 (한국 표준시)
	
	var date = new Date();
	//alert(date);
	
	// 선택한 날짜(달력) 전달용 변수
	//var checkedYear = "";
	//var checkedMonth = "";
	
	// 문서 로딩과 동시에 달력 그리기
	$(document).ready(function()
	{
		//var year = today.getFullYear;
		//var month = today.getMonth;
		//alert(today);
		//alert(month);
		//checkedDate(today);
		thisMonth();
	});
	
	// 아니 왜 변수에 안 담겨?
	//alert("checkedYear = " + checkedYear);
	//alert("checkedMonth = " + checkedMonth);
	
	// 이전달
	function beforeMonth()
	{
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		//alert(today);
		// Wed May 11 2022 00:00:00 GMT+0900 (한국 표준시)
		checkedDate(today);
		drawCalendar(); // 캘린더 그리기
	}
	
	// 다음달
	function nextMonth()
	{
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		//alert(today);
		// Mon Jul 11 2022 00:00:00 GMT+0900 (한국 표준시)
		checkedDate(today);
		drawCalendar(); // 캘린더 그리기
	}
	
	// 오늘
	function thisMonth()
	{
		today = new Date();
		checkedDate(today); // 모임 수 출력하기
		drawCalendar(); // 캘린더 그리기
	}
	
	// 캘린더 그리기
	function drawCalendar()
	{
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1); // 현재 달의 첫 번째 날짜 
		var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 현재 달의 마지막 날짜
		
		var calTable = document.getElementById("calendar"); // 달력을 그릴 테이블
		var yearAndMonth = document.getElementById("yearAndMonth"); // ~년 ~월을 쓸 div
		
		// 선택한 년도와 월 출력
		yearAndMonth.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";
		
		//alert(calTable.rows.length);
		
		//달력 그리기 전 초기화
    	while(calTable.rows.length > 2) 
    	{
    		calTable.deleteRow(-1);
        }
		
		// 1일의 요일 구하기
		var yoil = firstDate.getDay(); // 인덱스 형태로 출력 
		
		// 새로운 행 추가
		var newRow = calTable.insertRow();
		
		var newCell = null;
		
		var tmp = 0; // 일수 증가 값
			
		// 1일이 되기 전까지 공백 칸 생성
		for (var i = 0; i < yoil; i++)
		{
			// 새로운 셀 추가
			newCell = newRow.insertCell();
			
			tmp = tmp + 1;
			
			if (tmp%7==0)
			{
				newRow = calTable.insertRow();
			}
		}
		
		//alert("lastDate.getDate() = " + lastDate.getDate());
		//alert("tmp = " + tmp);
		
		var todayStr = "";
		
		// 달력 출력
		for (var i = 1; i <= lastDate.getDate(); i++)
		{		
			// 행 추가
			newCell = newRow.insertCell();
			
			// yyyy-mm-dd 형식으로 변환
			todayStr = today.getFullYear() + "-" + ((today.getMonth() + 1) > 9 ? (today.getMonth() + 1).toString() : "0" + (today.getMonth() + 1)) + "-" + (i > 9 ? i : "0" + i);
			//alert(todayStr);
			var str = "";
			
			// 추가되는 cell 안에 div 요소 넣기
			/*
			<td>
				<span>16</span>
				<div class="dayBox">
					<div class="item" id="2022-06-16">
						<div class="content">
							<span class=\"badge bg-secondary\" id=\"openRiding\"></span>	
							<span class=\"badge bg-secondary\" id=\"closeRiding\"></span>
						</div>
					</div>
				</div>
			</td>
			*/
			str += "<span>" + i + "</span>";
			str += "<div class='dayBox'><div class='item check'id=" + todayStr + ">";
			str += "<div class='content'>";
			str += "<a href='#'>";
			str += "<span class=\"label label-primary\" id=\"closeRiding\"></span>";
			str += "<span class=\"label label-success\" id=\"openRiding\"></span>";
			str += "<a href='#'>";
			str += "</div></div></div>";
			
			newCell.innerHTML = str;
			
			// 주말 색상 적용			
			if (tmp % 7 == 6) // 토요일
				newCell.style.color = "blue";
			
			if (tmp % 7 == 0) // 일요일
				newCell.style.color = "red";
			
			tmp = tmp + 1;
			
			// 일요일이 될 때 개행
			if (tmp % 7 == 0)
			{
				newRow = calTable.insertRow();
			}
			
			// 오늘 날짜 배경 색 적용
			if(today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate())
			{
				newCell.style.backgroundColor = "lightyellow";
			}
		}	
		
		// 공백 채우기
		for (var i = 0; i < 35; i++)
		{
			if (tmp % 7 == 0)
			{
				return;
			}
			
			newCell = newRow.insertCell();
			
			tmp = tmp + 1;
		}
		// --------------------------------------------------------------------------- 달력 구현 
		
	}

	function checkedDate(today)
	{
		//alert("checkedDate 에이젝스 출동");
		
		//alert("today = " + today.getFullYear());
		//alert("today = " + today.getMonth());
		
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var day = today.getDate();
		
		month = month > 9 ? (month + 1).toString() : "0" + month;
		
		//alert(year);
		//alert(month);
		
		$.ajax(
		{
			type:"POST"
			, url:"openRidingCount.action?year="+year+"&month="+month
			, data:"JSON"
			, success:function(data)
			{
				//alert("안녕 나 checkedDate 에이젝스야~ 컨트롤러 잘 다녀왔어!");
				
				//console.log(typeof data);
				var jObj = JSON.parse(data);
				console.log("jObj", jObj);
				// 성공
				//console.log(jObj[0].date);
				// 2022-06-01
				//console.log("jObj.length",jObj.length);
				
				//alert($('.check').attr('id'));
				
				var temp = "\"#" + jObj[0].date + "\"";
				//alert(id);
				
				// 달력의 div id와 date값이 일치하면 count값 뱃지에 넣기
				for (var i = 0; i < jObj.length; i++)
				{
					//alert("jObj[i].date = " + jObj[i].date);
					/*
					if (jObj[i].date == $('.check').attr('id'))
					{
						//alert(jObj[i].date + "랑 " + $('.check').attr('id') + "랑 같다");
					}
					*/
					var str = jObj[i].count;
					
					//str += "<span class=\"badge bg-secondary\" id=\"openRiding\">" + jObj[i].count + "</span>";
					
					$(".dayBox").children('#' + jObj[i].date).find("#openRiding").html(str);
					// 선택한 날짜가 오늘 날짜보다 이후일 때
					/* if (today>=date)
					{
						$(".dayBox").children('#' + jObj[i].date).find("#openRiding").html(str);
					} */
					
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
		
		$.ajax(
		{
			type:"POST"
			, url:"closeRidingCount.action?year="+year+"&month="+month
			, data:"JSON"
			, success:function(data)
			{
				//alert("안녕 나 에이젝스야~ 컨트롤러 잘 다녀왔어!");
				
				console.log(typeof data);
				var jObj = JSON.parse(data);
				console.log("jObj", jObj);
				// 성공
				console.log(jObj[0].date);
				// 2022-06-01
				console.log("jObj.length",jObj.length);
				
				//alert($('.check').attr('id'));
				
				var temp = "\"#" + jObj[0].date + "\"";
				//alert(id);
				
				// 달력의 div id와 date값이 일치하면 count값 뱃지에 넣기
				for (var i = 0; i < jObj.length; i++)
				{
					//alert("jObj[i].date = " + jObj[i].date);
					/*
					if (jObj[i].date == $('.check').attr('id'))
					{
						//alert(jObj[i].date + "랑 " + $('.check').attr('id') + "랑 같다");
					}
					*/
					var str = jObj[i].count;
					
					//str += "<span class=\"badge bg-secondary\" id=\"openRiding\">" + jObj[i].count + "</span>";
					
					$(".dayBox").children('#' + jObj[i].date).find("#closeRiding").html(str);
					/*
					if (day > i)
					{
						$(".dayBox").children('#' + jObj[i].date).find("#closeRiding").html(str);
					}
					*/
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
		
	}
	
	// 접속한 회원의 패널티 적용 여부 확인	
	$(function()
	{
		$("#openRidingBtn").click(function()
		{
			//var user_id = ${user_id};
			
			//alert("확인");
			//alert("user_id = " + user_id);
			
			// 패널티 적용 여부 확인해서 패널티 있으면 경고창, 없으면 라이딩 생성 요청
			$.ajax(
			{
				type:"POST"
				, url:"penaltycheck.action"
				, success:function(data)
				{
					//alert("안녕 나 penaltycheck.action 에이젝스야 성공했어");
					
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
	
	
</script>
<style type="text/css">
	.calendar-box
	{
		height: 600px;
	}
	.map-box
	{
		background-color: orange;
		height: 566px;
	}
	.btn-box
	{
		text-align: right;
	}
	.select-box
	{
		width: 70%;
	}
	
	/* 달력 스타일 */
	
	#calendar
	{
		height: 600px;
	}
	#calendarTr > td
	{
		font-weight: bold;
		text-align: center;
		vertical-align: middle;
	}
	td
	{
		width: 20px;
	}
	th
	{
		font-size: 16px;
		text-align: center;
		vertical-align: middle;
	}
	a
	{
		color: black;
	}
	.count
	{	
		margin-top: auto;
		text-align: right;
	}
	ul
	{
		list-style: none;
		float: right;
	}
	/* 
	.dayBox
	{
		display: flex;
	    flex-direction: column;
	    flex-wrap: nowrap;
	    align-content: space-between;
	    justify-content: space-between;
	    align-items: stretch;
	    height: 100%;
	}
	 */
</style>
</head>
<body>
<!-- 헤더 -->
<div>
	<c:import url="Header.jsp"></c:import>
</div>
<div class="row">
	<!-- 달력 들어갈 div -->
	<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 ">
		<div class="calendar-box">
			<table align="center" id="calendar" class="table table-bordered">
				<tr>
					<th colspan="6" style="vertical-align: middle;">
						<a href="javascript:beforeMonth()" class="glyphicon glyphicon-chevron-left" id="before"></a>
						<span id="yearAndMonth"></span>
						<a href="javascript:nextMonth()" class="glyphicon glyphicon-chevron-right" id="next"></a>
					</th>
					<th colspan="1" style="vertical-align: middle;"><a href="javascript:thisMonth()">오늘</a></th>
				</tr>
				<tr id="calendarTr">
					<td style="color: red;">일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td style="color: blue;">토</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 지도 들어갈 div -->
	<!-- 회원일 경우 적용 -->
	<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
		<div class="select-box">
			<select name="" id="" class="form-control">
				<option value="">맛집 보기</option>
				<option value="">편의시설 보기</option>
			</select>
		</div>
		
		<div class="map-box">
			<!-- 지도 들어갈 div -->
		</div>
	</div>
	
	<!-- 비회원일 경우 적용 -->
	<!-- 
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<p>편의시설 보기</p>
		<div class="map-box">
			지도 들어갈 div
		</div>
	</div> 
	-->
</div>

<!-- 하단 버튼(회원/관리자) / 비회원일 경우 적용 안 함 -->
<!-- 회원일 경우 적용 -->
<c:choose>
<c:when test="${sessionScope.user_id!=null && sessionScope.user_id!=0 && sessionScope.user_id!=1}">  
<div class="row btn-box"> 
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<input type="button" class="btn btn-default" value="모임 생성하기" id="openRidingBtn"/>
	</div>
</div>
</c:when>
</c:choose>
<!-- 관리자일 경우 적용 -->
<c:choose>
<c:when test="${sessionScope.user_id==0 || sessionScope.user_id==1 }">  
<div class="row btn-box"> 
	<input type="button" class="btn btn-default" value="관리자 페이지로 이동" onclick="location.href='Manager.action'"/>
</div>
</c:when>
</c:choose>

<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</body>
</html>