<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyInfoUpdateForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#profilePhoto").click(function()
		{
			window.open("profilephotoupdateform.action","","width=400px,height=400px");
		});
		
		$("#oneWord").click(function()
		{
			window.open("onewordupdateform.action","","width=400px,height=400px");
		});
		
		$("#nickName").click(function()
		{
			window.open("nicknameupdateform.action","","width=400px,height=400px");
		});
		
		
		$("#changePwd").click(function()
		{
			$("#newPwd").prop("readonly",false);
			$("#newPwd").css("background-color","white");
		});
		
		$("#newPwd").click(function()
		{
			$("#newPwdCheck").prop("readonly",false);
			$("#newPwdCheck").css("background-color","white");
		});
		
		$("#newPwdCheck").keyup(function()
		{
			alert("키보드업");
		});
		
		
		$("#updateBtn").click(function()
		{
			// 현재 비밀번호는 필수입력값.
			// 사용자의 현재 비밀번호와 일치하는지 확인 후,
			// 일치하면 
			// 수정완료 알림 창 띄우기
			// MyPageMain.jsp로 이동
			
			// 일치 안하면 
			// alert("비밀번호가 일치하지 않습니다.")
			// 현재 비밀번호 칸을 clear 한 뒤, focus 두고
			// MyInfoUpdateForm.jsp에 남아있기
			
			var dbNowPwd = "1234";
			
			if ($("#nowPwd").val()!=dbNowPwd)
			{
				alert("비밀번호가 일치하지 않습니다.");
			}
			else
			{
				alert("수정이 완료되었습니다.");
				$("#myForm").submit();
			}
			
			
		});
		
		$("#cancellBtn").click(function()
		{
			// 사용자의 응답을 받아 처리하는 alert()띄우기 (확인 / 취소)
			//alert("수정 사항은 저장되지 않습니다. 정말로 취소하겠습니까?");
			var result = confirm("수정 사항은 저장되지 않습니다. 정말로 취소하시겠습니까?");
			if (result)
			{
				location.replace("mypagemain.action");
			}
			
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<!-- 개인정보수정폼 페이지 -->
<!-- MyInfoUpdateForm.jsp -->


<!-- 맨 윗 줄 -->
<div class="container">
	<div class="col col-xs-12" style="text-align: center;">
		<div id="profilePhoto">
			프로필 사진
		</div>
	
		<div id="oneWord">
			한마디
		</div>
		
		<div id="nickName">
			홍체리
		</div>
	</div>
		
	<div class="col col-xs-12">
		<form action="" method="get" id="myForm">
			<table class="table table-bordered">
				<tr>
					<th>현재 비밀번호</th>
					<td>
						<input type="password" id="nowPwd"/>
						<button type="button" id="changePwd">
							비밀번호 변경하기
						</button>
					</td>
				</tr>
				
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" id="newPwd" readonly="readonly"
						style="background-color: gray;"/>
					</td>
				</tr>
				
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="newPwdCheck" readonly="readonly"
						style="background-color: gray;"/>
						<span id="pwdCheckMsg" style="display: none; color: red; font-size: small;">
						비밀번호가 일치하지 않습니다.</span>
					</td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn btn-primary" id="updateBtn">수정하기</button>
				<button type="button" class="btn btn-primary" id="cancellBtn">취소</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>