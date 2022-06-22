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
		$("#update").click(function()
		{
			var result = confirm("닉네임은 변경 시, 3개월간 재변경이 불가능합니다. \n 정말 변경하시겠습니까?");
			if (result)
			{
				$("#nickName",opener.document).text($("#newNickName").val());
				window.close();
			}
		});
		
		$("#calcel").click(function()
		{
			window.close();
		});
	});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>NickNameUpdate.jsp</title>
</head>
<body>
<div class="container">
	<div class="col col-xs-12">
		<table class="table table-bordered">
			<tr>
				<th>현재 닉네임</th>
				<td>홍체리</td>
			</tr>
			
			<tr>
				<th>변경할 닉네임</th>
				<td>
					<input type="text" id="newNickName"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="col col-xs-12">
		<button type="button" class="btn btn-default" id="update">변경하기</button>
		<button type="button" class="btn btn-default" id="calcel">취소</button>
	</div>
</div>
</body>
</html>