<!--
LoginForm.jsp 
로그인 폼
메인페이지 > 상단메뉴 > 로그인
모임 페이지 > 상세보기 > 로그인
로그인 완료 후 메인페이지로 이동 처리
-->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	// 비밀번호 최소 글자수 확인 함수
	function minLengthCheck(object)
	{
		if (object.value.length < 8)
		{
			document.getElementById("pwdSpan").style.color = "red";
		}
		else
			document.getElementById("pwdSpan").style.color = "black";
	}
	
	// 로그인 버튼 클릭 시 작성 여부 확인 후 서브밋 하는 함수
	function formCheck()
	{
		//alert("확인");
		document.getElementById("pwdSpan").style.color = "black";
		
		var f = document.forms[0];
		
		if(!f.email.value)
		{
			alert("아이디를 입력하세요.");
			return false;
		}	
		
		if(!f.password.value)
		{
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(f.password.value.length < 8)
		{
			document.getElementById("pwdSpan").style.display = "inline";
			document.getElementById("pwdSpan").style.color = "red";
			
			return false;
		}
		
		//f.submit();
		//loginCheck();
	}
	
	// 로그인 액션(ajax)
	$(function()
	{
		$("#loginBtn").click(function()
		{
			//alert("확인");
			
			var params = $("form[name=loginForm]").serialize();
			
			//alert(params);
			
			$.ajax(
			{
				type:"POST"
				, asynx:true
				, url:"login.action"
				, data:params
				, success:function(data)
				{
					//alert("success 진입 성공");
					
					if (data == 0)
					{
						location.href = "main.action"
					}
					else if (data == 1) 
					{
						alert("회원정보를 찾을 수 없습니다.");
					}
					else if (data == 2)
					{
						alert("사이트 이용제한 패널티로 인해 로그인 할 수 없습니다.");
						location.href = "main.action";
					}
				}
				, beforeSend:formCheck
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
</script>
<style type="text/css">
	.loginFormBox
	{
		width: 400px;
	}
	.loginBtn, .link-text
	{
		text-align: center;
	}
</style>
</head>
<body>
<div>
	<c:import url="Header.jsp"></c:import>
</div>
<div class="loginFormBox">
	<form id="loginForm" name="loginForm" method="post" action=submit>
		<div class="form-group form-inline">
			<label for="inputEmail">아이디</label>
	    	<input type="email" class="form-control" id="email" name="email" placeholder="@pride.com">
	    	<br /><span>이메일 형식으로 입력하세요.</span>
	    </div>
		<div class="form-group form-inline">
	    	<label for="inputPassword">비밀번호</label>
	    	<input type="password" class="form-control" maxlength="20" id="password" name="password" oninput="minLengthCheck(this)" placeholder="비밀번호를 입력하세요"/>
	    	<br /><span id="pwdSpan">8~20자 이내의 비밀번호를 입력하세요.</span>
	    </div>
		<div class="form-group loginBtn">
			<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
		</div>
		<div class="form-group link-text">
			<a href="searchpasswordform.action">비밀번호 찾기 | </a><a href="searchidform.action">아이디 찾기 | </a><a href="joinform.action">회원가입</a>
		</div>
	</form>
<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</div>	
</body>
</html>