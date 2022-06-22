<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평가 점수 수정 폼</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	/* 해당 회원의 현재 평가 점수 목록 */
	var leadershipDefault;
	var mannerDefault;
	var staminaDefault;
	var difficultyDefalut;
	var evaluation;
	
	
	$(document).ready(function()
	{
		/* 말풍선(tooltip) 기능을 위해 작성 */
		$('[data-toggle="tooltip"]').tooltip();
		
		evaluation = ['leadership', 'manner', 'stamina', 'difficulty'];
	});
	
	/* 현재 평가 점수를 불러오고, 그 값을 점수 판에 넣어줌 */
	$(window).on("load", function()
	{
		/*
		$.post("평가 점수 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			
			$("#leadershipScore").val(data.leadershipScore);
			$("#mannerScore").val(data.mannerScore);
			$("#staminaScore").val(data.staminaScore);
			$("#difficultyScore").val(data.difficultyScore);
		});
		*/
		
		$("#leadershipScore").val(function()
		{
			leadershipDefault = 7;
			return leadershipDefault;
		});
		$("#mannerScore").val(function()
		{
			mannerDefault = 30;
			return mannerDefault;
		});
		$("#staminaScore").val(function()
		{
			staminaDefault = 10;
			return staminaDefault;
		});
		$("#difficultyScore").val(function()
		{
			difficultyDefault = 3;
			return difficultyDefault;
		});
		
		/* 말풍선(tooltip) 내용 */
		$("#leadershipScore").attr("title", "현재 리더십 점수는 " + leadershipDefault);
		$("#mannerScore").attr("title", "현재 매너 점수는 " + mannerDefault);
		$("#staminaScore").attr("title", "현재 체력 점수는 " + staminaDefault);
		$("#difficultyScore").attr("title", "현재 난이도 점수는 " + difficultyDefault);
	});
	
	$(function()
	{
		/* 좌클릭 시, 점수 감소 */
		$("#leadershipLeftBtn").on("click", function()
		{
			if(Number($("#leadershipScore").val()) > 0)
			{
				$("#leadershipScore").val( Number($("#leadershipScore").val()) - 1 );
			}
		});
		$("#mannerLeftBtn").on("click", function()
		{
			if(Number($("#mannerScore").val()) > 0)
			{
				$("#mannerScore").val( Number($("#mannerScore").val()) - 1 );
			}			
		});
		$("#staminaLeftBtn").on("click", function()
		{
			if(Number($("#staminaScore").val()) > 0)
			{
				$("#staminaScore").val( Number($("#staminaScore").val()) - 1 );
			}			
		});
		$("#difficultyLeftBtn").on("click", function()
		{
			if(Number($("#difficultyScore").val()) > 0)
			{
				$("#difficultyScore").val( Number($("#difficultyScore").val()) - 1 );
			}
			
		});
		
		/* 우클릭 시, 점수 증가 */
		$("#leadershipRightBtn").on("click", function()
		{
			if(Number($("#leadershipScore").val()) < 20)
			{
				$("#leadershipScore").val( Number($("#leadershipScore").val()) + 1 );
			}
		});
		$("#mannerRightBtn").on("click", function()
		{
			if(Number($("#mannerScore").val()) < 50)
			{
				$("#mannerScore").val( Number($("#mannerScore").val()) + 1 );
			}			
		});
		$("#staminaRightBtn").on("click", function()
		{
			if(Number($("#staminaScore").val()) < 20)
			{
				$("#staminaScore").val( Number($("#staminaScore").val()) + 1 );
			}			
		});
		$("#difficultyRightBtn").on("click", function()
		{
			if(Number($("#difficultyScore").val()) < 10)
			{
				$("#difficultyScore").val( Number($("#difficultyScore").val()) + 1 );
			}
			
		});
		
		/* 숫자만 입력 가능 */
		/* 최소값 설정 */
		$("input").on("keyup", function()
		{
			$(this).val( $(this).val().replace( /[^0-9]/gi,"") );
			
			if ( Number($(this).val()) < 0 )
				$(this).val(0);
		});
		
		/* 최대값 설정 */
		$("#leadershipScore").on("keyup", function()
		{
			if ( Number($(this).val()) > 20 )
				$(this).val(20);
		});
		$("#mannerScore").on("keyup", function()
		{
			if ( Number($(this).val()) > 50 )
				$(this).val(50);
		});
		$("#staminaScore").on("keyup", function()
		{
			if ( Number($(this).val()) > 20 )
				$(this).val(20);
		});
		$("#difficultyScore").on("keyup", function()
		{
			if ( Number($(this).val()) > 10 )
				$(this).val(10);
		});
		
		/* 수정 버튼 클릭 후 */
		$("#updateBtn").on("click", function()
		{
			var result = confirm('수정할래?');
			
			if(result)
			{
				alert("진짜네...");
				
				var leadership = $("#leadershipScore").val();
				var manner = $("#mannerScore").val();
				var stamina = $("#stamina").val();
				var difficulty = $("#difficulty").val();
				
				/*
				$.post("평가 정보 수정할 url"
				, {
					id:userId
					, leadership: leadership
					, manner: manner
					, stamina: stamina
					, difficulty: difficulty
					
				}, function(data)
				{
					opener.ajaxEvaluation();
					window.close();	
				});
				*/
				
				opener.loadUserInfo("평가점수 수정후", "그러하다");
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
	});
	
	
</script>


</head>

<!-- TODO -->
<!--  
	1. 넘겨받은 ID 값을 통해 평가 점수 값을 불러온다.
	-- 로직만
	
	*. 각 평가점수마다 0~(MAX) 점수 설정이 가능하다.
	-- 노가다 끝
	
	*. 수정 버튼 클릭 시, confirm 창이 등장한다.
	-- 등장
	
	*. confirm에서 확인 후 마지막 alert 확인 버튼을 누르면 해당 창을 닫는다
	-- 닫는다
	
	5. confirm할 때 넘어가서 하는 DB 과정 생각.
	-- 공헌도랑 비슷하지 않을까?
	
	6. 회원 ID값과 EvaluationScoreManagement를 재요청한다.
	-- 재요청 안해도 됨. 그냥 닫으면 됨.
	
	7. 취소 버튼 클릭 시 현재 생성 창을 닫는다.
	-- 잘 된다.

-->

<body>

<!-- # 페이지 설명
	   해당 회원의 평가 점수 수정 -->

<!-- 제목 -->	   
<div>
	<h1>평가 점수 수정</h1>
</div>

<br />

<!-- 평가 점수 수정 폼 -->
<div>
	<form action="" class="form-horizontal" style="width:500px;">
		<div class="form-group">
			<label for="leadershipScore" class="col-sm-2 control-label">리더십</label>
			<!-- 왼쪽 버튼: 점수 감소 -->
			<div class="col-sm-2">
				<button id="leadershipLeftBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</button>
			</div>
			<!-- 기존 회원 점수 입력되어 있음. -->
			<div class="col-sm-6">
				<input type="text" id="leadershipScore" value="(기존 회원 점수)" class="form-control" >
			</div>
			<!-- 오른쪽 버튼: 점수 증가 -->
			<div class="col-sm-2">
				<button id="leadershipRightBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</div>
		</div>
		<br />
		<div class="form-group">
			<label for="mannerScore" class="col-sm-2 control-label">매너</label>
			<!-- 왼쪽 버튼: 점수 감소 -->
			<div class="col-sm-2">
				<button id="mannerLeftBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</button>
			</div>
			<!-- 기존 회원 점수 입력되어 있음. -->
			<div class="col-sm-6">
				<input type="text" id="mannerScore" value="(기존 회원 점수)" class="form-control" >
			</div>
			<!-- 오른쪽 버튼: 점수 증가 -->
			<div class="col-sm-2">
				<button id="mannerRightBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</div>
		</div>
		<br />
		<div class="form-group">
			<label for="staminaScore" class="col-sm-2 control-label">체력</label>
			<!-- 왼쪽 버튼: 점수 감소 -->
			<div class="col-sm-2">
				<button id="staminaLeftBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</button>
			</div>
			<!-- 기존 회원 점수 입력되어 있음. -->
			<div class="col-sm-6">
				<input type="text" id="staminaScore" value="(기존 회원 점수)" class="form-control" >
			</div>
			<!-- 오른쪽 버튼: 점수 증가 -->
			<div class="col-sm-2">
				<button id="staminaRightBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</div>
		</div>
		<br />
		<div class="form-group">
			<label for="difficultyScore" class="col-sm-2 control-label">난이도</label>
			<!-- 왼쪽 버튼: 점수 감소 -->
			<div class="col-sm-2">
				<button id="difficultyLeftBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</button>
			</div>
			<!-- 기존 회원 점수 입력되어 있음. -->
			<div class="col-sm-6">
				<input type="text" id="difficultyScore" value="(기존 회원 점수)" class="form-control" >
			</div>
			<!-- 오른쪽 버튼: 점수 증가 -->
			<div class="col-sm-2">
				<button id="difficultyRightBtn" type="button" class="btn btn-default">
					<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</div>
		</div>
		<br />
		
		
		<div class="form-group">
			<div class="">
				<!-- 수정 버튼: ID + 점수 적용 폼 제출 -->
				<button id="updateBtn" type="button" onclick="" class="btn btn-default">수정</button>
				<!-- 취소 버튼: 현재 수정 페이지를 닫기. (이전 페이지로) -->
				<button id="backBtn" type="button" onclick="" class="btn btn-danger">취소</button>
			</div>
		</div>
	</form>
</div>


</body>
</html>