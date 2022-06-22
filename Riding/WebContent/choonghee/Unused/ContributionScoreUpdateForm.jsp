<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공헌도 점수 수정 폼</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	/* 해당 회원의 현재 공헌도 점수 */
	var defaultValue;

	/* 말풍선(tooltip) 기능을 위해서 작성 */
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	/* 현재 공헌도 점수를 불러오고, 그 값을 점수 판에 넣어줌. */
	$(window).on("load",function()
	{
		/*
		$.post("공헌도 점수 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			$("#score").val(data);
		});
		*/
		
		$("#score").val(function()
		{
			defaultValue = 6;
			return defaultValue;
		});
		
		/* 말풍선(tooltip) 내용 */
		$("#updateScore").attr("title", "현재 공헌도 점수는 " + defaultValue);
		
	});
	
	$(function()
	{
		/* 좌클릭 시, 점수 감소 */
		$(".leftBtn").on("click", function()
		{
			
			if(Number($("#score").val()) > 0)
			{
				$("#score").val( Number($("#score").val()) - 1 );
			}
			
		});
		
		/* 우클릭 시, 점수 증가 */
		$(".rightBtn").on("click", function()
		{
			var max = Number(10);
			
			if(Number($("#score").val()) < max)
			{
				$("#score").val( Number($("#score").val()) + 1 );
			}
		});
		
		/* 숫자 입력 외에 제한 */
		/* 최소값 최대값 설정 */
		$("#score").on("keyup", function()
		{
			$(this).val( $(this).val().replace( /[^0-9]/gi,"") );
			
			if ( Number($("#score").val()) > 10)
				$("#score").val(10);
			if ( Number($("#score").val()) < 0 )
				$("#score").val(0);
			
		});
		
		/* 수정 버튼 클릭 후 */
		$("#updateBtn").on("click", function()
		{
			var result = confirm('수정할래?');
			
			if(result)
			{
				alert("진짜네...");
				
				var variance = $("score").val();
				
				/*
				$.post("공헌도 정보 수정할 url"
				, {
					id:userId
					, variance: variance
				}, function(data)
				{
					opener.ajaxContribution();
					window.close();	
				});
				*/
				
				opener.loadUserInfo("공헌도수정후", "그러하다");
				window.close();
				
				
				
			}
			else
			{
				//alert("응 구라.");
			}
		});
		
		/* 닫기 버튼 눌렀을 때 */
		$("#backBtn").on("click", function()
		{
			window.close();
		});
	})

</script>

</head>

<!-- TODO -->
<!--  
	1. 넘겨받은 ID 값을 통해 공헌도 점수 값을 불러온다.
	-- 약식 구현
	
	2. 0~(MAX) 점수 설정이 가능하다.
	-- 좌우 기능 구현
	
	3. 수정 버튼 클릭 시, confirm 창이 등장한다.
	-- 등장
	
	4. confirm에서 확인 후 마지막 alert 확인 버튼을 누르면 해당 창을 닫는다
	-- 오케이.
	
	5. confirm 이후 DB 과정 생각.
	-- 아이디와 점수 변화량 넘김
	
	6. 회원 ID값과 ContributionScoreManagement를 재요청한다.
	-- 재요청 아님 그냥 닫음.
	
	7. 취소 버튼 클릭 시 현재 생성 창을 닫는다.
	-- ok
-->

<body>

<!-- # 페이지 설명
	   해당 회원의 공헌도 점수 수정 -->

<!-- 제목 -->
<div>
	<h1>공헌도 점수 수정</h1>
</div>
<br />

<!-- 공헌도 점수 수정 폼 -->
<div>
	<form action="" class="form-inline" style="width:500px;">
		<div id="updateScore" class="form-group" data-toggle="tooltip" >
			<label for="score">공헌도</label>
			<!-- 왼쪽 버튼: 점수 감소 -->
			<button class="leftBtn" type="button" class="btn btn-default">
				<i class="glyphicon glyphicon-chevron-left"></i>
			</button>
			<!-- 기존 회원 점수 입력되어 있음. -->
			<input type="text" id="score" value="(기존 회원 점수)" class="form-control" >
			<!-- 오른쪽 버튼: 점수 증가 -->
			<button class="rightBtn" type="button" class="btn btn-default">
				<i class="glyphicon glyphicon-chevron-right"></i>
			</button>
		</div>
		<br /><br />
		
		<div class="form-group">
			<!-- 수정 버튼: ID + 점수 적용 폼 제출 -->
			<button id="updateBtn" type="button" class="btn btn-default">수정</button>
			<!-- 취소 버튼: 현재 수정 페이지를 닫기. (이전 페이지로) -->
			<button id="backBtn" type="button" class="btn btn-danger">취소</button>
		</div>
	</form>
</div>





</body>
</html>