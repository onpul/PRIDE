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
<title>Invitation_Create.jsp</title>
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

		if(confirm("전송 하시겠습니까?"))
		{	
			alert("전송 했습니다.");	
			
		}
		})
	});

$(function() {
	$("#nop").click(function() {

		window.open("Invite_FRIEND.action", "width=1000, height=400, left=400, top=50"); 
			
		})
	});	
	

</script>
</head>
<body onload="window.resizeTo(1000,800)"> 
<div class="alert2" >
<h1> 초대장 </h1>


</div>
<hr />



<div class="box1" >
초대장~ <br>
여기에 직접 초대장을 입력하는게아니라<br>
자동으로 모임에 대한 양식이 입력되는걸로 생각...db연결..<br>
</div>

<div class="clsBtn">


		


	<input type="button" id="yep"   class="clsBtn" value="전송" />

	<input type="button" id="nop"   class="clsBtn"value="취소"  />

</div>


</body>
</html>