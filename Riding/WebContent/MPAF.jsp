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
<title>MPDF</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 생성 요청 조회 -->
<script type="text/javascript">
$(function() {
	$("#yep").click(function() {

		alert("승인되었습니다.");
		window.open("Man_PlsAddFacility.jsp", "width=1000, height=400, left=400, top=50"); 	
		});
	});

$(function() {
	$("#nop").click(function() {

		alert("반려되었습니다.");
		window.open("Man_PlsAddFacility.jsp", "width=1000, height=400, left=400, top=50"); 
		});
	});
	
$(function() {
	$("#clsBtn").click(function() {

		window.open("Man_PlsAddFacility.jsp", "width=1000, height=400, left=400, top=50"); 
		});
	});

</script>
</head>
<body onload="window.resizeTo(1000,800)"> 
<div style="text-align:center;">


</div>

<div class="box2">

작성자 : 구라쟁이<br>
작성 일자 : 2022년 05월 23일<br>
위치 : 서울시 xx구 xx로 xx 공원<br>
이름: xx공원<br>
비고 : 목말라서 손으로 땅을 파서 우물을 만들었습니다.<br>
음수대로 쓸 수 있으니 등록해주세요.<br>
</div>
<div class="clsBtn2">

	<input type="button" id="yep" class="btn btn-default" value="승인" />	
	
	<input type="button" id="clsBtn" class="btn btn-default" value="닫기" />	
	
	<input type="button" id="nop" class="btn btn-default"value="반려" />	
</div>


</body>
</html>