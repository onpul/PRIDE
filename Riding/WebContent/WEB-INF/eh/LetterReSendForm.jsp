<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String receiveUser = request.getParameter("user");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LetterReSendForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		//$("#receiveUser").val("100");
		
		//전송
		$("#submitBtn").click(function()
		{
			//alert($("#searchUser").val()=="");
			
			if($("#content").val()=="")
			{
				alert("내용을 입력하세요.");
			}
			else
				$("#myForm").submit();
			
			
			
			/*
			$("#myForm").submit(function()
			{
				alert("들어오나");
				if ($("#content").val()=="")
				{
					alert("내용을 입력하세요.");
					return false;
				}
			});
			*/
			
		});
		
		// 취소
		$("#notSaveBtn").click(function()
		{
			var result = confirm("작성하신 내용은 저장되지 않습니다. \n 정말로 취소하시겠습니까?");
			
			if(result)
				location.replace("letterlist.action");
		});
		
		
		
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
  }
	
</style>
</head>
<body>
<!-- 쪽지 생성 폼 -->
<!-- LetterSendForm.jsp -->

<!-- main div -->
<div class="container">
	<form action="lettersendform.action" method="get" id="myForm">
		<div class="form-group">
			받는 사람(ID) <input type="text" id="receiveUser" readonly="readonly" value="<%=receiveUser%>" name="receiveUser">
			
			<br /><label>내용작성하기</label>
			<textarea rows="80" cols="80" id="content" name="content"></textarea>
		</div>
			
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary" id="submitBtn">전송</button>
			<button type="button" class="btn btn-default" id="notSaveBtn">취소</button>
		</div>
	</form>
</div><!-- main div close -->
</body>
</html>