<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RidingStyleListUpdateForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		var temp;
		
		$("input").change(function()
		{
			// 변경 내용이 하나라도 있다면 
			temp = 1;
		});
		
		// 도움말 
		$("[data-toggle='tooltip']").tooltip();
		
		
		
		$("#updateCheck").click(function()
		{
			
			var result = confirm("정말로 수정하시겠습니까?");
			if (result)
			{
				$("#myform").submit();
			}
		});
		
		$("#myPageMain").click(function()
		{
			if(temp == 1)
			{
				var result = confirm("변경사항이 저장되지 않습니다. \n 정말로 페이지를 이동하시겠습니까?");
					if (result)
					{
						location.replace("mypagemain.action");
					}
			}
			else
				location.replace("mypagemain.action");
			
		})
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 부트스트랩 아이콘  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<!-- 라이딩 스타일 조회 및 수정 폼 -->
<!-- RidingStyleListUpdateForm.jsp -->
<div class="container" style="background-color: gray;">
	<div class="col col-xs-12">
		라이딩 스타일 조회 및 수정 페이지
	</div>
	<div class="col col-xs-12" style="background-color: aqua;">
		<!-- 사용자가 회원가입할 때 입력한 값이 check 되어 보여진다. -->
		<!-- 회원가입할 때 라이딩스타일 체크 안했으면 당연히 check 안된 상태로 보여진다. -->
		
		<!--          ------------- 여기 수정 예정 ~!!! -->
		<form action="insert.action" method="get" style="background-color: pink;" id="myform">
			<div class="radio">
				<span style="font-weight: bold;">성별</span>
				<!-- 본인과 동일한 성별의 옵션만 노출되게 구현해야 함 -->
				<label for="genderX">
					<input type="radio" name="gender" id="genderX" value="genderX" checked="checked"> 제한 없음 
				</label>
				<label for="genderF">
					<!-- 회원가입할때 유저의 성별에 따라 남성 / 여성 보여짐. -->
					<!-- 사용자가 선택한게 checked -->
					<input type="radio" name="gender" id="genderF" value="genderF" > 여성 
				</label>
			</div>
			
			<div class="radio">
				<span style="font-weight: bold;">연령대</span>
				
				<label for="ageX">
					<input type="radio" name="age" id="ageX" value="ageX" checked="checked"> 제한 없음
				</label>
				
				<!-- 사용자 연령대에 따른 10 / 20 / ... 등 보여짐.-->
				<!-- 사용자가 선택한게 checked -->
				<label for="age20">
					<input type="radio" name="age" id="age20" value="age20"> 20대
				</label>
			</div>
			
			<div class="radio">
				<span style="font-weight: bold;">숙련도</span>
				<label for="sukX"><input type="radio" name="suk" value="sukX" id="sukX" checked="checked">제한없음</label>
				<label for="suk1"><input type="radio" name="suk" value="suk1" id="suk1">1년 미만</label>
				<label for="suk2"><input type="radio" name="suk" value="suk2" id="suk2">1 ~ 3년</label>
				<label for="suk3"><input type="radio" name="suk" value="suk3" id="suk3">3 ~ 5년</label>
				<label for="suk6"><input type="radio" name="suk" value="suk6" id="suk6">6년 이상</label>
				<!-- 도움말 -->
				
				<a href="#" data-toggle="tooltip" 
				title="숙련도란?남들에게 말할 수 있는 객관적인 경력입니다." class="bi bi-question-circle-fill" ></a>
			</div>
			
			<div class="radio">
				<span style="font-weight: bold;">식사여부</span>
				<label for="foodX"><input type="radio" name="food" value="foodX" id="foodX" checked="checked">상관없음</label>
				<label for="food1"><input type="radio" name="food" value="food1" id="food1">밥 먹고 달려요</label>
				<label for="food2"><input type="radio" name="food" value="food2" id="food2">밥 안먹고 달려요</label>
			</div>
			
			<div class="radio">
				<span style="font-weight: bold;">회식여부</span>
				<label for="togetherX"><input type="radio" name="together" value="togetherX" id="togetherX" checked="checked">상관없음</label>
				<label for="together1"><input type="radio" name="together" value="together1" id="together1">끝나고 회식 해요</label>
				<label for="together2"><input type="radio" name="together" value="together2" id="together2">끝나고 회식 안해요</label>
			</div>
			
			<div class="radio">
				<span style="font-weight: bold;">분위기</span>
				<label for="moodX"><input type="radio" name="mood" value="moodX" id="moodX" checked="checked">제한없음</label>
				<label for="mood1"><input type="radio" name="mood" value="mood1" id="mood1">친목이 좋아요</label>
				<label for="mood2"><input type="radio" name="mood" value="mood2" id="mood2">침묵이 좋아요</label>
			</div>
			
			<div style="text-align: center;">
				<!-- MyPageMain.jsp 로 이동. -->
				<button type="button" id="updateCheck" class="btn btn-success">수정하기</button>
				<!-- MyPageMain.jsp 로 이동. -->
				<button type="button" 
				id="myPageMain" class="btn btn-default">마이페이지로 이동</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>