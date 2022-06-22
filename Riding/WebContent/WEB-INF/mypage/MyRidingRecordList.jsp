<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRidingRecordList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		
		$(".recodeBtn").click(function()
		{
			var rideId = $(this).val();
			location.replace("myridingrecord.action?rideId="+rideId);
		});
		
		// 마이페이지 이동
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
<!-- 라이딩 기록 리스트 조회 페이지 -->
<!-- MyRidingRecordList.jsp -->
<div class="container">
	<div class="col col-xs-12">
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>모임명</th>
				<th>라이딩 기간</th>
				<th>상세내용 보기</th>
			</tr>
		
		<!-- dao에서 list로 가져와서 c:foreach로 받아와서 뿌리는 곳 -->
			<tr>
				<td>1</td>
				<td>새벽반</td>
				<td>2022-05-23 12:00 ~ 2022-05-24 09:00</td>
				<td>
					<button value="1" type="button"  class="btn btn-default recodeBtn">
						상세내용 보기
					</button>
				</td>
			</tr>
			
			<tr>
				<td>2</td>
				<td>20대</td>
				<td>2021-05-23 12:00 ~ 2021-05-24 09:00</td>
				<td>
					<button value="2" type="button"  class="btn btn-default recodeBtn" name="2">
						상세내용 보기
					</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="col col-xs-12" style="text-align: right;">
		<!-- MyPageMain.jsp 로 이동. -->
		<button id="myPageMain"  class="btn btn-default">마이페이지로 이동</button>
	</div>
</div>
</body>
</html>