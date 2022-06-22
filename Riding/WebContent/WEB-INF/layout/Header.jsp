<!--
Header.jsp 
헤더페이지(모든 페이지에 적용할 헤더)
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:set var="user_id" value="${user_id}" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- datepicker 용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
	body {height: 100%;}
	img{width:20px;}
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		//var user_id = ${user_id};
		
		//location.href = "noticeCount.action?user_id="+user_id;
		//alert("확인");
		
		//alert(user_id);
		
		// 쪽지 수 가져오기
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"messageCount.action"
			, success:function(data)
			{
				//alert(data);
				$("#messageCount").html(data);
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
		
		// 알림 수 가져오기
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"noticeCount.action"
			, success:function(data)
			{
				$("#noticeCount").html(data);
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
		
		// 알림 가져오기
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"notice.action"
			, dataType:"JSON"
			, contentType:"application/json; charset:UTF-8"
			, success:function(data)
			{
				//alert("success 진입");
				//alert(data);
				
				//console.log(typeof data);
				//console.log(data[1].content);
				
				var str = "";
				
				//alert(data.length);
				
				for (var i = 0; i < data.length; i++)
				{
					str += "<li><a class=\"dropdown-item\" href=\"#\">";
					str += data[i].content + " 알림";
					str += "</a></li>";
					$("#noticeList").html(str);
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
		
	});
	
</script>
</head>
<body>
<span style="color:blue;">[테스트용 구문]로그인한 user_id : ${sessionScope.user_id}</span>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="main.action">PRIDE</a>
      <!--
      로고 이미지로 대체할 예정  
      <a class="navbar-brand" href="#">
       <img alt="logo" src="...">
      </a>
      -->
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
        	<li><a href="ridinglist.action">라이딩 모임 <span class="sr-only">(current)</span></a></li>
        	<li><a href="/Riding/ListReview.jsp">맛집 후기</a></li>
        	<li><a href="#">지도</a></li>
      	</ul>
		<ul class="nav navbar-nav navbar-right">
			<!-- 알림, 쪽지는 회원일 경우에만 적용 /  -->
			<c:choose>
			<c:when test="${sessionScope.user_id!=null }">  
	   		<li>
	   			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">알림<span class="badge" id="noticeCount"></span> <span class="caret"></span></a>
	   			<ul class="dropdown-menu" role="menu" id="noticeList">
			       	<!--  
			       	<li><a class="dropdown-item" href="#">패널티가 적용되었습니다.</a></li>
			        <li><a class="dropdown-item" href="#">[짱구]님이 초대하셨습니다.</a></li> 
			        -->
			    </ul>   
	   		</li>
	   		<li>
	   			<a href="letterlist.action">쪽지<span class="badge" id="messageCount"></span></a>
	   		</li>
	   		</c:when> 
	   		</c:choose>
	   		<li class="dropdown">
	     		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img src="https://bigxdata.io/common/img/default_profile.png" alt="" class="img-circle"/></a>
				<ul class="dropdown-menu" role="menu">
					<c:choose>
					<c:when test="${sessionScope.user_id!=null }">  
			        <li><a class="dropdown-item" href="mypagemain.action">마이페이지</a></li>
			        <li><a class="dropdown-item" href="logout.action">로그아웃</a></li>
			        </c:when>
			        
			        <c:when test="${sessionScope.user_id==null }">  
			        <li><a class="dropdown-item" href="loginform.action">로그인</a></li>
			        <li><a class="dropdown-item" href="joinform.action">회원가입</a></li> 
			        </c:when>
			        
			        <c:when test="${sessionScope.user_id==0 || sessionScope.user_id==1}">  
			        <li><a class="dropdown-item" href="#">관리</a></li>
			        </c:when>
			    	</c:choose>
				</ul>
        	</li>
		</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
</body>
</html>