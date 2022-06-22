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
<title>모임 수정</title>

<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- jquery UI -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"
	integrity="sha256-6XMVI0zB8cRzfZjqKcD01PBsAy3FlDASrlC8SxCpInY=" 
	crossorigin="anonymous"></script>

<!-- jqueryUI css -->
<link rel="stylesheet" href="https://releases.jquery.com/git/ui/jquery-ui-git.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"  type="text/css" href="<%=cp%>/choonghee/CreateMeetCSS.css">

<script type="text/javascript">
	//라이딩 시작 일시
 	$(document).ready(function()
	{
		//alert("확인");
		
		$("#datepicker").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeMonth : true
			, changeYear : true
		});
		
		$("#datepicker2").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeMonth : true
			, changeYear : true
		});
		
		// 라이딩 스타일 최초 '제한없음' 선택으로 초기화
		$(".riding-style input[value='0']").prop('checked', 'checked');
		
		$("#riding_name").on("keydown", function()
		{
			if(Number($(this).val().length) == 20)
				alert("20자 제한으로 해주세요.");
		})
				
	});
 		
	// 장소를 검색하는 화면이 새로 뜨게 됨
	function searchCheck()       //
	{
		//alert("hi");
		
		window.open("kakaoMap.jsp" , "test", "width=800, height=800");
		
	}
	
	// 경유지를 검색하는 화면이 새로 뜨게 됨
	function searchList()
	{
		window.open("listMap.jsp", "test1", "width=800, height=800");
	}
</script>
</head>
<body>
<div>
	<h3>1인 라이딩 모임 수정 폼입니다</h3>
    <hr>
</div>


<div class="container">
	<form action ="insertriding.action" method="post">
		<table class="table table-bordered">
			<tr>
				<th>모임 이름</th>
				<td>
					<input type="text" id="riding_name" name="riding_name" 
					maxlength="20" placeholder="20자 이내로 입력하세요"/>
				</td>
			</tr>
			<tr>
				<th>라이딩 기간</th>
				<td>
					<input type="text" id="datepicker" name="start_date"> 
					~ <input type="text" id="datepicker2" name="end_date">
				</td>
			</tr>
			<tr>
				<th>모임 출발 장소</th>
				<td>
					<input type="text" class="txt" name="splace"
					id="splace" oninput="nameError(this)" placeholder="대표주소를 입력하세요"/>
					<input type="text" class="txt" name="sdetail"
					id="sdetail" oninput="nameError(this)" placeholder="상세주소를 입력하세요"/>
					<button type="button" onclick="searchCheck()">검색</button>
				</td>
			</tr>
			<tr>
				<th>모임 종료 장소</th>
				<td>
					<input type="text" class="txt" name="eplace"
					id="eplace" oninput="nameError(this)" placeholder="대표주소를 입력하세요"/>
					<input type="text" class="txt" name="edetail"
					id="edetail" oninput="nameError(this)" placeholder="상세주소를 입력하세요"/>
					<button type="button" onclick="searchCheck()">검색</button>
				</td>
			</tr>
			<tr>
				<th>경유지</th>
				<td>
					<div>
						<button type="button" onclick="searchList()">경유지 찾아보기</button>
					</div>
					<div>
						<jsp:include page="bicycle.jsp"></jsp:include>
					</div>
					<div>
						<label for="">경유지1</label>
						<input type="text" class="txt" name="place1"/>
					</div>	
				</td>
			</tr>
		</table>
		
		<br />
		
		
		<div>
			<hr />
			<input 	type="submit" value="모임수정하기">   
			<input type="reset"	value="취소하기">
		</div>
	</form>
</div>

</body>
</html>