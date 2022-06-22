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
<title>맛집 지도 검색</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>





<link rel="stylesheet"  type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>

	<h3>맛집 조회</h3>
	
	<p>주소 검색 결과</p>
	<input type="text" id="addr" class="control" placeholder="주소 입력"/>
	<input type="button" value="검색하기" class="control" onclick="search()">
    <br><br />

	
	<p>지도가 표시되는 부분입니다</p>
	
	<p>선택한 맛집 정보가 나오는 부분입니다</p>
	
	
	
	
	
	
	<p>이름</p>
	<input type="text" class="txt"/>
	<p>상세주소</p>
	<input type="text" class="txt" />
	
	
	
	<br /><br />
	<!-- <input type="button" value="맛집후기리스트로 이동" class="btn"/> -->
	<a href="ListReview.jsp">맛집후기리스트로 이동</a>
	
	<!-- <input type="button" value="등록하기" class="btn"/> -->
	<a href="RegisterStore.jsp">등록하기</a>

	<!-- <input type="button" value="수정요청" class="btn"/> -->
	<a href="ModifyStore.jsp">수정요청</a>
	
	<!-- <input type="button" value="삭제요청" class="btn"/> -->
	<a href="DeleteStore.jsp">삭제요청</a>

</div>




</body>
</html>