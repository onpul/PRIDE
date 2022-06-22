<!-- 받은 요청 -->

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
<title>Friend_S_R.jsp</title>
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
	$("#sd").click(function() {

			window.open("Friend_Send.jsp", "width=1000, height=400, left=400, top=50"); 
			
		})
	});

$(function() {
	$("#fr").click(function() {

			window.open("Friend.action", "width=1000, height=400, left=400, top=50"); 
			
		})
	});
	
$(function() {
	$("#ok").click(function() {

		alert("친구 요청을 수락했습니다.");	
		})
	});

$(function() {
	$("#no").click(function() {

		alert("친구 요청을 거절했습니다.");	
		})
	});


</script>
</head>
<body onload="window.resizeTo(1000,800)"> 

<div id="a" class="box2">
	<div class="fl">
	
	<a href="#"style="font-weight: bold; color:blue;" id="rs"  class="btn btn-link">받은 요청</a> | <a href="#" id="sd" class="btn btn-link">보낸 요청</a>
	</div>
	<hr />
<input type="checkbox" id="a"/>  <br>
</div>


<div class="clsBtn3">
	<input type="button" id="ok"  class="btn btn-default" value="수 락"  />
	<input type="button" id="fr"  class="btn btn-default" value="닫 기"  />
	<input type="button" id="no"  class="btn btn-default" value="거 절"  />
</div>




</body>
</html>