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
		$("#sendLetter").click(function()
		{
			//alert() 뜨고 LetterSendForm.jsp로 이동하는 액션처리
			//alert("LetterSendForm.jsp로 이동합니다.");
			
			// 컨트롤러에서 받아서 변수에 담아서 GET 방식으로 처리.
			// 어차피 홍길동 한명만 뜸.
			location.replace('letterresendform.action?user=100');
		});
		
		$("#closeBtn").click(function()
		{
			location.replace('letterlist.action');
		});
		
		$("#deleteBtn").click(function()
		{
			// 사용자 응답을 받는 형태로 변경 예정.(확인 / 취소)
			//alert("정말 삭제하시겠습니까?");
			var result = confirm("해당 쪽지를 정말 삭제하시겠습니까? \n 삭제 시, 복구가 불가능합니다.");
			
			if(result)
				//쪽지삭제 컨트롤러로 이동.(거기서 액션처리하고 리다이렉트로 LetterList.jsp 이동)
				//location.replace('deleteletter.action');
				alert("삭제되었습니다.");
					
		});
		
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>Letter.jsp</title>
</head>
<body>
<!-- Letter.jsp -->
<!-- 쪽지 상세 내용 조회 -->
<!-- 서브창 형태로 열림. -->

<!-- main div -->
<div class="container">
	<div class="col col-xs-12">
		<table class="table table-default">
			<tr>
				<td>보낸사람</td>
				<td>홍길동</td>
			</tr>
			
			<tr>
				<td>받은 시간</td>
				<td>2022-05-21 21:29</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>안녕하세요.</td>
			</tr>
			
			<tr>
				<td colspan="2">내용</td>
			</tr>
			
			<tr>
				<td colspan="2">
					안녕하세요 <br> 홍길동입니다.
				</td>
			</tr>
		</table>
	</div>
		
	<br />
	
	<div class="col col-xs-12" style="text-align: center;">
		<!-- 쪽지 보내기 페이지로 이동. -->
		<!-- LetterSendForm.jsp -->
		<button type="button" class="btn btn-default" id="sendLetter">답장</button>
		
		<!-- 서브창 닫는 버튼 -->
		<button type="button" class="btn btn-default" id="closeBtn">닫기</button>
	
		<!-- 정말 삭제하겠냐고 물어보는 alert() 뜨기 -->
		<!-- 사용자 응답에 따라 삭제되었습니다 / 취소되었습니다. -->
		<button type="button" class="btn btn-default" id="deleteBtn">삭제</button>
		
		<span id="helpBlock" class="help-block">
		※누적된 쪽지가 100개를 초과하는 경우, <br>
		가장 오래된 쪽지부터 자동으로 삭제됩니다.
		</span>
	</div>
</div><!-- main div close -->


</body>
</html>