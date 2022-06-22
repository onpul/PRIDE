<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#submitBtn").click(function()
		{
			var result = confirm("제출 시 수정이 불가능합니다. \n 제출하시겠습니까?");
			
			if(result)
			{
				$("#form").submit();
				alert("제출이 완료 되었습니다. 감사합니다.");
			}
			else
				alert("취소되었습니다.");
		});
		
		$("#notSaveBtn").click(function()
		{
			//사용자 응답받아서 처리하는 코드로 변경 예정.
			//alert("정말 취소하시겠습니까?");
			var result = confirm("정말로 취소하시겠습니까? \n 취소하면 내용은 저장되지 않습니다.");
			
			if(result)
			{
				location.replace('mypagemain.action');
			}
			else
				alert("취소되었습니다.");
		});
		
		$("#reportBtn").click(function()
		{
			// Report.jsp 
			// 신고폼으로 이동. 
			//location.replace('Report.jsp ');
			alert("신고하기 폼으로 이동.");
		});
	});
</script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<head>
<meta charset="UTF-8">
<title>EvaluationMemberForm.jsp</title>
</head>
<body>
<!-- 참여자 평가 폼 -->
<div>
	<h1>참여자의 평가 폼 입니다.</h1>
	<hr />
</div>
<!-- div main -->
<div class="container">
	<!-- 다음줄 center에 위치 -->
	<!-- 평가폼 -->
	<div>	
		<form id="form" action="/Riding/evaluationinsertleader.action" method="get">
			<div class="col col-xs-12">
				<h1>모임 평가하기</h1>
				<br />
				모임 이름 : <input type="text" name="riding_name" value="${riding_name }" readonly="readonly"/>
				<input type="hidden" name="riding_id" value="${riding_id }"> 
			</div>
			
			<div class="col col-xs-12" style="text-align: right;">
				작성자 : <input type="text" name="nikName" value="${nickName }" readonly="readonly">
				<input type="hidden" name="user_id" value="${user_id }">
			</div>
		
		
			
			<!--  출석 체크 -->
			<div class="col col-xs-12 checkbox">
				<br />
				<span style="font-weight: bold;"> 결석한 사람을 체크해 주세요.</span>
				
				<!-- 참여자 명단 보여주기 -->
				<input type="radio" name="attendance" value="not" style="display: none;" checked="checked">
				<c:forEach var="dto" items="${memberList }">
					<label for="${dto.user_id }">
						<input type="radio" name="attendance" value="${dto.user_id }" id="${dto.user_id }">
						${dto.nickName }
					</label>
				</c:forEach>
			</div>
			
			<!-- 방장에 대한 평가 -->
			<div class="col col-xs-12">
				<br />
				
				<span style="font-weight: bold;">방장은 어땠나요?</span>
				<input type="radio" name="leaderCheck" id="defalt" checked="checked" value="not"
				style="display: none;">
				<c:forEach var="dto" items="${leaderQuestionList }">
					<c:if test="${dto.question_id ==4}">
						<label for = "good">
						 	<input type="radio" name="qu_content" id="good" value="${dto.qu_content }">
						 	<p>${dto.qu_content }</p>
						 </label>
					</c:if>
					<c:if test="${dto.question_id ==5}">
						<label for = "soso">
						 	<input type="radio" name="qu_content" id="soso" value="${dto.qu_content }">
							<p>${dto.qu_content }</p>
						</label>
					</c:if>
					<c:if test="${dto.question_id ==6}">
						<label for = "bad">
						 	<input type="radio" name="qu_content" id="bad" value="${dto.qu_content }">
							<p>${dto.qu_content }</p>
						</label>
					</c:if>
				</c:forEach>
			</div>
			
			
			<!-- 친절한 사람 -->
			<div class="col col-xs-12">
				<br />
				<!-- 본인은 제외. -->
				<!-- 결석자는 포함. -->
				<span style="font-weight: bold;">
					<c:forEach var="dto" items="${leaderQuestionList }">
						<c:if test="${dto.question_id ==1}">
							<p>${dto.qu_content }</p>
						</c:if>
					</c:forEach>
				</span>
				
				<select class="form-control" name="kindness" id="kindness">
					<option value="not" selected="selected">없음.</option>
					<c:forEach var="dto" items="${memberList }">
						<option value="${dto.user_id }">${dto.nickName }</option>
					</c:forEach>
				</select>
			</div>
			
			
			<!-- 불친절한 사람 -->
			<div class="col col-xs-12">
			 	<br />
				<span style="font-weight: bold;">
					<c:forEach var="dto" items="${leaderQuestionList }">
						<c:if test="${dto.question_id ==2}">
							<p>${dto.qu_content }</p>
						</c:if>
					</c:forEach>
				</span>
				
				
				<select class="form-control" name="notKindness">
					<option value="not" selected="selected">없음.</option>
					<c:forEach var="dto" items="${memberList }">
						<option value="${dto.user_id }">${dto.nickName }</option>
					</c:forEach>
				</select>
			</div>
	
			<!-- 위험한 라이딩 -->
			<div class="col col-xs-12">		
				<br />
				<span style="font-weight: bold;">
					<c:forEach var="dto" items="${leaderQuestionList }">
						<c:if test="${dto.question_id ==3}">
							<p>${dto.qu_content }</p>
						</c:if>
					</c:forEach>
				</span>
				<select class="form-control" name="dangerRiding">
					<option value="not" selected="selected">없음.</option>
					<c:forEach var="dto" items="${memberList }">
						<option value="${dto.user_id }">${dto.nickName }</option>
					</c:forEach>
				</select>
			</div>
			
			
			<!-- 완주하지 못한 사람 -->
			<div class="col col-xs-12">	
				<br />	
				<span style="font-weight: bold;">
					<c:forEach var="dto" items="${leaderQuestionList }">
						<c:if test="${dto.question_id ==7}">
							<p>${dto.qu_content }</p>
						</c:if>
					</c:forEach>
				</span>
				<select class="form-control" name="notCompletion">
					<option value="not" selected="selected">없음.</option>
					<c:forEach var="dto" items="${memberList }">
						<option value="${dto.user_id }">${dto.nickName }</option>
					</c:forEach>
				</select>
			</div>
			
			<!--  숙련도에 대한 평가 -->
			<div class="col col-xs-12">
				<br />
				<!-- 모임의 속성이 숙련도 4~5이고 평속 20이상 
				     일 때만 활성화됨. -->
				<span style="font-weight: bold;">
					<c:forEach var="dto" items="${leaderQuestionList }">
						<c:if test="${dto.question_id ==8}">
							<p>${dto.qu_content }</p>
						</c:if>
					</c:forEach>
				</span>
				<select class="form-control" name="different">
					<option value="not" selected="selected">없음.</option>
					<c:forEach var="dto" items="${memberList }">
						<option value="${dto.user_id }">${dto.nickName }</option>
					</c:forEach>
				</select>
			</div>
			
			
			<div class="col col-xs-12" style="text-align: left;">
				<!-- Report.jsp -->
				<!-- 신고폼으로 이동. -->
				<br />
				<button type="button" class="btn btn-danger" id="reportBtn">신고하기</button>
			</div>			
	
			<br />
			
			<div class="col col-xs-12" style="text-align: center;">
				<!-- 제출완료 alert 창 뜨기-->
				<!-- 기존 마이페이지로 이동 -->
				<!-- MyPageMain.jsp -->
				<button type="button" class="btn btn-primary" id="submitBtn">제출</button>
				
				<!-- 저장되지 않는다는 alert창 뜨기-->
				<!-- 기존 마이페이지로 이동 -->
				<!-- MyPageMain.jsp -->
				<button type="button" class="btn btn-default" id="notSaveBtn">닫기</button>
			</div>
		</form>
	</div>	<!-- 평가 div close -->
</div> <!-- div main close -->

</body>
</html>