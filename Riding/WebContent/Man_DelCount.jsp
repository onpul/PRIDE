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
<title>Man_DelCount.jsp</title>
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
	

/* 삭제요청 */
$(function() {
	$("#clsBtn").click(function() {

			window.open("Manager.action", "width=1000, height=400, left=400, top=50"); 
		});
	});

$(function() {
	$("#modplzlook").click(function() {

			window.open("Man_plsDelFacility.jsp", "width=1000, height=400, left=400, top=50"); 
			
		});
	});
$(function() {
	$("#modplz").click(function() {

			window.open("Man_delwork.jsp", "width=1000, height=400, left=400, top=50"); 
			
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
		삭제 요청 <Br>
	</div>
	
	<div class="clsBtn2">

	
	<a href="Man_plsDelFacility.jsp" id="modplzlook" >·  삭제 요청 조회 [ 3 ]</a> <BR>
	<a href="Man_delwork.jsp" id="modplz" >·  삭제 요청 처리[ 1 ]</a>
	
	<input type="button" id="clsBtn" class="btn btn-default" value="닫기" />	
</div>
</body>
</html>