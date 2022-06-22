<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParticipateRiding.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		//도움말
		$("[data-toggle='tooltip']").tooltip();
		
		$("#nowRiding").click(function()
		{
			alert("해당 라이딩 모임 상세보기로 이동.");
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
<!-- 참여중인 라이딩 조회 페이지 -->
<!-- ParticipateRiding.jsp -->

<div class="container">
	<div>
		<table class="table table-bordered">
			<tr>
				<th>모임명</th>
				<th>기간</th>
				<th>모임상태 
				<!-- 도움말 -->
				<a href="#" 
				data-toggle="tooltip"
				data-placement="bottom" 
				title="모집중이란 ? 모든 사용자가 참가가능한 모임의 상태 
					&#10;모집완료란? 참가 불가능하고 참여자들은 준비를 해야하는 상태 
					&#10;확정이란? 모든 참여자가 준비했고 확정되어서 출발상세장소를 확인할 수 있어요." 
					class="bi bi-question-circle-fill"></a>
					
				</th>
				<th>모임으로 이동</th>
			</tr>
			
			<tr>
				<%-- <td>${riding_name }</td> --%>
				<td>쌍용강북</td>
				<%-- <td>${gigan }</td> --%>
				<td>2021.12.30 ~ 2022.06.20</td>
				<%-- <td>${condition }</td> --%>
				<td>수료당~!</td>
				<td>
					<button type="button" id="nowRiding" class="btn btn-default">
						모음으로 이동
					</button>
				</td>
			</tr>
			
		</table>
	</div>
	
		
	<div style="text-align: right;">
		<!-- MyPageMain.jsp 로 이동. -->
		<button id="myPageMain">마이페이지로 이동</button>
	</div>

</div>


</body>
</html>