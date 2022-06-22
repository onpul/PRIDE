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
<title>문의 상세내용 조회</title>

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
		// 처리 버튼 클릭 시
		$(".processBtn").on("click", function()
		{
			//alert(status == 1 ? "해결 처리 완료" : "반려 처리 완료");
			
			$("#status").val(status);
			
			$("#inquiryForm").submit();
			
			// ajax로 insert 처리 하는 곳
			ajaxInsert($(this).val());
			
			// 문의 내역 조회로 다시 돌아가기
			window.close();
		});
		
		// 닫기, 취소 버튼 클릭 시
		$("#cancelBtn").on("click", function()
		{
			window.close();
		});
	});
	
	function ajaxInsert(status)
	{
		var url = "";
		
		/* 
		$.post(url
		, {
			status:status
		}, function(args)
		{
			alert(status != 0 ? "해결 처리 완료" : "반려 처리 완료");
		});
		
		//opener.ajaxList();
		//opener.ajaxPage();
		
 		*/
	}

</script>

</head>

<!-- TODO -->
<!--  
	*. div >> 부트스트랩 table로 변경
	   -- 해결
	2. 이전 페이지에서 받아온 값을 통해 해당 문의 내용 정보 불러오는 과정
	   -- 대충 구조 짰음.
	3. 해결 버튼 클릭 시 '해결로 설정' alert 등장 그리고 InquiryList로 넘어가기
	   -- 대충 구조 짰음.
	4. 반려 버튼 클릭 시 '거절로 설정' alert 등장 그리고 InquiryList로 넘어가기
	   -- 대충 구조 짰음.
	5. 돌아가기 버튼 클릭 시 InquiryList로 넘어가기
	   -- 그냥 취소 버튼.
	6. 해결, 반려, 돌아가기 모두 복합조건 값 넘겨주기
	   -- 필요 없음.
-->

<body>

<!-- # 페이지 설명
	   관리자가 문의 상세 내용을 조회하는 페이지 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>문의 상세내용</h3>
</div>

<!-- 문의 상세 내용 -->
<div>
	<form id="inquiryForm" action="" method="post"></form>
	<table class="table table-bordered">
		<tbody>
			<div>
				<%-- <input type="hidden" value="${list.i_id }"/> --%>
				<input type="hidden" id="i_id" name="i_id" value="(문의id)"/>
				<input type="hidden" id="status" name="status" value=""/>
			</div>
					
			<tr>
				<th>
					<div>
						제목
					</div>
				</th>
				<td>
					<div>
						(문의제목)
						<!-- ${list.inquireTitle} -->
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						작성자
					</div>
				</th>
				<td>
					<div>
						작성자ID(작성자닉네임)
						<!-- ${list.userId}(${list.nickname}) -->
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						작성일
					</div>
				</th>
				<td>
					<div>
						(작성일)
						<!-- ${list.inquireDate} -->
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						내용
					</div>
				</th>
				<td>
					<div>
						<p>
							(문의 내용)
							<!-- ${list.content} -->
						</p>
					</div>
				</td>
			</tr>			
		</tbody>
	</table>
	<br /><br />
</div>

<div class="">
	<!-- 해결 버튼. 누르면 문의의 상태만 바뀜. -->
	<button type="button" id="solveBtn" class="btn btn-success processBtn"
	value="1">해결</button>
	<%-- value="${list.inquireId}">해결</button> --%>
	<!-- 반려 버튼. 누르면 문의의 상태만 바뀜. -->
	<button type="button" id="returnBtn" class="btn btn-warning processBtn"
	value="2">반려</button>
	<%-- value="${list.inquireId}">반려</button> --%>
	<!-- 돌아가기 버튼: 문의 내역 조회로 돌아감. (이전 페이지로) -->
	<button type="button" id="cancelBtn"  class="btn btn-default">돌아가기</button>
</div>


</body>
</html>