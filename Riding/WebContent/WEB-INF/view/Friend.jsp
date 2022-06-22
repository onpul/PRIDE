<!-- 친구목록 -->
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
<title>Friend</title>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">


<script type="text/javascript">
	

$(function() {
	$("#clsBtnreq").click(function() {

			window.open("Friend_S_R.jsp", "width=1000, height=400, left=400, top=50"); 
		})
	});


$(function(){
	$("#clsBtndel").click(function() {
			
		if(confirm("삭제하시겠습니까"))
				{
					alert("삭제하였습니다.");
				}

			
			})
			
			
		});

		
		

</script>
</head>


<body onload="window.resizeTo(1000,800)"> 

<div class="alert2">
<h1> 친구 목록 </h1>
</div>
<hr />
<!-- 
<div>
	<textarea class="frse" placeholder="친구 검색" ></textarea>
</div>
<button type="button" class="q" id="q">🔍</button>
 -->
<div class="box2">
	<div class="fl">
	친구 목록 [ 3 / 100 ]<Br><Br>
	</div>
<!-- <input type="checkbox" />🚲🧢 홍길동(Hobuhohyeong) <br> -->
<c:forEach var="friend_id" items="${list }">
						<tr>
							<td>${friend_id.receiver_id }<br />  </td>  
					
							
						</tr>
								
				</c:forEach>

</div>



<div class="clsBtn2">

	<button type="button" id="clsBtnreq" class="btn btn-default">친구 요청 목록</button>	
	
	<button type="button" id="clsBtndel" class="btn btn-default" >친구 삭제</button>		<!-- 친구삭제 알림  -->
</div>



</body>
</html>