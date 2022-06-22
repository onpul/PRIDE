<!-- 5. 초대 상세 내용 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inv_FriSend.jsp</title>



<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">


$(function() {
	$("#clsBtnpop").click(function() {

			window.open("Invite.action", "width=1000, height=400, left=400, top=50"); 
		});
	});





	

</script>
</head>
<body>

<body onload="window.resizeTo(1000,800)"> 

<div class="alert2">
<h1> 모임 초대 생성 폼 </h1>
</div>
<hr />
<!-- 
<div>
	<textarea class="frse" placeholder="친구 검색" ></textarea>
</div>
<button type="button" class="q" >🔍</button>
 -->
<div class="box2">
	<div class="fl">
	친구 목록 [  / 100 ]<Br><Br>
	</div>

<!-- db연결  -->
</div>

<div class="alrdel1">
	※친구 한 명당 1일 3회까지 초대할 수 있습니다.
</div>

<div class="clsBtn2">

	<button type="button" id="clsBtnpop" >초대</button>	
	
	<button type="button" id="clsBtn"  onclick="window.close();" >취소</button>	<!-- 임시로 꺼짐. 취소 누르면 모임대기실로 -->
</div>



</body>
</html>