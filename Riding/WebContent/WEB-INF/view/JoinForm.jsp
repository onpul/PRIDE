<!--
JoinForm.jsp 
회원가입 폼
메인페이지 > 상단 메뉴 > 회원가입

회원가입 완료 후 메인화면으로 이동 처리

------------------------------------------------------------------------------------------------

●todo●
- 비속어 필터링 추가(완료)
- 회원가입 시 입력한 생년월일, 성별에 따라 라이딩 스타일의 연령대, 성별 옵션이 노출되도록(완료)
- 닉네임 중복 체크(완료)
- 탈퇴회원은 3개월 이후에 가입할 수 있도록 탈퇴회원 판별하여 경고창(완료, 3개월인진 아직 판별 불가능)
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
<title>JoinForm.jsp</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">	
	
	// 닉네임 특수문자 제외, 12자 이내 입력하도록
	function maxLengthCheck(object)
	{
		// 특수문자 정규식
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		
		// 비속어 배열
		var words = ['10새','10새기','10새리','10세리','10쉐이','10쉑','10스','10쌔',
			'10쌔기','10쎄','10알','10창','10탱','18것','18넘','18년','18노','18놈',
			'18뇬','18럼','18롬','18새','18새끼','18색','18세끼','18세리','18섹','18쉑','18스','18아',
			'c파','c팔','fuck',
			'ㄱㅐ','ㄲㅏ','ㄲㅑ','ㄲㅣ','ㅅㅂㄹㅁ','ㅅㅐ','ㅆㅂㄹㅁ','ㅆㅍ','ㅆㅣ','ㅆ앙','ㅍㅏ','凸',
			'갈보','갈보년','강아지','같은년','같은뇬','개같은','개구라','개년','개놈',
			'개뇬','개대중','개독','개돼중','개랄','개보지','개뻥','개뿔','개새','개새기','개새끼',
			'개새키','개색기','개색끼','개색키','개색히','개섀끼','개세','개세끼','개세이','개소리','개쑈',
			'개쇳기','개수작','개쉐','개쉐리','개쉐이','개쉑','개쉽','개스끼','개시키','개십새기',
			'개십새끼','개쐑','개씹','개아들','개자슥','개자지','개접','개좆','개좌식','개허접','걔새',
			'걔수작','걔시끼','걔시키','걔썌','걸레','게색기','게색끼','광뇬','구녕','구라','구멍',
			'그년','그새끼','냄비','놈현','뇬','눈깔','뉘미럴','니귀미','니기미','니미','니미랄','니미럴',
			'니미씹','니아배','니아베','니아비','니어매','니어메','니어미','닝기리','닝기미','대가리',
			'뎡신','도라이','돈놈','돌아이','돌은놈','되질래','뒈져','뒈져라','뒈진','뒈진다','뒈질',
			'뒤질래','등신','디져라','디진다','디질래','딩시','따식','때놈','또라이','똘아이','똘아이',
			'뙈놈','뙤놈','뙨넘','뙨놈','뚜쟁','띠바','띠발','띠불','띠팔','메친넘','메친놈','미췬',
			'미췬','미친','미친넘','미친년','미친놈','미친새끼','미친스까이','미틴','미틴넘','미틴년',
			'미틴놈','바랄년','병자','뱅마','뱅신','벼엉신','병쉰','병신','부랄','부럴','불알','불할','붕가',
			'붙어먹','뷰웅','븅','븅신','빌어먹','빙시','빙신','빠가','빠구리','빠굴','빠큐','뻐큐',
			'뻑큐','뽁큐','상넘이','상놈을','상놈의','상놈이','새갸','새꺄','새끼','새새끼','새키',
			'색끼','생쑈','세갸','세꺄','세끼','섹스','쇼하네','쉐','쉐기','쉐끼','쉐리','쉐에기',
			'쉐키','쉑','쉣','쉨','쉬발','쉬밸','쉬벌','쉬뻘','쉬펄','쉽알','스패킹','스팽','시궁창','시끼',
			'시댕','시뎅','시랄','시발','시벌','시부랄','시부럴','시부리','시불','시브랄','시팍',
			'시팔','시펄','신발끈','심발끈','심탱','십8','십라','십새','십새끼','십세','십쉐','십쉐이','십스키',
			'십쌔','십창','십탱','싶알','싸가지','싹아지','쌉년','쌍넘','쌍년','쌍놈','쌍뇬','쌔끼',
			'쌕','쌩쑈','쌴년','썅','썅년','썅놈','썡쇼','써벌','썩을년','썩을놈','쎄꺄','쎄엑',
			'쒸벌','쒸뻘','쒸팔','쒸펄','쓰바','쓰박','쓰발','쓰벌','쓰팔','씁새','씁얼','씌파','씨8',
			'씨끼','씨댕','씨뎅','씨바','씨바랄','씨박','씨발','씨방','씨방새','씨방세','씨밸','씨뱅',
			'씨벌','씨벨','씨봉','씨봉알','씨부랄','씨부럴','씨부렁','씨부리','씨불','씨붕','씨브랄',
			'씨빠','씨빨','씨뽀랄','씨앙','씨파','씨팍','씨팔','씨펄','씸년','씸뇬','씸새끼','씹같','씹년',
			'씹뇬','씹보지','씹새','씹새기','씹새끼','씹새리','씹세','씹쉐','씹스키','씹쌔','씹이','씹자지',
			'씹질','씹창','씹탱','씹퇭','씹팔','씹할','씹헐','아가리','아갈','아갈이','아갈통',
			'아구창','아구통','아굴','얌마','양넘','양년','양놈','엄창','엠병','여물통','염병','엿같','옘병',
			'옘빙','오입','왜년','왜놈','욤병','육갑','은년','을년','이년','이새끼','이새키','이스끼',
			'이스키','임마','자슥','잡것','잡넘','잡년','잡놈','저년','저새끼','접년','젖밥','조까',
			'조까치','조낸','조또','조랭','조빠','조쟁이','조지냐','조진다','조찐','조질래','존나','존나게','존니','존만',
			'존만한','좀물','좁년','좁밥','좃까','좃또','좃만','좃밥','좃이','좃찐','좆같','좆까','좆나',
			'좆또','좆만','좆밥','좆이','좆찐','좇같','좇이','좌식','주글','주글래','주데이','주뎅',
			'주뎅이','주둥아리','주둥이','주접','주접떨','죽고잡','죽을래','죽통','쥐랄','쥐롤',
			'쥬디','지랄','지럴','지롤','지미랄','짜식','짜아식','쪼다','쫍빱','찌랄','창녀','캐년',
			'캐놈','캐스끼','캐스키','캐시키','탱구','팔럼','퍽큐','호로','호로놈','호로새끼',
			'호로색','호로쉑','호로스까이','호로스키','후라들','후래자식','후레','후뢰'];
		
		// 12자 이내
		if (object.value.length == object.maxLength)
		{
			//alert(document.getElementById("nickSpan"));
			document.getElementById("nickSpan").style.color = "red";
			
			return false;
		}
		// 특수문자 입력 필터링
		else if (regExp.test(object.value))
		{
			document.getElementById("nickSpan").style.color = "red";
			object.value = object.value.substring(0, object.length-1);
			
			return false;
		}
		else
			document.getElementById("nickSpan").style.color = "black";
		
		// 비속어 입력 필터링
		for (var i = 0; i < words.length; i++)
		{
			if (object.value.includes(words[i]))
			{
				alert("비속어는 입력할 수 없습니다.");
				object.value = object.value.substring(0, object.length-(words[i].length));
				
				return false;
			}
		}
	}
	
	// 닉네임 중복 검사 여부
	function inputNickChk()
	{
		//alert("확인");
		// 닉네임 칸에 새로 입력할 때마다 중복확인 여부를 uncheck로
		document.joinForm.duplication.value = "nickUncheck";
	}
	
	// 닉네임 중복 체크
	$(function()
	{
		$("#duplicationBtn").click(function()
		{
			$.ajax(
			{
				type:"POST"
				, url:"nickcheck.action"
				, dataType:"JSON"
				, data:{"nickname" : $("#nickname").val()}
				, success:function(data)
				{
					//alert("data = " + data);
					if (data == 0)
					{
						alert("사용가능한 닉네임입니다.");
						document.joinForm.duplication.value = "nickCheck";
						//alert(document.joinForm.duplication.value);
					}
					else if (data == 1) 
					{
						alert("이미 사용 중인 닉네임입니다.");
						$("#nickname").val("");
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
			
		});
	});
		
	// 이메일 직접 선택 시 인풋 박스 활성화하는 함수
	/*
	function email_change()
	{
		//alert("확인");
		
		if (document.joinForm.selectEmail.options[document.joinForm.selectEmail.selectedIndex].value=='0')
		{
			//alert("확인");
			
			document.joinForm.email2.disabled = false;
			document.joinForm.email2.value = "@";
			document.joinForm.email2.focus();
		}
		else
		{
			document.joinForm.email2.disabled = true;
			document.joinForm.email2.value = document.joinForm.selectEmail.options[document.joinForm.selectEmail.selectedIndex].value;
		}
	}
	*/
	
	// 생년월일 datepicker
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
	
	// 비밀번호 최소 글자수 검사 함수
	function minLengthCheck(object)
	{
		if (object.value.length < 8)
		{
			document.getElementById("pwdSpan").style.color = "red";
		}
		else
			document.getElementById("pwdSpan").style.color = "black";
	}
	
	// 선택한 성별에 따라 라이딩 스타일의 성별 라디오 박스 노출
	function genderOption(value)
	{
		//alert(value);
		
		// 선택한 성별 value
		var sex = value;
		//alert(gender);
		
		// 선택한 성별에 따라 라디오 박스 동적으로 노출
		var content = "";
		
		if (sex == "m")
		{
			//alert("male");
			content = "<input type=\"radio\" name=\"sex_p_id\" id=\"sex_p_id\" value=\"1\"/>남성";
		}
		else if (sex == "f") 
		{
			//alert("female");
			content = "<input type=\"radio\" name=\"sex_p_id\" id=\"sex_p_id\" value=\"2\"/>여성";
		}
		
		document.getElementById("genderOption").innerHTML = content;
	}
	
	// 선택한 생년월일에 따라 라이딩 스타일의 연령대 라디오 박스 노출
	function ageOption()
	{
		//alert("확인");
		
		var birthday = document.getElementById("birthday").value;
		//alert(birthday);
		
		// 년도만 자르기
		var birthYear = birthday.substring(0, 4);
		
		// 현재 년도 구하기
		var nowYear = new Date().getFullYear();
		
		// 연령대 구하기
		// 2022-1999 = 23+1 = 24
		var age = nowYear - birthYear + 1;
		var ageGroup = Math.floor(age/10) + "0";
		// age.substring 은 왜 안 될까?
		//alert(ageGroup);
		
		var content = "";
		
		if (ageGroup == 10)
		{
			//alert("10");
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"1\"/>10대"
		}
		else if (ageGroup == 20) 
		{
			//alert("20");
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"2\"/>20대"
		}
		else if (ageGroup == 30)
		{
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"3\"/>30대"
		}
		else if (ageGroup == 40)
		{
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"4\"/>40대"
		}
		else if (ageGroup == 50)
		{
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"5\"/>50대"
		}
		else if (ageGroup >= 60)
		{
			content = "<input type=\"radio\" name=\"age_p_id\" id=\"age_p_id\" value=\"6\"/>60대 이상"
		}
		
		//alert(content);
		
		//alert(document.getElementById("ageOption").innerHTML);
		document.getElementById("ageOption").innerHTML = content;
	} 
	
	
	// 회원가입 버튼 클릭 시 작성 여부 확인 후 서브밋 하는 함수
	function formCheck()
	{
		//alert("확인");

		document.getElementById("pwdSpan").style.color = "black";
		
		var f = document.forms[0];
		
		if(!f.nickname.value)
		{
			alert("닉네임을 입력하세요.");
			return false;
		}

		if(!f.email.value)
		{
			alert("이메일을 입력하세요.");
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
		
		if(!f.birthday.value)
		{
			alert("생년월일을 입력하세요.");
			return false;
		}
		
		//alert(f.gender.value);
		if(f.sex.value == "선택")
		{
			alert("성별을 선택하세요.");
			return false;
		}
		
		if(f.duplication.value != "nickCheck")
		{
			alert("아이디 중복체크를 해 주세요.");
			return false;
		}
		
		f.submit();
	}
	
	// 회원가입 제이쿼리 에이젝스 처리
	$(function()
	{
		$("#joinBtn").click(function()
		{
			//alert("확인");
			
			// 보낼 데이터 구성
			var params = $("form[name=joinForm]").serialize();
			// serialize() : 폼 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환 
			
			$.ajax(
			{
				type:"POST"
				, url:"join.action"
				, data:params
				, success:function(data)
				{
					//alert("성공");
					//alert(data);
					if (data == 0)
					{
						alert("회원가입이 정상적으로 처리되었습니다.");
						location.href = "loginform.action";
					}
					else if (data == 1) 
					{
						alert("탈퇴일로부터 3개월 이후에 회원가입이 가능합니다.");
						location.href = "main.action";
					}
				}
				//, beforeSend:formCheck
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		
		});
	});
</script>
<style type="text/css">
	span
	{
		font-size: small;
	}
	.joinFormBox
	{
		width: 700px;
	}
	.joinBtn
	{
		text-align: center;
	}
</style>
</head>
<body>
<div>
	<c:import url="Header.jsp"></c:import>
</div>
<div class="joinFormBox">
	<form class="joinForm" name="joinForm">
		<div class="form-group form-inline">
			<label for="nickname">닉네임*</label>
	    	<input type="text" class="form-control" name="nickname" id="nickname" maxlength="12" placeholder="닉네임을 입력하세요" oninput="maxLengthCheck(this)" onkeydown="inputNickChk()">
	    	<input type="button" class="btn btn-default" value="중복 확인" id="duplicationBtn"/>
	    	<input type="hidden" name="duplication" id="duplication" value="nickUncheck"/><!-- 중복체크 여부 확인용 -->
	    	<br /><span id="nickSpan" style="">특수문자 제외 12자 이내의 닉네임을 입력하세요.</span>
	    </div>
		<div class="form-group form-inline">
			<label for="email">이메일*</label>
			<!-- 
	    	<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요" onfocus="this.value=';'">
			<input type="text" class="form-control" name="email2" id="email2" style="width:120px;" disabled value="@naver.com">
			<select name="selectEmail" id="selectEmail" class="form-control" onchange="email_change()">
				<option value="0">직접입력</option>			
				<option value="@naver.com" selected>@naver.com</option>
				<option value="@hanmail.net">@hanmail.net</option>
				<option value="@nate.com">@nate.com</option>
				<option value="@yahoo.co.kr">@yahoo.co.kr</option>
				<option value="@gmail.com">@gmail.com</option>
			</select>    
			-->
			<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요">
			
			<br /><span>등록하신 이메일은 로그인 시 아이디로 사용됩니다.</span>
	    </div>
	    <div class="form-group form-inline">
	    	<label for="inputPassword">비밀번호*</label>
	    	<input type="password" class="form-control" name="password" id="password" maxlength="20" placeholder="비밀번호를 입력하세요" oninput="minLengthCheck(this)"/>
	    	<br /><span id="pwdSpan">8~20자 이내의 비밀번호를 입력하세요.</span>
	    </div>
	    <div class="form-group form-inline">
	    	<!-- 해당 년도 기준 +-10 선택할 수 있도록 구현해야 함 -->
	    	<label for="birthday">생년월일*</label>
	    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일을 입력하세요" onchange="ageOption()"/>
	    </div>
		<div class="form-group form-inline">
			<label for="sex">성별*</label>
			<select name="sex" id="sex" class="form-control" onchange="genderOption(this.value)">
				<option>선택</option>
				<option value="m">남성</option>
				<option value="f">여성</option>
			</select>
		</div>
		<hr />
		<div class="form-group">
			<h3>라이딩 스타일 <small>마이페이지에서 수정할 수 있습니다.</small></h3>
			<label for="sex_preference" class="">성별</label>
			<!-- 본인과 동일한 성별의 옵션만 노출되게 구현해야 함 -->
			<label class="radio-inline">
				<input type="radio" name="sex_p_id" id="sex_p_id" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<div id="genderOption"></div>
			</label>
		</div>
		<div class="form-group">
			<label for="age">연령대</label>
			<!-- 본인과 동일한 연령대의 옵션만 노출되게 구현해야 함 -->
			<label class="radio-inline">
				<input type="radio" name="age_p_id" id="age_p_id" value="0" checked="checked"> 제한 없음
			</label>
			<!-- 선택한 생년월일에 따라 동적으로 연령대 옵션 노출 -->
			<label class="radio-inline">
				<div id="ageOption"></div>
			</label>
		</div>
		<!-- 
		<div class="form-group">
			<label for="speed">속도</label>
			<label class="radio-inline">
				<input type="radio" name="speed" id="speed" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed" id="speed" value="1"/>20미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed" id="speed" value="2"/>20이상 24미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="speed" id="speed" value="3"/>24이상
			</label>
		</div>
		<div class="form-group">
			<label for="step">숙련도</label>
			<label class="radio-inline">
				<input type="radio" name="step" id="step" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="step" id="step" value="1" />1년 미만
			</label>
			<label class="radio-inline">
				<input type="radio" name="step" id="step" value="2" />1~3년
			</label>
			<label class="radio-inline">
				<input type="radio" name="step" id="step" value="3" />3~5년
			</label>
			<label class="radio-inline">
				<input type="radio" name="step" id="step" value="4" />6년 이상
			</label>
			숙련도 관련 정보 제공 아이콘 추가해야 함
		</div>
		-->
		<div class="form-group">
			<label for="eat">식사 여부</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat" value="1"/>밥 안 먹고 달려요
			</label>
			<label class="radio-inline">
				<input type="radio" name="eat_p_id" id="eat" value="2"/>밥 먹고 달려요
			</label>
		</div>
		<div class="form-group">
			<label for="dining">회식 여부</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining" value="1"/>끝나고 회식 안 해요
			</label>
			<label class="radio-inline">
				<input type="radio" name="dining_p_id" id="dining" value="2"/>끝나고 회식해요
			</label>
		</div>
		<div class="form-group">
			<label for="mood">분위기</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood" value="0" checked="checked"> 제한 없음
			</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood" value="1"/>침묵이 좋아요
			</label>
			<label class="radio-inline">
				<input type="radio" name="mood_p_id" id="mood" value="2"/>친목이 좋아요
			</label>
		</div>
		<div class="form-group joinBtn">
			<!-- 회원가입 완료 시 메인으로 이동 -->
			<input type="button" class="btn btn-default" value="회원가입" id="joinBtn"/>
		</div>
	</form>
<!-- 푸터 -->
<jsp:include page="Footer.jsp" />
</div>
</body>
</html>