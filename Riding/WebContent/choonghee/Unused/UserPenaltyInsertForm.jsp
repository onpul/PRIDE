<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패널티 생성 폼</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- TODO -->
<!--  

	1. 패널티 종류는 DB에서 불러온다.
	2. 디폴트 값은 AJAX를 통해 패널티 종류에 따라 자동으로 입력되어있다.
	3. 부여 버튼 클릭 시, confirm 창이 등장한다.
	4. confirm에서 확인할 경우, 패널티 설정 값과 이전 페이지에서 넘겨받았던 ID값을 같이 DB로 보낸다.
	5. 해당 창을 닫고 회원ID값을 넘겨주고 UserPenaltyManagement를 재요청한다.
	6. 취소 버튼 클릭 시 현재 생성 창을 닫는다.
	7. 좌우 화살표 클릭 시, 기간을 설정할 수 있다.
	8. 기간은 1이상 30까지 설정 가능하다.

-->

</head>
<body>

<!-- # 페이지 설명
	   관리자가 회원에게 패널티를 부여하는 폼 -->

<!-- 제목 -->	   
<div>
	<h1>패널티 생성</h1>
</div>

<div>
	<form action="" class="form-horizontal" style="width:500px;">
		<!-- 패널티 종류 -->
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">패널티</label>
			<div class="col-sm-6">
				<select name="" id="" class="form-control">
					<option value="1" selected="selected">사이트 이용 제한</option>
					<option value="2">모임 생성/참여 제한</option>
				</select>
			</div>
		</div>
		<br /><br />
		
		<div class="form-group">
			<label for="period" class="col-sm-2 control-label">기간</label>
			<div class="col-sm-10">
				<div class="form-inline">
					<!-- 왼쪽 버튼: 기간 감소 -->
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</button>
					<!-- 해당 패널티에 대한 기간 기본값 입력되어있음 -->
					<input type="text" id="period" value="(기간 기본값)" class="form-control" >
					<!-- 오른쪽 버튼: 기간 증가 -->
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>
			</div>
		</div>
		<br /><br />
		<!-- 패널티를 받는 회원 정보 -->
		<div class="form-group">
			<div class="form-inline">
				<label for="" class="col-sm-2 control-label">패널티 대상</label>
				<textarea class="col-sm-10 form-control" readonly="readonly">(패널티 대상 정보)</textarea>
			</div>
		</div>
		<br /><br />
		<div class="form-group">
			<div class="col-sm-8">
				<!-- 패널티 부여 버튼: 패널티 대상 회원에게 패널티 적용하는 내용 폼 제출 -->
				<button type="button" onclick="" class="btn btn-warning">패널티 부여</button>
				<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
				<button type="button" onclick="" class="btn btn-danger">취소</button>
			</div>
		</div>		
	</form>
</div>


</body>
</html>