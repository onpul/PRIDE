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
<title>Man_plsDelFacility.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	

/* 삭제 요청 조회 */
$(function() {
$("#look").click(function() {

		window.open("MPD.jsp", "width=1000, height=400, left=400, top=50"); 
	});
});

$(function() {
$("#clsBtn").click(function() {

		window.open("Man_DelCount.jsp", "width=1000, height=400, left=400, top=50"); 
		
	});
});

</script>
</head>
<body onload="window.resizeTo(1000,800)"> 

<div class="alert2" >
<h1> 관리자 </h1>
</div>
<hr />
	<div class="fl1">
		삭제 요청 조회 <Br>
	</div>
	
	<div class="box2">
		<input type="checkbox" />[ 물먹는 하마 ] 회원의 [ xx공원 음수대 ] 삭제 요청 <br>
	
		<input type="checkbox" />[ 곱창 요정 ] 회원의 [ oo곱창 ] 삭제 요청 <br>

		<input type="checkbox" />[ 홍길동 ] 회원의 [ tt공원 음수대 ] 삭제 요청 <br>
	</div>
	
	<div class="clsBtn2">

	<input type="button" id="look" class="btn btn-default" value="조회" />	
	
	<input type="button" id="clsBtn" class="btn btn-default" value="닫기"/>			
</div>
</body>
</html>
