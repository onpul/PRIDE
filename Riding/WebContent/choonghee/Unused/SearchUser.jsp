<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색 폼</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
	}
	.divTableCell, .divTableHead {
		border: 1px solid #999999;
		display: table-cell;
		padding: 3px 10px;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
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
<script type="text/javascript">

	$(function()
	{
		
	});
	
	function testClick(userId, userNick)
	{
		opener.loadUserInfo(userId, userNick);
		window.close();
	}
</script>


<!-- TODO -->
<!--  

	1. div >> 부트스트랩 table로 변경
	2. 회원 검색 창에 특정 값 입력 후, 조건 선택하여 검색버튼 눌렀을 때, DB로 넘어가는 과정
	3. AJAX를 통해 회원 리스트가 실시간으로 출력
	4. 선택 버튼이나 취소 클릭 시, 현재 회원 검색 창을 닫는다.
	5. 선택 버튼일 경우에는, 회원ID를 같이 넘겨준다.
	 
-->
</head>

<body>

<!-- # 페이지 설명
	   관리자가 회원을 검색했을 때, 회원 검색 폼이 해당 회원 정보를 이전 페이지에 전송 -->
	   
<!-- 제목 -->
<div>
	<h3>회원 검색</h3>
</div>

<!-- ID 혹은 닉네임을 선택하여 회원을 검색 -->
<!-- 해당 div는 오른쪽 정렬 필요... -->
<div class="">
	<form action="" class="form-inline">
		<div class="form-group radio">
			<label for="userId">
				<input type="radio" id="userId" name="searchType" value="userId"/>ID
			</label>
			&nbsp;
			<label for="userNick">
				<input type="radio" id="userNick" name="searchType" value="userNick"/>닉네임	
			</label>
		</div>
		<div class="form-group">
			<input type="text" placeholder="(회원 검색)" onclick="" class="form-control"/>
			<button type="button" class="btn btn-default">검색</button>
		</div>
	</form>
</div>
<br />

<!-- 회원 검색을 하면 밑의 리스트에서 회원 목록이 출력된다 -->
<form action="">
	<div class="divTable">
		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableCell">ID</div>
				<div class="divTableCell">닉네임</div>
				<div class="divTableCell">가입일</div>
				<div class="divTableCell">생년월일</div>
				<div class="divTableCell"></div>
			</div>
			<div class="divTableRow">
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">
					<button id="test" type="button" onclick="javascript:testClick('2', '히히히')">선택</button>
				</div>
			</div>
			<div class="divTableRow">
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">
					<button type="button" onclick="javascript:testClick('3', 'asdf')">선택</button>
				</div>
			</div>
			<div class="divTableRow">
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">&nbsp;</div>
				<div class="divTableCell">
					<button type="button">선택</button>
				</div>
			</div>
		</div>
	</div>	
</form>



<br /><br />
<div>
	<button type="button">
		취소
	</button>
</div>
</body>
</html>