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
<title>MPD</title>
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

</script>
</head>
<body onload="window.resizeTo(1000,800)"> 
<div style="text-align:center;">
[ 지도 첨부 ]
</div>

<div class="box2">


작성자 : 홍길동<br>
작성 일자 : 2022년 05월 23일<br>
위치 : 서울시 xx구 xx로 xx로 rr공원 음수대<br>
사유: 음수대가 없어졌어요<br>
검토 후 삭제 부탁드려요.
</div>

<div class="clsBtn2">

	
	<input type="button" id="clsBtn"  class="btn btn-default" value="닫기" onclick="window.close();" />	
	
	
</div>
</body>
</html>