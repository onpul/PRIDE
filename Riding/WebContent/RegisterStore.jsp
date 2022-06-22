<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	//document.getElementById("writer").value;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 지도 등록</title>


<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<link rel="stylesheet"  type="text/css" href="<%=cp%>/css/main.css">


<script type="text/javascript">


function regi()
{
	alert("등록되었습니다.");
}




function go() 
{
	location.href = "StoreMap.jsp";
}



</script>



<script type="text/javascript">

	//등록 버튼 클릭 시
	$(function()
	{
		$(".processBtn").on("click", function()
		{	
			
			document.getElementById("writer").value
			document.getElementById("wDate").value
			document.getElementById("title").value
			document.getElementById("addr").value
			document.getElementById("subaddr").value
			document.getElementById("latitude").value
			document.getElementById("longitude").value
			
			$("#writer").val(writer);
			$("wDate").val(wDate);
			$("#title").val(title);
			$("#addr").val(addr);
			$("#subaddr").val(subaddr);
			$("#latitude").val(latitude);
			$("#longitude").val(longitude);
			
			$("#storeForm").submit();
			
			ajaxInsert($(this).val());
			
			window.close();
			
		});
		
		//닫기, 취소 버튼 클릭 시
		$("#cancelBtn").on("click", function()
		{
			window.close();
		});
				

	});

	

</script>




</head>
<body>


<div>

	<h3>맛집 등록</h3>
	
	<p>등록하시고자하는 맛집을 찾아주세요😊<p>
	<form action="/Riding/insertStore.jsp" id="storeForm" method="post">
	<p><input type="text" id="writer" name="writer" placeholder="작성자"/></p>
	
	
	<jsp:include page="KakaoApi1.jsp"></jsp:include>
	
	<br /><br />
	<p>많은 관심 감사드립니다💖👍💖👍</p>
	
	
	<input type="text" id="title" name="title" class="control" placeholder="맛집명 입력"/>
	<input type="text" id="addr" name="addr" class="control" placeholder="맛집 주소 입력"/>
	<input type="text" id="subaddr" name="subaddr" class="control" placeholder="맛집 상세주소 입력"/>
	
	<br />
	<input type="text" id="latitude" name="latitude" class="control" placeholder="맛집 위도 입력"/>
	<input type="text" id="longitude" name="longitude" class="control" placeholder="맛집 경도 입력"/>
	
	<span><button type="submit" onclick="regi()">등록하기</button></span>
	<span><button type="reset">취소하기</button></span>
	<span><button type="button" onclick="go()">홈으로</button></span>

	</form>
</div>




</body>
</html>