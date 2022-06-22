<!--
SearchIdForm.jsp 
아이디 찾기 폼
메인 페이지 > 상단 메뉴 > 로그인 > 아이디 찾기 폼
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
<title>SearchIdForm.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		//alert("확인");
		
		//생년월일 datepicker
		$("#birthday").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeMonth : true
			, changeYear : true
		});
		
		$("#searchBtn").click(function()
		{
			alert("확인");
			
			var params = $("form[name=searchIdForm]").serialize();
			// serialize() : 폼 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환 
			
			$.ajax(
			{
				type:"POST"
				, url:"searchid.action"
				, data:params
				, success:function(data)
				{
					if (data != null)
					{
						//alert("data = " + data);
						//alert("확인");
						$(".resultText").html("<span>회원가입 시 등록한 아이디는 " + data + " 입니다.</span>");
					}
					else if (data == null) 
					{
						$(".resultText").html("<span>회원정보를 찾을 수 없습니다.</span>");
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
	
	// 찾기 버튼 클릭 시 작성 여부 확인 후 서브밋 하는 함수
	function formCheck()
	{
		//alert("확인");
		var f = document.forms[0];
		
		if(!f.nickname.value)
		{
			alert("닉네임을 입력하세요.");
			return false;
		}
		if(!f.birthday.value)
		{
			alert("생년월일을 입력하세요.");
			return false;
		}
		
		//f.submit();
	}
	
</script>
<style type="text/css">
	.searchIdFormBox
	{
		width: 400px;
	}
	.goLoginBtn, .resultText, .searchBtn
	{
		text-align: center;
	}
</style>
</head>
<body>
<div>
	<c:import url="Header.jsp"></c:import>
</div> 
<div class="searchIdFormBox">
	<form class="searchIdForm" name="searchIdForm" id="searchIdForm">
		<div class="form-group form-inline">
			<label for="inputNickname">닉네임*</label>
	    	<input type="email" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
	    </div>
	    <div class="form-group form-inline">
	    	<label for="birthday">생년월일*</label>
	    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일을 입력하세요"/>
	    </div>
	    <div class="form-group searchBtn">
			<input type="button" class="btn btn-default" value="찾기" id="searchBtn"/>
		</div>
		<hr />
	    <div class="form-group resultText">
	    	<!-- 아이디 찾기 성공 시 노출 -->
	    	<!-- <p>회원가입 시 등록한 아이디는 chmj072@gmail.com 입니다.</p> -->
	    	<!-- 아이디 찾기 실패 시 노출 -->
	    	<!-- <p>회원정보를 찾을 수 없습니다.</p> -->
	    </div>
	    <div class="form-group goLoginBtn">
			<input type="button" class="btn btn-default" id="goLoginBtn" onclick="location.href='loginform.action'" value="로그인 화면으로 돌아가기"/>
		</div>
	</form>
<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</div>
</body>
</html>