<!-- 보낸 요청 -->
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
<title>Friend_Send.jsp</title>

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
	$("#rs").click(function() {

			window.open("Friend_S_R.jsp", "width=1000, height=400, left=400, top=50"); 
			
		})
	});

$(function() {
	$("#fr").click(function() {

			window.open("Friend.action", "width=1000, height=400, left=400, top=50"); 
			
		})
	});
	

$(function() {
	$("#del").click(function() {

		alert("친구 요청을 삭제했습니다.");	
		})
	});
		



</script>
</head>
<body onload="window.resizeTo(1000,800)"> 

<div id="a" class="box2">
	<div class="fl">
	
	<a href="#" class="btn btn-link" id="rs" >받은 요청</a> | <a href="#" style="font-weight: bold; color:blue;" class="btn btn-link" id="sd">보낸 요청</a>
	</div>
	<hr />
<input type="checkbox" id="a"/>  <br>
</div>

<div class="clsBtn3">
	<button type="button" id="fr"  class="btn btn-default"  >닫 기</button>
	<button type="button" id="del"  class="btn btn-default" >삭 제</button>
	

</div>




</body>
</html>