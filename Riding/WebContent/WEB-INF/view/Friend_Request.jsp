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
<title>Friend_Request.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 프로필 친구 요청 -->
<script type="text/javascript">


$(function() {
	$("#frireq").click(function() {

		if(confirm("친구 신청 하시겠습니까?"))
		{	
			alert("신청했습니다.");	
		
			frireq.style.display="none";
			friending.style.display="inline";
			
		}
		else
		{
			alert("취소했습니다.");
		}
		})
	});


$(function() {
	$("#friending").click(function() {

		alert("친구 신청 중입니다.");
	})
		
});





</script>
</head>
<body>


<div>
	<h2>친구 요청</h2>
</div>
<div class="box3">
	<div>
		😺 달리는 야옹이 🚲🧢<br>
		
			야옹. 난 오늘도 달린다.
			함께 달리자.
		 <button type="button" id="frireq" class="btn btn-default">+ 친구요청</button> 
		 <button type="button"  id="friending" style = "display:none;" class="btn btn-info">친구요청중.. </button> 
		 <button type="button"  id="friend" style = "display:none;" class="btn btn-default">친구 </button> 
	</div>
</div>
</body>
</html>