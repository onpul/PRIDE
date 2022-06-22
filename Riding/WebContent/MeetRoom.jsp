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
<title>Meet Room</title>


<style type="text/css">

div {
	border: 4px dotted #5f9ea0;
	padding: 100px;
	margin: 100px auto;
}


.outer {
  text-align: center;
}

.inner {
  display: inline-block;
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

	/* 누르면 내 프로필이 뜨도록 합니다  */
	function alertTest()
	{
		//alert("hi");
		
		window.open("MyProfile.jsp", "test", "width=500, height=300");
	}

	/* 누르면 상대 프로필이 뜨도록 합니다 */
	function alertTest1()
	{
		//alert("hi");
		
		window.open("YourProfile.jsp", "test", "width=500, height=300");
	}

	/* 누르면 확정이 됩니다  */
	function check()
	{
		alert("모임이 확정되었습니다! 즐거운 라이딩 되시길 바라요♥")
	}

	
	function req() 
	{
		if(confirm("정말로 모임을 삭제하시겠습니까?"))
		{
			alert("모임이 삭제되었습니다😢");
		}
		else
		{
			alert("모임이 유지되었습니다😍");
		}
	}
	
	function cancel()
	{
		if(confirm("정말로 확정을 취소하시겠습니까? 취소는 한 번밖에 되지 않습니다!"))
		{
			alert("확정이 취소되었습니다😢");
		}
		else
		{
			alert("확정이 유지되었습니다😍");
		}
	}
	
	function modify() 
	{
		
		location.href = "ModifyMeet.jsp";
	}

	

	
	
	
</script>







</head>
<body>


<div>
<h2>🤴대기실(방장)👸</h2>
        <hr>
			<form action ="" name="room" >
				<p>🧚‍ 내 정보</p>
				<input type="button" value="내프로필" class="btn" style="width:10%;" onclick="alertTest()"/>
				
				<p>🧚‍♂️ 방장 권한</p>
					<input type="button" value="확정" class="btn" style="width:10%;" onclick="check()"/>
					<input type="button" value="삭제" class="btn" style="width:10%;" onclick="req()"/>
					<input type="button" value="확정취소" class="btn" style="width:10%;" onclick="cancel()"/>
					<input type="button" value="수정" class="btn" style="width:10%;" onclick="modify()"/>
				
				<br /><br />
				🎈 모임명 🎈<input type="text" id="room1" value ="즐겁게 달려요" class="txt"/>
				<br /><br />
				
				
				🎉현재 인원수 <input type="text" class="txt" style="width:3%;" placeholder="5"/>
				🎊제한 인원수  <input type="text" class="txt" style="width:3%;" placeholder="8"/>
				
				
				
				<br /><br /><br />
				
				
				👩‍🦰 참여자1<input type="button" value="타프로필"  style="width:10%;" class="btn" onclick="alertTest1()"/>
				
				
				
				<br /><br />
				👱‍♂️참여자2<input type="button" value="타프로필" style="width:10%;" class="btn" onclick="alertTest1()"/>
				
				
				
				<br /><br />
				👨🏻‍🦳참여자3<input type="button" value="타프로필" style="width:10%;" class="btn" onclick="alertTest1()"/>



				<br /><br />
				👩🏽‍🦱 참여자4<input type="button" value="타프로필" style="width:10%;" class="btn" onclick="alertTest1()"/>
					
					
				
						
					
					
					
			<br /><br />
			
		
			
			
		</form>
</div>






</body>
</html>