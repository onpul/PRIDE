<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPageMain.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		var user_id = $("#user_id").val();
		//alert("user_id"+user_id);
		
		$("#myRidingList").click(function()
		{
			//나의 라이딩 스타일 조회하기
			//alert("RidingStyleListUpdateForm.jsp 로 이동.")
			location.replace("ridingstylelistupdateform.action?user_id="+user_id);
		});
		
		$("#currenRidingList").click(function()
		{
			//참여 중인 라이딩 조회하기
			//alert("ParticipateRidingList.jsp 로 이동.")
			
			
			
			
			location.replace("participateridinglist.action?user_id="+user_id);
			
			/* 
			//ajax 처리
			$.ajax(
			{
				type:"GET"
				,url:"participatedriding.action?user_id="+ user_id
				,success: function(data)
				{
					//alert("data : "+ data);
					alert("넘어온 값은 ? : " + data);
					if (data == 1)
					{
						location.replace("evaluationleaderform.action?user_id="+user_id);
					}
					else if (data ==2)
					{
						location.replace("evaluationmemberform.action?user_id="+user_id);
					}
					else if (data ==3)
					{
						alert("이미 평가지를 제출하셨습니다.");
					}
					else if (data ==4)
					{
						alert("평가기간에 속하는 모임이 없습니다.");
					}
					else
						alert("여기는 넘어올리가 없음");
				}
				
				,error: function(e)
				{
					alert("따란~ 에이젝스 문제랍니다~"+e.responseText);
				}
			});
			 */
			
			
		});

		$("#succRiding").click(function()
		{
			//완료한 라이딩 평가하기
			//방장이면, EvaluationLeaderForm.jsp 로 이동
			//참여자이면,EvaluationMemberForm.jsp 로 이동
			//alert(" EvaluationLeaderForm.jsp 로 이동.")
			//location.replace("evaluationleaderform.action");
			
			//ajax 처리
			$.ajax(
			{
				type:"GET"
				,url:"evaldate_ok.action?user_id="+ user_id
				,success: function(data)
				{
					//alert("data : "+ data);
					//alert("넘어온 값은 ? : " + data);
					if (data == 1)
					{
						location.replace("evaluationleaderform.action?user_id="+user_id);
					}
					else if (data ==2)
					{
						location.replace("evaluationmemberform.action?user_id="+user_id);
					}
					else if (data ==3)
					{
						alert("이미 평가지를 제출하셨습니다.");
					}
					else if (data ==4)
					{
						alert("평가기간에 속하는 모임이 없습니다.");
					}
					else
						alert("이외");
				}
				
				,error: function(e)
				{
					alert("따란~ 에이젝스 문제랍니다~"+e.responseText);
				}
			});
		});
		
		$("#ridingRecordList").click(function()
		{
			//라이딩 기록 조회하기
			//alert(" MyRidingRecordList.jsp 로 이동.")
			location.replace("myridingrecordlist.action?user_id="+user_id);
		});
		
		$("#comeOnList").click(function()
		{
			//초대장 조회하기
			alert(" Invite.jsp 로 이동.")
		});
		
		$("#friList").click(function()
		{
			//친구 목록 조회하기
			alert(" Friend.jsp  로 이동.")
		});
		
		$("#scoreList").click(function()
		{
			//등급 및 점수 조회하기
			//alert(" MyRationAndScoreList.jsp  로 이동.")
			location.replace("myrationandscorelist.action?user_id="+user_id);
		});
		
		$("#reviewList").click(function()
		{
			//작성한 게시글 조회하기
			//alert(" MyReviewList.jsp  로 이동.")
			location.replace("myreviewlist.action?user_id="+user_id);
		});
		
		$("#penaltyList").click(function()
		{
			//나에게 적용된 패널티 조회하기
			//alert(" MyPenaltyList.jsp  로 이동.")
			location.replace("mypenaltylist.action?user_id="+user_id);
		});
		
		
		
		
		
		$("#MyInfoUpdateForm").click(function()
		{
			//개인정보 수정하기
			//alert(" MyInfoUpdateForm.jsp  로 이동.")
			location.replace("myinfoupdateform.action?user_id="+user_id);
		});
		
		$("#MemberSecession").click(function()
		{
			//회원 탈퇴하기
			//alert(" MemberSecession.jsp  로 이동.")
			window.open("membersecession.action?user_id="+user_id,"","width=400px,height=400px");
		});
		
		
		$("#tempBtn").click(function()
		{
			window.open("letterlist.action?user_id="+user_id,"","width=400px,height=400px");
		});
		
		
		
	});
	
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	
	*{font-size: large;}

</style>
</head>
<body>

<!-- 마이페이지 메인 -->
<!-- MyPageMain.jsp -->

<div class="container">
	<!-- 맨윗부분 -->
	<div class="row">
		<!-- left -->
		<div class="col-xs-4" style="background-color: aqua;">
			<div style="text-align: center;">
				<!-- 프로필 아이콘 이미지로 변경예정 -->
				<div class="glyphicon glyphicon-user">${pi_address }</div> 
			</div>
			<div style="text-align: center;">
				<!-- <span>cherry5813@naver.com</span> -->
				<span>${email }</span>
				
			</div>
		</div>
		
		<!-- center -->
		<div class="col-xs-4" style="background-color:yellow;">
			<div style="text-align: center;">
				<!-- <span>체리</span> -->
				<input type="hidden" id="user_id" value="${user_id }">
				<span>${nickname }</span>
			</div>
			
			<div style="text-align: center;">
				<!-- <span>오늘도 라이딩~!!!</span> -->
				<%-- <span>${oneword }</span> --%>
				<span>정적한마디 (update 구현하고 변경 예정)</span>
			</div>								
		</div>
		
		<!-- right -->
		<div class="col-xs-4">	
			<div style="text-align: center;">
				<div>자전거 이미지</div>
			</div>
			
			<div style="text-align: center;">
				<div>헬멧 이미지</div>
			</div>
		</div>
	</div>
	
	
	<div class="row" style="background-color: silver;">
		<div class="col-xs-12">
			<li style="list-style: none;">
				<!-- RidingStyleListUpdateForm.jsp 로 이동. -->
				<ul><span id="myRidingList">나의 라이딩 스타일 조회하기</span></ul>
				
				<!-- ParticipateRidingList.jsp 로 이동. -->
				<ul><span id="currenRidingList">참여 중인 라이딩 조회하기</span></ul>
				
				<!-- 방장이면, EvaluationLeaderForm.jsp 로 이동 -->
				<!-- 참여자이면,EvaluationMemberForm.jsp 로 이동  -->
				<ul><span id="succRiding">완료한 라이딩 평가하기</span></ul>
				
				<!-- MyRidingRecordList.jsp 로 이동 -->
				<ul><span id="ridingRecordList">라이딩 기록 조회하기</span></ul>
				
				<!-- Invite.jsp 로 이동. -->
				<ul><span id="comeOnList">초대장 조회하기</span></ul>
				
				<!-- Friend.jsp 로 이동. -->
				<ul><span id="friList">친구 목록 조회하기</span></ul>
				
				<!-- MyRationAndScoreList.jsp 로 이동. -->
				<ul><span id="scoreList">등급 및 점수 조회하기</span></ul>
				
				<!-- MyReviewList.jsp 로 이동. -->
				<ul><span id="reviewList">작성한 게시글 조회하기</span></ul>
				
				<!-- MyPenaltyList.jsp 로 이동. --> 
				<ul><span id="penaltyList">나에게 적용된 패널티 조회하기</span></ul>
				
			</li>
		</div>
	</div>
	
	<div class="row" style="background-color:green;">
		<!-- left -->
		<div class="col-xs-6" style="text-align: center;">
			<!-- MyInfoUpdateForm.jsp 로 이동. -->
			<button id="MyInfoUpdateForm" class="btn btn-outline-primary">개인정보 수정하기</button>
		</div>
		
		<!-- right -->
		<div class="col-xs-6" style="text-align: center;">
			<!-- MemberSecession.jsp 로 이동. -->
			<button id="MemberSecession" class="btn btn-outline-primary">회원 탈퇴하기</button>
		</div>
	</div>
	
	<div>
		<button type="button" id="tempBtn">
			쪽지 조회하기 (임시버튼)
		</button>	
	</div>
</div>
</body>
</html>