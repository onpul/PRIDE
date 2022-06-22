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
<title>공헌도 점수 관리 페이지</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		/* 회원 검색 누르면 회원 검색 창 등장  */
		$("#searchUser").on("click", function()
		{
			popUpSearchUser();
		});
		
		/* 수정 버튼 눌렀을 때 */
		$("#updateBtn").on("click", function()
		{
			/* 회원 검색이 이루어지지 않았다면, 회원 검색부터 */
			if ( $('#hiddenId input').val() == "" )
			{
				//alert("유저 선택부터 하슈");
			}
			else
			{
				//alert("오케이");
				/* 공헌도 점수 수정 창으로 */
				var url = "ContributionScoreUpdateForm.jsp";
				var param = "?id=" + $('#hiddenId input').val();
				
				window.open(url+param, "", "width=500, height=500");
			}
			
		});
		
		/* 닫기 or 돌아가기 버튼 눌렀을 때 */
		$("#backBtn").on("click", function()
		{
			/* 
			window.close(); 맞나? 여하튼 닫거나
			이전 페이지로 location.href= 'url'					
			*/
		});
	});

	/* 회원 검색 창 연결 */
	function popUpSearchUser()
	{
		var url = "SearchUser.jsp";
		
		window.open(url, "", "width=500, height=500");
		/* 
		https://pjsprogram.tistory.com/8  -- spring ajax 처리 참조 링크		
		*/
	}
	
	/* 유저의 점수 정보 불러오기 */
	function loadUserInfo(userId, userNick)
	{
		$("#userId").text("회원ID: " + userId);
		$("#userNick").text("닉네임: " + userNick);
		
		$("#hiddenId input").val(userId);
		
		$("#updateBtn").css("display", "");
		
		/*
		$.post("공헌도 점수 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			$("#hiddenId input").val(userId);
			$("#grade").html(data.grade);
			$("#score").html(data.score);
		});
		*/
	}
	
	/* 공헌도 점수 수정 후 다시 불러오기 */
	function ajaxContribution()
	{
		/* 
		$.post("공헌도 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			$("#grade").html(data.grade);
			$("#score").html(data.score);
		});
		*/
	}

</script>

</head>

<!-- TODO -->
<!--  
    *. div >> 부트스트랩 테이블로
       해결
    
	2. 회원 검색칸 or 검색 버튼 클릭 시 SearchUser 페이지 새 창 등장. 
	   이 때 현재 페이지가 어디인지 같이 넘겨준다.
	   -- 현재 페이지 어디인지 넘겨줄 필요는 없고 일단 간단하게 구현
	
	3. SearchUser 페이지에서 회원 ID 넘어온 것 받기.
	   -- 간단하게 구현해놓음.
	
	4. 왼쪽 상단의 ID, 닉네임 값 AJAX로 표현
	   -- 마찬가지. AJAX 사용하진 않았음. AJAX 쓰지 않아도 정상작동하기 때문에...
	   
	5. 회원ID를 통해 공헌도 점수 출력. AJAX로 구현.
	   -- AJAX 양식 구현
		 
	6. 수정 버튼 클릭 시 ContributionScoreUpdateForm 새 창 등장
	   -- 대충 구현
	   
	7. 이 때 회원 ID값을 같이 넘겨준다.
	   -- 대충 넘김.
	   
	8. 닫기 or 돌아가기 버튼 클릭시 Manager.jsp로 돌아간다.
	
-->

<body>
<!-- # 페이지 설명
	   회원을 검색하고, 선택한 회원의 공헌도 점수 조회 및 수정 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>공헌도 점수 관리</h3>
</div>

<!-- 회원 검색 후 회원을 선택했을 때, 해당 회원의 아이디와 닉네임 노출되는 곳 -->
<!-- 밑의 div와 같은 line에 노출. block 단위 -->
<div>
	<span id="userId">
		ID: &nbsp;&nbsp;
	</span>
	&nbsp;/&nbsp;&nbsp;
	<span id="userNick">
		닉네임 : &nbsp;&nbsp;
	</span>
</div>

<!-- 회원 검색. input 칸이나 검색 버튼을 누르면 회원 검색 페이지(SearchUser) 팝업 -->
<div>
	<span id="searchUser">
		<input type="text" placeholder="회원 검색"/>
		<button type="button">검색</button>
	</span>
</div>

<!-- 회원을 선택했을 때, 해당 회원의 공헌도 점수 관련 정보가 노출되는 곳 -->
<table class="table table-bordered">
	<tr>
		<th>공헌도 등급</th>	
		<th>공헌도 점수</th>	
		<th>옵션</th>	
	</tr>
	<tr>
		<td id="hiddenId" style="display:none;">
			<input type="hidden" value="" />
		</td>
		<td id="grade">&nbsp;</td>
		<td id="score">&nbsp;</td>
		<td>
			<!-- 버튼 클릭 시 공헌도 점수 수정 페이지 팝업 -->
			<button style="display:none;" id="updateBtn" type="button">수정</button>
		</td>
	</tr>
</table>

<br />
<br />

<!-- 공헌도 점수 관리 페이지를 닫거나, 이전 페이지로 돌아감 -->
<div>
	<button id="backBtn" type="button">
		돌아가기 or 닫기
	</button>
</div>
</body>
</html>