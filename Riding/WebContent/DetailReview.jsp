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
<title>맛집 후기 상세 내용 조회</title>


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





function sin()
{
   if(confirm("신고하시겠습니까?"))
   {
	   alert("신고되었습니다.")
	   location.href = "ListReview.jsp";
   }
   else
   {
      alert("취소되었습니다.");
   }
}

function go() 
{
	location.href = "ListReview.jsp";
}



</script>
</head>
<body>


<div>
	
	<h2>맛집 후기</h2>

	<p>제목</p>
	<input type="text" class="txt" id="title" name="title" placeholder="홍대순대국 꼭 가세요 👍👍">
	
	<p>작성자</p>
	<input type="text" class="txt" id="writer" name="writer" placeholder="순대러브❤"/>
	
	<p>작성일</p>
	<input type="text" class="txt" id="wDate" name="wDate" placeholder="2022-06-18"/>
	
	<p>조회수</p>
	<input type="text" class="txt" id="number" name="number" placeholder="5"/>

	<br /><br />
	<p>후기 내용</p>
	<textarea class="form-control" cols="30" rows="3" id="content" name="content" placeholder="속이 든든해유~"></textarea>
	
	<br /><br /><br />
	
	<jsp:include page="ModifyMap.jsp"></jsp:include>
	
	<br />
	
	<p>가게 주소</p>
	<input type="text" style="width:70%;" class="txt" id="addr" name="addr" placeholder="서울 마포구 월드컵북로2길 11"/>
	
	<p>가게명</p>
	<input type="text" style="width:70%;" class="txt" id="store" name="store" placeholder="홍대순대국"/>
	
	<br />
	
	
	
	
	<br /><br />
	
	<input type="button" value="목록으로" class="btn" onclick="go()"/>
	<input type="button" value="신고" class="btn" onclick="sin()"/>

   
</div>


</body>
</html>

