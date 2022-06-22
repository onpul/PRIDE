<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	System.out.println(cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 발생 페이지</title>
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
		/* 신고 내역 조회로 이동하는 버튼 */
		$("#listBtn").on("click", function()
		{
			$(location).attr("href", "ReportList.jsp");
		});
		
		/* 신고 처리 로그로 이동하는 버튼 */
		$("#logBtn").on("click", function()
		{
			$(location).attr("href", "ReportHandlingLog.jsp");
		});
		
		
		/* 돌아가기 or 닫기 버튼 */
		$("#cancelBtn").on("click", function()
		{
			$(location).attr("href", "url");
		});
		
		// 미처리 신고 내역 수 보여주기
		/* 
		$.post("url"
		, {
			
		}, function(data)
		{
			$("#alarmBadge").html(data);
		});		
		*/
		
	});

</script>



</head>

<!-- TODO -->
<!--  
	 1. 신고 내역 조회 클릭: ReportList로 이동 (스프링)
	    -- 구조만
	 2. 신고 처리 로그 클릭: ReportHandlingLog로 이동 (스프링)
	    -- 구조만
	 3. 신고 내역 조회 옆에 [ ] 안에 숫자. (DB 값 불러오기)
	    -- 구조만
	 4. 돌아가기 or 닫기 버튼: 현재 창 닫기 or 이전 페이지로
	    -- 주소 나중에 추가할 것.
-->

<body>

<!-- # 페이지 설명
	   관리자가 발생한 신고 및 신고 처리 로그를 조회하는 페이지 -->

<!-- 제목 -->	   
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>신고 발생</h3>
</div>

<div>
	<!-- 신고 내역 조회 페이지로 넘어가는 버튼 -->
	<!-- [] 안의 숫자는, 현재 대기 상태인 신고 글 수이다. -->
	<div>
		<button id="listBtn" type="button">
			신고 내역 조회 <span id="alarmBadge" class="badge bg-secondary">3</span>
		</button>
	</div>
	
	<br /><br />
	
	<!-- 신고 처리 로그 페이지로 넘어가는 버튼 -->
	<div>
		<button id="logBtn" type="button">
			신고 처리 로그
		</button>
	</div>
</div>

<br /><br />

<!-- 이전 페이지로 돌아가거나, 현재 창을 닫는 버튼 -->
<div>
	<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
	<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
</div>
</body>
</html>