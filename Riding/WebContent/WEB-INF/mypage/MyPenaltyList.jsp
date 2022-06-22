<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#inquiry").click(function()
		{
			alert("Inquiry.jsp 로 이동");
			//location.replace("Inquiry.jsp");
		});
		
		// 마이페이지로 이동.
		$("#myPageMain").click(function()
		{
			location.replace("mypagemain.action");
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>MyPenaltyList.jsp</title>
</head>
<body>
<!-- MyPenaltyList.jsp -->
<!-- 나에게 적용된 패널티 조회하는 페이지 -->
<div class="container">
	<div class="col col-xs-12">
		<table class="table table-bordered">
			<tr>
				<th>패널티 적용 내용</th>
				<th>패널티 적용 원인</th>
				<th>패널티 적용 기간</th>
			</tr>
			
			<tr>
				<td>모임 생성 및 참여 정지</td>
				<td>
					<span style="font-weight: bold;">혜화역라이딩 모여라 ~!!!</span> <br />
					<span>
						모임의 시작시간 기준 24시간 전 확정버튼을 누르지 않음. <br>
						혹은 확정된 모임을 삭제함. <br>
					</span>
				</td>
				<td>2022-05-14 14:03 ~ 2022-05-28 14:03</td>
			</tr>
			
			<tr>
				<td>사이트 이용 정지</td>
				<td>
					<span style="font-weight: bold;">홍대맛집추천입니다.</span> <br />
					<span>허위 신고에 해당함.</span>
				</td>
				<td>2022-05-14 15:53 ~ 2022-05-28 15:53</td>
			</tr>
		</table>
	<div class="col col-xs-12" style="text-align: right;">
		<!-- Inquiry.jsp 로 이동. -->
		<button type="button" id="inquiry" class="btn btn-default">문의하기</button>
		
		<!-- MyPageMain.jsp 로 이동. -->
		<button type="button" id="myPageMain" class="btn btn-default">목록으로</button>
	</div>
</div>
</body>
</html>