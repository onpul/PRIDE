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
<title>편의시설 조회</title>


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
</head>
<body>

<div>

			
	<h2>편의시설</h2>
	<p>원하는 지역의 화장실 또는 음수대를 검색해보세요!(예.마포구 음수대)</p>
	<p>혹시 새로운 편의시설을 발견하셨다면 아래의 '등록요청' 버튼을 눌러보세요!</p>
	<p>정보를 추가해주시는 이용자분은 센스쟁이👏✨😍😎👏✨😍😎</p>
	<br /><br />
	
	<a href="RegisterFacility.jsp">등록요청</a>

	
	<a href="ModifyFacility.jsp">수정요청</a>
	

	<a href="DeleteFacility.jsp">삭제요청</a>
	

</div>





</body>
<jsp:include page="facMap.jsp"></jsp:include>








</html>