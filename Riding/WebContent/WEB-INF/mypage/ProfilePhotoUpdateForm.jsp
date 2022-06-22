<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#updateBtn").click(function()
		{
			//alert("다시 MyInfoUpdateForm.jsp로 이동한다. 수정된 값을 가지고!");
			$("#profilePhoto",opener.document).text($(":radio").val());
			window.close();
		});
		
		$("#cancellBtn").click(function()
		{
			window.close();
		});
	});
	
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>ProfilePhotoUpdateForm.jsp</title>
</head>
<body>
<!-- 프로필사진 변경 폼-->
<!-- profilePhotoUpdateForm.jsp -->
<div class="container">
	<div class="col col-xs-12">
		프로필 사진 변경하기
	</div>
	<div class="col col-xs-12">
		<!-- 기존 선택되어 있는 사진이 selected 되어있어야함. -->
		<div>
			<label><input type="radio" name="img" value="서브창1"><img alt="" src="">이미지1</label>
			<label><input type="radio" name="img" value="서브창2"><img alt="" src="">이미지2</label>
			<label><input type="radio" name="img" value="서브창3"><img alt="" src="">이미지3</label>
		</div>
			
		<div>
			<button type="button" class="btn btn-primary" id="updateBtn">선택하기</button>
			<button type="button" class="btn btn-primary" id="cancellBtn">취소</button>
		</div>
		
	</div>
</div>


</body>
</html>