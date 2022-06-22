<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRigingRecord.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#ridingList").click(function()
		{
			location.replace("myridingrecordlist.action");
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
</head>
<body>
<!-- 라이딩 기록 상세보기 페이지 -->
<!-- MyRigingRecord.jsp -->

<div class="container">
	<div class="col col-xs-12" style="text-align: center;">
		<table class="table-bordered" style="width: 100%;">
			<tr>
				<th>모임명</th>
				<th>기간</th>
				<th>방장</th>
				<th>참여자 이름</th>
				<th>경로</th>
			</tr>
			
			<tr>
				<td>새벽반</td>
				<td>2022-05-23 12:00 ~ 2022-05-24 09:00</td>
				<td>happy(happy@test.com)</td>
				<td>
					happy(happy@test.com) <br>
					돈(money@test.com) <br />
					좋아좋아(love@test.com) <br />
					탈퇴회원 <br />
				</td>
				<td>
					<div>
						경로
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="col col-xs-12" style="text-align: right;">
	<!-- MyPageMain.jsp 로 이동. -->
	<br /><br />
	<button id="ridingList" class="btn btn-default">라이딩기록리스트로 이동</button>
	<button id="myPageMain" class="btn btn-default">마이페이지로 이동</button>
	
	
</div>
</div>


</body>
</html>