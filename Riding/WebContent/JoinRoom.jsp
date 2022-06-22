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
<title>Join Room</title>


<style type="text/css">

div {
	border: 4px dotted #5f9ea0;
	/* width: 1000px;
	height: 1600px;
	background-color: AliceBlue; */
	padding: 100px;
	margin: 100px auto;

	
}

/* 
form{
    width: 900px;
	height: 920px;
}

*/
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
/* ul{
    list-style-type: none;
}
h3{
    text-align: center;
    color:#F59B7A;
    font-size: 29PX;
} */


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

	/* 누르면 내 프로필이 뜨도록 합니다  */
	function alertTest()
	{
		//alert("hi");
		
		window.open("MyProfile.jsp", "test", "width=500, height=300");
	}

	/* 누르면 상대(친구일경우) 프로필이 뜨도록 합니다  */
	function alertTest1()
	{
		//alert("hi");
		
		window.open("YourProfile.jsp", "test", "width=500, height=300");
	}
	
	/* 누르면 상대(친구가 아닐경우) 프로필이 뜨도록 합니다  */
	function alertTest2()
	{
		//alert("hi");
		
		window.open("OtherProfile.jsp", "test", "width=500, height=300");
	}
	
	function ready()
	{
		alert("회원님은 현재 준비 상태입니다♥");
	}

	
	function out() 
	{
		if(confirm("정말로 모임에서 나가겠습니까? 48시간이 남은 시점에서 나가시면 패널티가 있을 수 있습니다!"))
		{
			alert("모임에서 나가셨습니다😢");
		}
		else
		{
			alert("아직 모임에 있으세요😍");
		}
	}


</script>







</head>
<body>


<div>
<h2>👧🧑 대기실(참여자)👧🧑</h2>
        <hr>
			<form action ="" name="room" >  
				🎈 모임명 🎈<input type="text" id="room1" value ="즐겁게 달려요" class="txt"/>
					
					
				<br /><br />
				🧚‍ 방장 정보
				<input type="button" value="방장정보" class="btn" style="width:10%;" onclick="alertTest1()"/>
				
				<br /><br />
				
				<br />
				👩‍🦰 참여자1(나)
				<input type="button" value="내프로필" class="btn" style="width:10%;" onclick="alertTest()"/>
				<br />
				<button onclick="ready()">준비하기</button>
				<button onclick="out()">방나가기</button>
				
				<br /><br />
				👱‍♂️참여자2
				<input type="button" value="타프로필" class="btn" style="width:10%;" onclick="alertTest1()"/>
				
				<br />
				👨🏻‍🦳참여자3
				<input type="button" value="타프로필" class="btn" style="width:10%;" onclick="alertTest2()"/>
				
				<br />
				👩🏽‍🦱 참여자4
				<input type="button" value="타프로필" class="btn" style="width:10%;" onclick="alertTest2()"/>
					
					
					
					
				
						
					
					
					
			<br /><br />
			
		
			
			
		</form>
</div>






</body>
</html>