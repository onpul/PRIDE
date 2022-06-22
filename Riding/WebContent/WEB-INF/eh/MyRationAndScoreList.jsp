<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRationAndScoreList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		// 도움말 
		$("#plz").mouseover(function()
		{
			$("#plzDiv").css("display","block");
		});
		
		$("#plz").mouseout(function()
		{
			$("#plzDiv").css("display","none");
		});
		
		// 마이페이지로 이동
		$("#myPageMain").click(function()
		{
			
			location.replace("mypagemain.action");
			
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 부트스트랩 아이콘  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<!-- MyRationAndScoreList.jsp -->
<!-- 등급 및 점수 조회 페이지 -->
<div class="container">
	<div class="col col-xs-12">
		<span>나의 등급</span>
		<span>나의 공헌도</span>
	</div>
	
	<div class="col col-xs-12">
		<span>금전거</span>
		<span>금헬멧</span>
	</div>
	
	<div class="col col-xs-12">
		<span>나의 점수</span>
		<div>
			리더십 점수 : <span>10 / 20</span>
		</div>
		
		<div>
			매너 점수 : <span>40 / 50</span>
		</div>
		
		<div>
			체력 점수 : <span>10 / 30</span>
		</div>
		
		<div>
			총점 : <span>60 / 100</span>
			
		</div>
	</div>
	
	<div class="col col-xs-12">
		<span>나의 공헌도</span>
		<div>
			공헌도 : <span>40 / 100</span>
			<span class="bi bi-question-circle-fill" id="plz"></span>
		</div>
		<div id="plzDiv" style="display: none; color: red;">
			공헌도란? 어쩌고 입니다 ~ 
		</div>
	</div>
	
	<div class="col col-xs-12" style="text-align: right;">
		<!-- MyPageMain.jsp 로 이동. -->
		<button id="myPageMain">목록으로</button>
	</div>
</div>
</body>
</html>