<!--
SearchPasswordForm.jsp 
비밀번호 찾기 폼
메인 페이지 > 상단 메뉴 > 로그인 > 비밀번호 찾기 폼
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
<title>SearchPasswordForm.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
	
	$(document).ready(function()
	{
		//alert("확인");
		
		$("#searchBtn").click(function()
		{
			//alert("확인");
			
			var params = $("form[name=searchPwdForm]").serialize();
			// serialize() : 폼 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환 
			
			$.ajax(
			{
				type:"POST"
				, url:"searchpassword.action"
				, data:params
				, success:function(data)
				{
					//alert("success 넘어옴");
					if (data != null)
					{
						//alert("여기");
						//alert(data);
						data = data.substr(0, 4);
						
						$(".resultText").html("<span>회원가입 시 등록한 비밀번호는 " + data + "**** 입니다.</span>");
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

	//이메일 직접 선택 시 인풋 박스 활성화하는 함수
	/*
	function email_change()
	{
		//alert("확인");
		
		if (document.searchPwdForm.selectEmail.options[document.searchPwdForm.selectEmail.selectedIndex].value=='0')
		{
			//alert("확인");
			
			document.searchPwdForm.email2.disabled = false;
			document.searchPwdForm.email2.value = "@";
			document.searchPwdForm.email2.focus();
		}
		else
		{
			document.searchPwdForm.email2.disabled = true;
			document.searchPwdForm.email2.value = document.searchPwdForm.selectEmail.options[document.searchPwdForm.selectEmail.selectedIndex].value;
		}
	}
	*/

	//생년월일 datepicker
	$(document).ready(function()
	{
		//alert("확인");
		
		$("#birthday").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeMonth : true
			, changeYear : true
		});
	});

	// 찾기 버튼 클릭 시 작성 여부 확인 후 서브밋 하는 함수
	function formCheck()
	{
		//alert("확인");

		var f = document.forms[0];

		if(!f.email.value)
		{
			alert("이메일을 입력하세요.");
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
		width: 600px;
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
	<form action="" class="searchPwdForm" name="searchPwdForm" id="searchPwdForm">
		<div class="form-group form-inline">
			<label for="email">이메일*</label>
	    	<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요">
	    </div>
	    <div class="form-group form-inline">
	    	<label for="birthday">생년월일*</label>
	    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일을 입력하세요"/>
	    </div>
	    <div class="form- group searchBtn">
			<input type="button" class="btn btn-default" value="찾기" id="searchBtn"/>
		</div>
		<hr />
	    <div class="form-group resultText">
	    	<!-- 비밀번호 찾기 성공 시 노출 -->
	    	<!-- <p>회원가입 시 등록한 비밀번호는 java**** 입니다.</p> -->
	    	<!-- 비밀번호 찾기 실패 시 노출 -->
			<!-- <p>회원정보를 찾을 수 없습니다.</p> -->
	    </div>
	    <div class="form-group goLoginBtn">
			<input type="button" class="btn btn-default" onclick="location.href='loginform.action'" value="로그인 화면으로 돌아가기"/>
		</div>
	</form>
</div>
<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</body>
</html>