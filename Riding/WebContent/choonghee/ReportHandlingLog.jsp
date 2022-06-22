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
<title>신고 처리 로그 페이지</title>
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
		ajaxList();
		
		
		$(".reportLog").on("click", function()
		{
			var reportId = $(this).children().val(); 
			
			window.open("ReportDetail.jsp?reportId="+reportId, "신고 상세 내역", "width=700, height=500");
		});
		
		/* 돌아가기 or 닫기 버튼 */
		$("#cancelBtn").on("click", function()
		{
			$(location).attr("href", "ReportOccurence.jsp");
		});
		
		
	});

	function ajaxList()
	{
		/* 
		$.ajax(
		{
			type:"POST"
			, url: url
			, data: params
			, dataType:"json"
			, success:function(lists)
			{
				var out = "";
				
				lists.forEach(function(list)
				{
					out += '<p class="reportLog">'
					out += "* ";
					out += "["+list.userId+"] ";
					out += "회원의 ";
					out += "["+list.reportTypeName]+"] ";
					out += "신고 ";
					out += "["+list.content+"] ";
					out += "완료";
					out += "<input type='hidden' value='"+list.userId+"'/>"
					out += "</p>";
				});
				
				$("div.logList").append(out);
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
		*/
	}

</script>
</head>


<!-- TODO -->
<!--
	1. 신고 처리 모든 기록 불러오는 과정
	   -- AJAX 틀 구성
	2. 불러온 기록을 줄 단위로 뿌리는 과정
	   -- ajaxList()에 대충 구성...
	3. 해당 로그 클릭 시 ReportDetail 페이지로 넘어갈 수 있도록 설정
	   -- 설정
	4. 이 때 돌아가야할 페이지 값 or 상태 표시 변수 값 넘겨주기
	   -- 세션쓰고, 팝업이라 문제없을 듯...
	*. 닫기 버튼 클릭 시, ReportOccurence 페이지로
	   -- 해결
	
-->

<body>

<!-- # 페이지 설명
	   신고처리했던 기록을 모두 출력하는 페이지 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>신고 처리 로그</h3>
</div>

<!-- 로그 출력 -->
<div class="logList">
	<!-- p 클릭 시 해당 신고 상세 내역 조회 페이지로 넘어감 -->
	<p class="reportLog">
		* [ID1] 회원의 [맛집 후기 게시글] 신고 [승인] 완료
		<input type="hidden" value="ID1"/>
	</p>
	<p class="reportLog">
		* [ID2] 회원의 [모임에서 부적절한 회원] 신고 [반려] 완료
		<input type="hidden" value="ID2"/>
	</p>
</div>

<!-- 돌아가기 버튼 -->
<div>
	<div class="">
		<!-- 돌아가기 버튼: 신고 발생 페이지로 돌아감. (이전 페이지로) -->
		<button type="button" id="cancelBtn" class="btn btn-default">돌아가기</button>
	</div>
</div>


</body>
</html>