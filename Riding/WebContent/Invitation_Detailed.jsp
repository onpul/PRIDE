<!-- 4. 초대장 상세 내용 -->
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
<title>Invitation_Detailed.jsp</title>
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
		$("#yep").click(function() {

			alert("초대를 수락했습니다.");	
			window.open("Invite.action", "받은초대", "width=1000, height=400, left=400, top=50"); 
			window.close();
			})
		});
	$(function() {
		$("#nop").click(function() {

			alert("초대를 거절했습니다.");	
			window.close();
			})
		});

	
	
/*  수락시 꺼짐 / 거절시 꺼짐 / 단, 꺼질 때 다시 받은 초대장이 켜짐 

 
 
 
 
*/
</script>
</head>
<body onload="window.resizeTo(1000,800)"> 
<div class="alert2" >
<h1> 초대장 </h1>


</div>
<hr />

<div class="box1" >
초대장~ <br>
블라
</div>
<!-- onclick 을 넣어서 수락시 꺼짐 / 거절시 꺼짐 / 단, 꺼질 때 다시 받은 초대장으로 돌아가게끔 -->

<div class="clsBtn">

	<button type="button" id="yep" class="btn btn-default" >수락</button> 
	
	
	<button type="button" id="nop" class="btn btn-default" >거절</button>
</div>

</body>
</html>