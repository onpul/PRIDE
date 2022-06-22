<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평가 점수 관리 페이지</title>
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
		/* 회원 검색 창을 눌렀을 때 */
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
				/* 평가 점수 수정 창으로 */
				var url = "EvaluationScoreUpdateForm.jsp";
				var param = "?id=" + $('#hiddenId input').val();
				
				window.open(url+param, "", "width=500, height=500");
			}
			
		});
		/* 닫기 or 돌아가기 버튼 눌렀을 때 */
		$("#backBtn").click(function()
		{
			/* 
			window.close(); 맞나? 여하튼 닫거나
			이전 페이지로 location.href= 'url'					
			*/
		});
	});

	/* 회원 검색 창으로 */
	function popUpSearchUser()
	{
		var url = "SearchUser.jsp";
		
		window.open(url, "", "width=500, height=500");
		/* 
		https://pjsprogram.tistory.com/8  -- spring ajax 처리 참조 링크		
		*/
	}
	
	/* 유저의 평가 점수 정보 불러오기 */
	function loadUserInfo(userId, userNick)
	{
		$("#userId").text("회원ID: " + userId);
		$("#userNick").text("닉네임: " + userNick);
		
		$("#hiddenId input").val(userId);
		
		$("#updateBtn").css("display", "");
		
		/*
		$.post("평가점수 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			$("#hiddenId input").val(userId);
			$("#manner").html(data.manner);
			$("#leadership").html(data.leadership);
			$("#difficulty").html(data.difficulty);
			$("#stamina").html(data.stamina);
			
		});
		*/
	}
	
	function ajaxEvaluation()
	{
		/* 
		$.post("평가점수 정보 구해올 url"
		, {
			id:userId
		}, function(data)
		{
			$("#manner").html(data.manner);
			$("#leadership").html(data.leadership);
			$("#difficulty").html(data.difficulty);
			$("#stamina").html(data.stamina);
		});
		*/
	}

</script>


</head>
<!-- TODO -->
<!--  
    *. div >> 부트스트랩 table
       - 해결
    
	2. 회원 검색칸 or 검색 버튼 클릭 시 SearchUser 페이지 새 창 등장. 
	   이 때 현재 페이지가 어디인지 같이 넘겨준다.
	   - 대충 해결
	   
	3. SearchUser 페이지에서 회원 ID 넘어온 것 받기.
	   - 대충 해결
	   
	4. 왼쪽 상단의 ID, 닉네임 값 AJAX로 표현
	   - AJAX아니어도 가능했고, 대충 해결
	   
	5. 회원ID를 통해 평가 점수 출력. AJAX로 구현.
	   - AJAX아닌데 대충 로직 생각해둠
	 
	*. 수정 버튼 클릭 시 EvaluationScoreUpdateForm 새 창 등장
	   - 뜬다.
	   
	*. 이 때 회원 ID값을 같이 넘겨준다.
	   - 넘어간다.
	   
	8. 닫기 or 돌아가기 버튼 클릭시 Manager.jsp로 돌아간다.
	   - 모양새만 갖춤
	
-->

<body>
<!-- # 페이지 설명
	   회원을 검색하고, 선택한 회원의 평가 점수 조회 및 수정 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>평가 점수 관리</h3>
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


<!-- 검색한 회원을 선택했을 때, 해당 회원의 평가 점수 관련 정보가 노출되는 곳 -->
<table class="table table-bordered">
	<tr>
		<th>리더십 점수</th>	
		<th>매너 점수</th>	
		<th>체력 점수</th>	
		<th>난이도 점수</th>	
		<th>옵션</th>	
	</tr>
	<tr>
		<td id="hiddenId" style="display:none;">
			<input type="hidden" value="" />
		</td>
		<td id="leadership">&nbsp;</td>
		<td id="manner">&nbsp;</td>
		<td id="stamina">&nbsp;</td>
		<td id="difficulty">&nbsp;</td>
		<td>
			<!-- 버튼 클릭 시 평가 점수 수정 페이지 팝업 -->
			<button style="display:none;" id="updateBtn" type="button">수정</button>
		</td>
	</tr>
</table>
<br />
<br />

<!-- 평가 점수 관리 페이지를 닫거나, 이전 페이지로 돌아감 -->
<div>
	<button type="button">
		돌아가기 or 닫기
	</button>
</div>
</body>
</html>