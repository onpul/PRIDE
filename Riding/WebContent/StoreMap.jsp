<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<jsp:include page="headerMap.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>맛집 지도 검색</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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



<link rel="stylesheet"  type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>

	<!-- <input type="button" value="맛집후기리스트로 이동" class="btn"/> -->
	<!-- <a href="ListReview.jsp">맛집후기리스트로 이동     </a> -->
	
	<a href="RegisterStore.jsp">맛집등록하기     </a>

	<!-- <input type="button" value="수정요청" class="btn"/> -->
	<a href="ModifyStore.jsp">맛집수정요청       </a>
	
	<!-- <input type="button" value="삭제요청" class="btn"/> -->
	<a href="DeleteStore.jsp">맛집삭제요청        </a>
<jsp:include page="nolistMap.jsp"></jsp:include>
</div>


</body>

<!-- 
	<p>맛집 등록하기</p>
	<p>위에서 선택한 위치의 위도와 경도를 입력해주세요. 해당 위치로 맛집이 등록됩니다👏😉👏😉</p>
	<p><input type="text" id="latitude" placeholder="위도"/><input type="text" id="longitude" placeholder="경도"/></p>
	
	<input type="text" id="addr" class="control" placeholder="맛집명 입력"/>
	<input type="text" id="addr" class="control" placeholder="맛집 상세주소 입력"/>
	<input type="button" value="등록하기" class="control" onclick="search()">
    <br><br>
     -->
</html>