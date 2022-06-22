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
<title>신고 상세내용 조회</title>

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
			// 승인, 허위신고 처리 시 최종 확인 창
			// 승인버튼인지 허위신고 버튼인지
			if($(this).val() == 1 || $(this).val() == 2)
			{
				// 선택값 초기화
				$("#penaltyType").children().attr("selected", "");
				$("div.approve").css("display", "none");
				$("div.punish").css("display", "none");
				
				// 승인일 때
				if($(this).val() == 1)
				{
					// 승인이고, 후기 게시글 신고 일 때,
					if ($("#reportType").val() == '1')
					{
						//alert("여기");
						$("#penaltyType").children().val("1")
						$("#penaltyType").children().html("맛집 후기 게시글 신고")
						$(".approveBtn").attr("value", "1");
						$("div.approve").css("display", "");
					}
					// 승인이고, 비매너 참여자 신고일 때
					else if($("#reportType").val() == '2')
					{
						//alert("저기");
						$("#penaltyType").children().val("2")
						$("#penaltyType").children().html("비매너 참여자 신고")
						$(".approveBtn").attr("value", "1");
						$("div.approve").css("display", "");
					}
				}
				// 허위 신고일 때
				else if($(this).val() == 2)
				{
					// 허위 신고이고, 후기 게시글 신고 일 때,
					if ($("#reportType").val() == '1')
					{
						//alert("거기");
						$("#penaltyType").children().val("3")
						$("#penaltyType").children().html("맛집 후기 게시글 허위 신고")
						$(".approveBtn").attr("value", "2");
						$("div.punish").css("display", "");
					}
					// 허위 신고이고, 비매너 참여자 신고일 때
					else if($("#reportType").val() == '2')
					{
						//alert("우기기");
						$("#penaltyType").children().val("4")
						$("#penaltyType").children().html("비매너 참여자 허위 신고")
						$(".approveBtn").attr("value", "2");
						$("div.punish").css("display", "");
					}
				}
				// 모달
				$('#lastApproval').modal({
					backdrop: 'static'
					, show: true
				});
			}
			// 반려 버튼 클릭 시 최종 확인 창
			else if($(this).val() == 3)
			{
				$(".approveBtn").attr("value", "3");
				// 모달
				$('#lastCheck').modal({
					backdrop: 'static'
					, show: true
				});
			}
		});
		
		// 승인, 허위신고, 반려 최종 승인
		$(".approveBtn").on("click", function()
		{
			// 신고 ID
			var r_id = $("#r_id").val();
			
			// 후기 게시글 신고인지, 비매너 모임 참여자 신고인지
			var report_type = $("#reportType").val(); // 1 후기, 2 참여자
			
			// 관리자 ID. 최종 결정자가 누구인지.
			var admin_id = sessionStorage.getItem("userId") != null ? sessionStorage.getItem("userId") : "1";
			
			// 최종 처리 상태. 승인? 허위? 반려?
			var status = $(this).val();
				
			
			var params = "r_id="+r_id
							+"&report_type="+report_type
							+"&admin_id="+admin_id
							+"&status="+status;
			
			// 반려일 때
			if (status == '3')
				ajaxInsert(params, false)
			// 승인, 허위일 때
			else
				ajaxInsert(params, true);
		});
		
		
		// 취소 버튼 클릭 시
		$("#cancelBtn").on("click", function()
		{
			window.close();
		});
	});
	
	// DB에 신고처리 insert
	function ajaxInsert(params, isPenalty)
	{
		var url = "reportprocess.action";
		
		$.ajax(
		{
			type:"POST"
			, url: url
			, data: params
			, success: function(data)
			{
				alert(data);
				opener.ajaxList();
				
				if(isPenalty)
					alert("패널티 적용");
				else
					alert("패널티 없음");
				
				$('.modal').modal('hide');
				
				window.close();
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
				
	}
	
	// 패널티 적용하기
	function ajaxInsertPenalty(params)
	{
		var url = "";
		/* 
		$.post(url, params, function()
		{
			alert("최종 처리 완료")
		});
		*/
	}


</script>

</head>

<!-- TODO -->
<!--  
	*. div >> 부트스트랩 table로 변경
	   -- 해결
	2. 이전 페이지에서 받아온 값을 통해 해당 신고 내용 정보 불러오는 과정
	   -- 틀만 짰음  
	3. 신고 종류에 따라서, 신고 대상을 다르게 노출할 수 있도록 구성
	   -- DB처리라 아마 될 거임....
	4. 승인 버튼 클릭 시 ReportHandlingForm이 새 창 등장
	   -- 모달로 대체
	5. 승인 버튼 클릭 시, 신고 종류+신고 대상자 ID 넘기기.
	   -- 틀만 짰는데 넘어갈 듯?
	6. 반려 버튼 클릭 시 confirm 창 등장 후, 확인 클릭 시 반려되었습니다. alert 등장.
	   -- 모달로 대체	
	*. 닫기 버튼 클릭 시 ReportList로 이동
	   -- 처리
	8. 허위 신고 버튼 생성
	   -- 추가
	9. 허위 신고 버튼 클릭 시, 신고글 작성자 정보 전송하여 ReportHandlingForm 새 창 등장
	   -- 모달로 대체
	*. 승인, 반려, 허위신고, 닫기 모두 복합조건 값 넘겨주기
	    -- 필요없어짐.
-->


<body>

<!-- # 페이지 설명
	   관리자가 신고 상세 내용을 조회하는 페이지 -->

<!-- 제목 -->
<div>
	<h1>신고하기</h1>
	<hr>
</div>

<!-- 신고 상세 내용 -->
<table class="table table-bordered">
	<tbody>
		<tr>
			<th>
				<div>신고 종류</div>
			</th>
			<td>
				<div>
					<select id="reportType" name="reportType" disabled="disabled">
						 
						<c:choose>
							<c:when test="${detail[0].report_type eq 'REVIEW' }">
								<option value="1" selected="selected">맛집 후기 게시글 신고</option>
							</c:when>
							<c:when test="${detail[0].report_type eq 'PARTICI'}">
								<option value="2" selected="selected">비매너 참여자 신고</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div>신고 작성자ID(닉네임)</div>
			</th>
			<td>
				<div>
					${detail[0].user_id }(${detail[0].nickname })
				</div>
				
			</td>
		</tr>
		<tr>
			<th>
				<div>신고 대상자ID(닉네임)</div>
			</th>
			<td>
				<div>
					${detail[0].reported_user_id }(${detail[0].r_user_nickname} )
				</div>
				
			</td>
		</tr>
		
		<c:if test="${detail[0].report_type eq 'REVIEW' }">
		<tr>
			<th>
				<div>후기 내용</div>
			</th>
			<td>
				<div>${content }</div>
			</td>
		</tr>		
		</c:if>
		<tr>
			<th>
				<div>신고 사유</div>
			</th>
			<td>
				<!-- <div>(신고 이유 블라블라)</div> -->
				<div>${detail[0].content} </div>
			</td>
		</tr>
		<tr style="display:none;">
			<td>
				<input type="hidden" id="r_id" value="${detail[0].r_id }"/>
			</td>
		</tr>
	</tbody>
</table>

<br /><br />

<div>
	<div class="">
		<!-- 해결 버튼. 누르면 최종 승인 창이 새로 뜸. -->
		<!-- 무조건 뜨는 것은 아니고, 게시글 신고 및 참여자 신고일 때만 나타남  -->
		<!-- 위의 경우가 아니라면 마지막 승인 확인 confirm만 등장 -->
		<button type="button" id="approveBtn" class="btn btn-success processBtn"
		value="1">승인</button>
		<!-- 허위 신고 버튼. 신고 작성자를 처벌 -->
		<button type="button" id="punishBtn" class="btn btn-warning processBtn"
		value="2">허위</button>
		<!-- 반려 버튼. -->
		<button type="button" id="returnBtn" class="btn btn-warning processBtn"
		value="3">반려</button>
		<!-- 돌아가기 버튼: 신고 내역 조회로 돌아감. (이전 페이지로) -->
		<button type="button" id="cancelBtn" class="btn btn-default">돌아가기</button>
	</div>
</div>

<!-- Modal -->
<!-- 패널티 부여 전 최종 확인 창 -->
<div class="modal fade" id="lastApproval" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close closeBtn" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">최종 승인</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>
								<div>패널티 대상자</div>
							</th>
							<td>
								<div>(패널티 받는 사람 ID(닉네임)</div>
								<div class="approve">${detail[0].reported_user_id }(${detail[0].r_user_nickname})</div>
								<div class="punish">${detail[0].user_id }(${detail[0].nickname })</div>
							</td>
						</tr>
						<tr>
							<th>
								<div>패널티 사유</div>
							</th>
							<td>
								<div>
									<select id="penaltyType" disabled="disabled">
										<option value="1"></option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<div>패널티 내용</div>
							</th>
							<td>
								<div>(패널티 내용 및 기간)</div> <!-- ${list.penaltyContent} -->
							</td>
						</tr>
					</tbody>
				</table>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary approveBtn">승인</button>
				<button type="button" class="btn btn-default closeBtn"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<!-- 반려 전 최종 확인 창 -->
<div class="modal fade" id="lastCheck" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">반려 확인</h4>
			</div>
			<div class="modal-body">반려 처리하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary approveBtn">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>