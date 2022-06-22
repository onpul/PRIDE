<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String header = "/WEB-INF/view/Header.jsp";
	System.out.println("header = " + header);
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$(".letterBtn").click(function()
		{
			var letterId = $(this).val();
			location.replace("letter.action?letterId="+letterId);
		});

		$("#deleteBtn").click(function()
		{
			// 사용자 응답을 받는 형태로 변경 예정.(확인 / 취소)
			//alert("정말 삭제하시겠습니까?");
			var result = confirm("쪽지를 정말 삭제하시겠습니까?");
			
			if (result)
			{
				$("#form").submit();
				alert("삭제되었습니다.");
			}
			else
				alert("취소되었습니다.");
		});
		
		$("#writeBtn").click(function()
		{
			location.replace("lettersendform.action");
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>LetterList.jsp</title>
</head>
<body>
<!-- 헤더 -->
<div>
	<c:import url="<%=header %>"></c:import>
</div>
<div class="container">
	<!-- 쪽지 리스트 조회 페이지 -->
	<!-- LetterList.jsp -->
	
	<div class="col col-xs-12" style="text-align: center;">
		<span style="font-weight: bold;">쪽지</span>
	</div>
	
	<div class="col col-xs-12">
		<select class="select" name="letterListOption" id="letterListOption">
			<option value="all" selected="selected">전체 쪽지</option>
			<option value="send">받은 쪽지</option>
			<option value="receive">보낸 쪽지</option>
		</select>
	</div>
		
	<div class="col col-xs-12" style="text-align: right;">
		<button type="button" class="btn btn-default" id="writeBtn">쪽지쓰기</button>
	</div>
	
	<div class="col col-xs-12">
		<form action="">
		<br />
			<table class="table table-bordered">
				<tr>
					<th></th>
					<th>보낸 사람</th>
					<th>제목</th>
					<th>쪽지 상세내용 보기</th>
				</tr>
				
				<tr>
					<td style="text-align: center;">
						<input type="checkbox" name="letter" value="1" />
					</td>
					<td>
						홍길동
					</td>
					<td>
						안녕하세요.
					</td>
					<td>
						<button type="button" class="btn btn-default letterBtn" value="1">
							보기
						</button>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;">
						<input type="checkbox" name="letter" value="2"/>
					</td>
					<td>
						남주혁
					</td>
					<td>
						저번에 같이 라이딩했던 사람입니다.
					</td>
					<td>
						<button type="button" class="btn btn-default letterBtn" value="2">
							보기
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="col col-xs-12" style="text-align: center;">
		<span>1 2 3</span>
	</div>
	
	<div class="col col-xs-12" style="text-align: right;">
		<button type="button" id="deleteBtn" class="btn btn-default">삭제</button>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</body>
</html>