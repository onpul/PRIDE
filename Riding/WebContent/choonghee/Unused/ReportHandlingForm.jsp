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
<title>신고 처리 폼</title>
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
	1. 넘겨받은 신고 종류 값에 따라 패널티 자동 설정
	2. 신고 종류 값에 따라 DB를 통해 기간 디폴트 값 받아오기
	3. 기간 좌우 클릭 시 가운데 기간 값이 변할 수 있도록.
	4. 기간 값은 정수만 가능하고, 화살표는 ±1만 가능하게.
	5. 기간 값은 1부터 30까지 가능하게
	6. 넘겨받은 신고 대상 정보를 통해 신고 대상정보 자동으로 기입.
	7. 승인 버튼 클릭시 최종 승인 확인하는 confirm 등장
	8. confirm 후 승인 시 alert 등장. 그리고 ReportList 페이지로 보내기
	9. 승인 혹은 취소 시 복합조건 값 넘겨주기
	
-->

</head>
<body>

<!-- # 페이지 설명
	   관리자가 신고 내용을 최종적으로 승인하고, 패널티를 부여하는 폼 페이지 -->

<!-- 제목 -->
<div>
	<h1>신고 처리</h1>
</div>

<div>
	<form action="" class="form-horizontal" style="width:500px;">
		<!-- 패널티 종류 -->
		<!-- 신고 종류에 따라 패널티가 정해져있기 때문에 비활성화. 자동 선택 -->
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">패널티</label>
			<div class="col-sm-6">
				<select name="" id="" class="form-control" disabled="disabled">
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
		<div class="form-group">
			<div class="form-inline">
				<label for="" class="col-sm-2 control-label">신고대상</label>
				<textarea class="col-sm-10 form-control" readonly="readonly">(신고대상 정보)</textarea>
			</div>
		</div>
		<br /><br />
		<div class="form-group">
			<div class="col-sm-8">
				<!-- 수정 버튼: 신고대상 ID + 패널티 적용 폼 제출 -->
				<button type="button" onclick="" class="btn btn-warning">승인</button>
				<!-- 취소 버튼: 현재 수정 페이지를 닫기. (이전 페이지로) -->
				<button type="button" onclick="" class="btn btn-danger">취소</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>