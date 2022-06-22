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
<title>맛집 지도 삭제</title>


<style type="text/css">

div {
	border: 2px dotted #5f9ea0;
	/* width: 1600px; */
	/* height: 1600px; */
	/* background-color: CornSilk; */
	padding: 100px;
	margin: 100px auto;

	
} 


input{ 	padding: 7px;
		margin: 15px auto; 
	
	}


input[type=submit], input[type=button],input[type=reset] {
	padding: 7px 15px;
	margin: 7px 10px;
	background: #6495ed; 
	color: white;
	border: none;
	cursor: pointer;
	width:35%;
}
input[type=submit]:hover{
	background:#ff7f50;
}
input[type=button]:hover{
	background:#8b008b;
}
input[type=reset]:hover{
	background:#dc143c;
}


a{
	text-decoration: none;
	color: CadetBlue;
}
hr{
	border: 1px dotted #5f9ea0;
}
a{
  color:w#5f9ea0;
}
a>mark{
	background-color: #5f9ea0;
	opacity: 50%;

}

</style>



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
	
	function cancel() 
	{
		//alert("hi");
		
		location.href = "StoreMap.jsp";
	}

	function reg()
	{
		alert("요청되었습니다~");
		location.href = "StoreMap.jsp";
	}
	
	
	
</script>








</head>
<body>


<div>

	<h3>맛집 삭제</h3>
	
	<p>삭제하시고자하는 맛집을 검색해주세요😊<p>

	<p><input type="text" id="writer" placeholder="작성자"/><input type="text" id="wDate" placeholder="작성날짜"/></p>
	
	
	<jsp:include page="ModifyMap.jsp"></jsp:include>
	
	<br /><br />
	<p>저희 웹사이트에 저장된 정보 중에 어느 점이 잘못되었나요? 아래에 적어주시면 빠른 시일내에 확인하겠습니다. 많은 관심 감사드립니다💖👍💖👍</p>
	<textarea class="form-control" cols="30" rows="3" placeholder="맛집명과 주소를 포함해서 적어주세요"></textarea>
	

	<br /><br />
	<input type="button" value="취소하기" class="btn" onclick="cancel()"/>
	<input type="button" value="요청하기" class="btn" onclick="reg()"/>

</div>




</body>
</html>