<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LetterSendForm2.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#check").click(function()
		{
			// 주소처럼 처리하는 곳
			//alert("밑에 체크박스에서 선택되면 여기 받는 친구에 문자열이 입력되는 AJAX처리/ 확인 누르면 LetterSendForm.jsp이동");
			var friId = $(":text").val();
			$("#searchUser",opener.document).val(friId);
			window.close();
		});

		
		//체크된거 text에 value 넣기
		$(":radio").change(function()
		{
			$(":text").val($(this).val());
		});
		
		
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<!-- 친구 검색 시 쓰는 페이지 서브창 용 -->
<!-- LetterSendForm2.jsp -->
<div class="container">
	<div class="col col-xs-12" style="text-align: center;">
		<span style="font-weight: bold;">친구 목록</span>
	</div>
	
	<div class="col col-xs-12">
		<input type="text" placeholder="쪽지 받는 친구">
		<button class="btn btn-default" id="check">확인</button>
	</div>
	
	<!-- 위 text로 친구 검색하면 밑에 뜨는 거. -->		
	<div class="col col-xs-12">
		<!-- 회원 친구 인원수 구하는 쿼리문 필요. -->
		<span style="font-weight: bold;">친구 [ 3 ] 명</span>
		<!-- 회원 친구 리스트 조회하는 쿼리문 필요. -->
		<form class="radio">
			<label for="fri1"><input type="radio" name="fri" id="fri1" value="홍체리(hong@test.com)">홍체리(hong@test.com)</label>
			<br /><label for="fri2"><input type="radio" name="fri" id="fri2" value="체리짱(cherry@test.com)">체리짱(cherry@test.com)</label>
			<br /><label for="fri3"><input type="radio" name="fri" id="fri3" value="on1체리(on1@test.com)">on1체리(on1@test.com)</label>
			<hr />
			
			<span style="font-weight: bold;">이외의 친구 [ 2 ] 명</span>
			<br /><label for="allfri1"><input type="radio" name="fri" id="allfri1" value="장군(4213@test.com)">장군(4213@test.com)</label>
			<br /><label for="allfri2"><input type="radio" name="fri" id="allfri2" value="이순신(4234@test.com)">이순신(4234@test.com)</label>
			
		</form>
	</div>
</div>	
</body>
</html>