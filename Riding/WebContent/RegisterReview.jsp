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
<title>맛집 후기 등록하기</title>


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


function regi()
{
   if(confirm("등록하시겠습니까?"))
   {
	   alert("등록되었습니다.")
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


<script type="text/javascript">

	//등록 버튼 클릭 시
	$(function()
	{
		$(".processBtn").on("click", function()
		{	
			//alert( document.getElementById('title').value ); // O
			//alert( document.getElementById('writer').value ); // O
			//alert( document.getElementById('wDate').value ); // O
			//alert( document.getElementById('myReview').value ); // O
			//alert( document.getElementById('pAddr').value ); // O
			//alert( document.getElementById('pName').value ); // O
			
			document.getElementById("title").value
			document.getElementById("writer").value
			document.getElementById("wDate").value
			document.getElementById("myReview").value
			document.getElementById("pAddr").value
			document.getElementById("pName").value
			
			$("#title").val(title);
			$("#writer").val(writer);
			$("#wDate").val(wDate);
			$("#myReview").val(myReview);
			$("#pAddr").val(pAddr);
			$("#pName").val(pName);
			
			$("#reviewForm").submit();
			
			ajaxInsert($(this).val());
			
			
			window.close();
			
			
		});
		
		//닫기, 취소 버튼 클릭 시
		$("#cancelBtn").on("click", function()
		{
			
			location.href = "ListReview.jsp";
		});
				

	});

	
	
	


</script>
















</head>
<body>


<div>

	<h3>😢작성하시기 전에!🤦‍♀️</h3>
	<p>맛집 후기는 해당 맛집이 이미 등록이 되어있을 경우에만 작성이 가능합니다.</p>
	<p>원하시는 맛집이 없다면 아래 버튼을 클릭하셔서 직접 맛집을 등록해보시면 어떨까요?</p>
	<a href="RegisterStore.jsp">맛집 등록하기</a>
	
	<h2>나의 맛집 후기 등록</h2>
	<form action="" id="reviewForm" method="post">
	<p>제목</p>
	<input type="text" class="txt" name="title" id="title"/>
	
	<p>작성자</p>
	<input type="text" class="txt" name="writer" id="writer"/>
	
	<p>작성일</p>
	<input type="text" class="txt" name="wDate" id="wDate"/>
	
	<p>가게 주소</p>
	<input type="text" class="txt" name="pAddr" id="pAddr"/>
	
	<p>가게명</p>
	<input type="text" class="txt" name="pName" id="pName"/>

	<br /><br />
	<textarea class="form-control" cols="30" rows="3" placeholder="나의 맛집 후기를 적어보아요✨✨" name="myReview" id="myReview"></textarea>
	
	<br /><br /><br />
	
	<jsp:include page="ModifyMap.jsp"></jsp:include>
	
	<br />
	

	

	
	<!-- <input type="button" value="등록하기" class="btn" onclick="regi()"/>
	<input type="button" value="목록으로" class="btn" onclick="go()"/> -->
	<input type="button" value="등록하기" class="btn btn-success processBtn"  onclick="regi()">
	<input type="button" value="취소하기" class="btn btn-cancle processBtn"/>
	<input type="button" value="목록으로" class="btn" onclick="go()"/>
	
	</form>
</div>


</body>
</html>

