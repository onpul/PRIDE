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
<title>Inquiry.jsp</title>
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

$(function() {
	$("#btnSubmit").click(function() {

		alert("등록했습니다.");	
		})
	});
</script>
</head>
<body onload="window.resizeTo(1000,800)">

<div class="alert2">
<h1> 문의하기 </h1>
</div>
<hr />

<div class="sel1">
제  목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  class="txtt"/><br /><br />
작성자&nbsp;&nbsp;&nbsp;<input type="text"  class="txtt"/><br /><br />
작성일&nbsp;&nbsp;&nbsp;<input type="text" class="txtt"/><br /><br />
내  용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="txtt3"/><br /><br />
</div>

<div class="clsBtn5">
	<button type="button" id="btnSubmit"class="btn btn-success"  > 등록 하기 </button>
	
	<button type="button" id="clsBtn"class="btn btn-danger" onclick="window.close()" >취소하기</button>		

</div>

</body>
</html>