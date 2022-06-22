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
		// 상세내용 보기
		$(".reviewBtn").click(function()
		{
			var reviewId = $(this).val();
			alert("DetailReview.jsp로 reviewId 들고 이동.");
			//location.replace("DetailReview.jsp?reviewId="+reviewId);
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
<head>
<meta charset="UTF-8">
<title>MyReviewList.jsp</title>
</head>
<body>
<!-- 내가 작성한 후기 게시글 조회 -->
<!--  MyReviewList.jsp-->
<div class="container">

	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>상세내용 보기</th>
		</tr>
		
		<tr>
			<td>1</td>
			<td>홍대맛집</td>
			<td>2022-04-23</td>
			<td>1</td>
			<td>
				<button type="button" class="btn btn-default reviewBtn" value="1">
					상세내용 보기
				</button>
			</td>
		</tr>
		
		<tr>
			<td>2</td>
			<td>엄청맛집</td>
			<td>2022-04-23</td>
			<td>10</td>
			<td>
				<button type="button" class="btn btn-default reviewBtn" value="1">
					상세내용 보기
				</button>
			</td>
		</tr>
	</table>
	
	<div class="col col-xs-12" style="text-align: right;">
		<!-- MyPageMain.jsp 로 이동. -->
		<button type="button" id="myPageMain" class="btn btn-default">마이페이지로 이동</button>
	</div>
	
	
</div>
</body>
</html>