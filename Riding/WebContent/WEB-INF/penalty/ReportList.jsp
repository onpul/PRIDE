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
<head>
<meta charset="UTF-8">
<title>신고 내역 조회</title>

<!-- 헤더 -->
<c:import url="<%=header %>"></c:import>

<script type="text/javascript">
	$(function()
	{
		// 최초 페이지 요청 시 세션 초기화
		sessionStorage.setItem("page", 1);
		sessionStorage.setItem("status", 'none');
		sessionStorage.setItem("type", 'none');
		sessionStorage.setItem("orderBy", 'none');
		
		// 정렬 버튼 초기화
		$(".sorting").children("button").css("display", "");
		$(".sorting").find("button:not(:first)").css("display", "none");
		
		// 페이지 1번 버튼 활성화
		$(".numberBtn").removeClass("active");
		$(".numberBtn:eq(0)").addClass("active");
		
		// 신고 글을 눌렀을 때, 신고 상세 내역 창 팝업
		$(".report").on("click", function()
		{
			reportClick($(this));
		});
			
		/* 정렬 버튼 순환*/
		$(".sorting").on("click", function()
		{
			// 현재 보이는 거의 다음 것 element 저장
			var sorting = $(this).children(":visible").next();
			
			// 다음 엘리먼트가 없다면, 첫번째 순서로 복귀
			if ( $(this).children(":visible").next().length == 0 )
				sorting = $(this).children(":first");
			
			// 일단 이 분류 버튼 것 다 초기화
			$(this).children("button").css("display", "none");
			// 해당되는 다음 순서 버튼만 display 노출
			sorting.css("display", "");
			
			// 오름차순-내림차순 정렬
			if (sorting.val().includes("orderBy"))
			{
				setCondition(sorting.val());
			}
			// 상태 정렬
			else
			{
				setWhere(sorting.val())
			}
		});
		
		/* 정렬 초기화 버튼 */
		$("#resetSortingBtn").on("click", function()
		{
			resetSorting();
		});
		
		/* 페이지 버튼 클릭 */
		$(".numberBtn").on("click", function()
		{
			numberBtnClick($(this));
		});
		
		/* 페이지 점프 버튼 클릭 */
		$(".jumpBtn").on("click", function()
		{
			jumpBtnClick($(this));
		});
		
				
		/* 돌아가기 or 닫기 버튼 */
		$("#cancelBtn").on("click", function()
		{
			$(location).attr("href", "주소내용");
		});
	});
	
	// 신고 글 클릭했을 때
	function reportClick(obj)
	{
		//console.log($(this).children("td:eq(0)").children().children().val());
		var r_id = String(obj.children("td:eq(0)").children().children().val());
		
		//console.log(typeof r_id);
		//console.log(r_id);
		
		var url = "reportdetail.do?r_id="+r_id;
		//var url = "reportlist.do";
		
		window.open(url, "신고 상세 내역", "width=700, height=500");
		//window.open("reportdetail.do", "신고 상세 내역", "width=700, height=500");
	}
	
	// 정렬 초기화
	function resetSorting()
	{
		// 세션에 저장해놓은 정보 초기화
		sessionStorage.setItem("status", 'none');
		sessionStorage.setItem("type", 'none');
		sessionStorage.setItem("orderBy", 'none');
		sessionStorage.setItem("page", "1");
		
		// 정렬 버튼 초기화
		$(".sorting").children("button").css("display", "");
		$(".sorting").find("button:not(:first)").css("display", "none");
		
		ajaxList();
		ajaxPage();
	}
	
	/* 정렬 조건 설정 */
	function setCondition(cond)
	{
		// 해당 조건 기록
		var orderBy = cond.split(" ")[1] != null
						? cond.split(" ")[1] : "none";
		
		sessionStorage.setItem("orderBy", orderBy);
		
		ajaxList();
		ajaxPage();
	}
	
	// 상태 조건 설정
	function setWhere(where)
	{
		if(where.includes("type"))
		{
			if(where.includes('REVIEW'))
				sessionStorage.setItem("type", 'REVIEW');
			else if(where.includes('PARTICI'))
				sessionStorage.setItem("type", 'PARTICI');
			else
				sessionStorage.setItem("type", "none");
		}
		else
		{
			if(where.includes('WAIT'))
				sessionStorage.setItem("status", '0');
			else if(where.includes('APPROVE'))
				sessionStorage.setItem("status", '1');
			else if(where.includes('PUNISH'))
				sessionStorage.setItem("status", '2');
			else if(where.includes('RETURN'))
				sessionStorage.setItem("status", '3');
			else
				sessionStorage.setItem("status", "none");
		}
		sessionStorage.setItem("page", 1);
		ajaxList();
		ajaxPage();
	}
	
	// 페이지 목록 버튼 눌렀을 때
	function numberBtnClick(obj)
	{
		// 이동할 페이지 정보 저장
		var page = obj.val();
		sessionStorage.setItem("page", page);
		
		$(".numberBtn").removeClass("active");
		obj.addClass("active");
		
		// 페이지 리스트 다시 출력
		ajaxList();
	}
	
	// 이전 or 다음 버튼 눌렀을 때
	function jumpBtnClick(obj)
	{
		// 이동할 페이지 정보 저장
		var page = obj.val();
		sessionStorage.setItem("page", page);
		
		// 페이지 리스트 다시 출력
		ajaxList();
		ajaxPage();
	}
	
	// ajax 이용. 문의 리스트 불러오기
	function ajaxList()
	{
		// where 및 order by 조건 추가.
		
		var page = sessionStorage.getItem("page");
		var orderBy = sessionStorage.getItem("orderBy");
		var status = sessionStorage.getItem("status");
		var type = sessionStorage.getItem("type");
		
		
		
		var params = "page="+page + "&orderBy=" + orderBy
				+ "&status="+status + "&type=" + type;
				
		var url = "ajaxreportlist.action";
		 
		$.ajax(
		{
			type:"POST"
			, url: "ajaxreportlist.action"
			, data: params
			//, dataType: "json"
			//, contentType: 'charset=utf-8'
			, success:function(lists)
			{
				//alert("정렬");
				var list = JSON.parse(lists);
								
				var out = "";
			
				// 새로 글 목록 쓰기..
				list.forEach(function(rep)
				{
					out += '<tr class="report">'
					
					out += '<td><div>'+rep.num;
					out += '<input type="hidden" value="'+rep.r_id+'"/></div></td>';
					
					if (rep.report_type == 'REVIEW')
						out += '<td><div>맛집 후기 신고</div></td>';
					else if (rep.report_type == 'PARTICI')
						out += '<td><div>비매너 참여자 신고</div></td>';
					else
						out += '<td><div>미분류</div></td>';
					out += '<td><div>'+rep.user_id+'('+rep.nickname+')'+'</div></td>';
					out += '<td><div>'+rep.report_date+'</div></td>';
					out += '<td><div>';
					out += '<button type="button"><span>';
					
					if (rep.status_id == '1')
						out += '승인'
					else if (rep.status_id == '2')
						out += '허위'
					else if (rep.status_id == '3')
						out += '반려'
					else
						out += '대기'
					out += '</span></button>';
					out += '</div></td>';
					out += '</tr>';
				});
				//console.log(out);
				
				// 초기화시키고 다 쓴거 붙여주기
				$("tbody").children().remove();
				$("tbody").append(out);
				
				// 현재 페이지인 버튼 활성화
				$(".numberBtn").removeClass("active");
				$("button.numberBtn[value="+page+"]").addClass("active");
				
				// 이벤트 다시 달아줌
				$(".report").on("click", function()
				{
					reportClick($(this));
				});
				
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
			
		});
	}
	
	// ajax 이용. 페이지 번호 목록 불러오기
	function ajaxPage()
	{

		var page = sessionStorage.getItem("page");
		var status = sessionStorage.getItem("status");
		var type = sessionStorage.getItem("type");
		
		var params = "page="+page + "&status="+status + "&type=" + type;
				
		var url = "ajaxreportpage.action";
		
		$.ajax(
		{
			type:"POST"
			, url: url
			, data: params
			, dataType: "json"
			//, contentType: 'charset=utf-8'
			, success:function(result)
			{
				var out = "";
				
				console.log(typeof result.prevPage);
				
				
				// 버튼 목록 다시 쓰기
				out += '<div>';
				
				out += '<span><button type="button" class="btn btn-default jumpBtn"';
				out += 'value="' + result.prevPage + '">';
				out += '이전</button></span>';
				
				for(var i=Number(result.startPage); i<=Number(result.endPage); i++)
				{
					out += '<span>';
					
					out += '<button type="button" class="btn btn-default numberBtn"';
					
					out += 'value="' + i + '">' + i + '</button>';
					
					out += '</span>'; 
				}
				
				out += '<span><button type="button" class="btn btn-default jumpBtn" value="';
				out += result.nextPage + '">다음</button></span>';
				out += '</div>';
				
				
				$("div.pageNavigation").children().remove();
				$("div.pageNavigation").append(out);
				
				$(".numberBtn").removeClass("active");
				$("button.numberBtn[value="+page+"]").addClass("active");
				
				/* 페이지 버튼 클릭 */
				$(".numberBtn").on("click", function()
				{
					numberBtnClick($(this));
				});
				
				/* 페이지 점프 버튼 클릭 */
				$(".jumpBtn").on("click", function()
				{
					jumpBtnClick($(this));
				});
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
			
		});
				
	}
</script>

</head>

<!-- TODO -->
<!--  
	*. div >> 부트스트랩 table로 변경
	   -- 해결
	2. 신고 리스트 불러오는 과정(신고ID 포함해서 가져오기)
	   --
	3. 신고 리스트 뿌리는 과정
	   -- 3번이랑 같이 대충 구성한 듯
	4. 신고 분류 필터 값 넘기는 과정
	   -- 테스트는 못해봤고 구조 만듦
	5. 상태 필터 값 넘기는 과정
	   -- 테스트는 못해봤고 구조 만듦
	6. 번호 정렬 기준 넘기는 과정
	   -- 테스트는 못해봤고 구조 만듦
	7. 발생일 정렬 기준 넘기는 과정
	   -- 테스트는 못해봤고 구조 만듦
	8. 4~7번 복합 조건을 스프링 쪽으로 넘기는 과정
	   -- 넘어가길 기도. 제발..
	9. 복합 조건을 String에 저장 후 계속 넘기고 받기.
	   -- session 이용으로 대체.
	10. AJAX로 정렬 조건이 실시간으로 바뀌는 것.
	    -- 틀 짜놓은거 되길 기도 함.
	*. 정렬 초기화 버튼 생성
	   -- 끝
	12. 하단 번호 클릭시 노출되는 것이 바뀌게 AJAX
	    -- 대충 구조만...
	13. 닫기 버튼 클릭 시 신고 발생 화면으로
	    -- 구조만. 나중에 주소 넣어줘야함. 
	*. 각 글에서 번호, 신고분류, 신고자, 발생일, 상태를 누르면 해당 글 정보(신고ID 보내기)를 가지고 ReportDetail로 이동
	   -- 한 듯?
	15. 글 클릭할 때, 복합조건 값 같이 넘겨주기
	    -- 팝업이라 뭐... 딱히...
	16. 글 클릭할 때, 돌아가야할 페이지(ReportList) 어디인지 알려주는 값 같이 넘겨주기
	    -- 세션으로 해결된거 아닐까?
	
-->

<body>

<!-- # 페이지 설명
	   관리자가 등록된 신고사항을 리스트로 조회하는 페이지 -->
	   
<!-- 제목 -->	   
<div>
	<h1>관리자</h1>
	<hr>
</div>

<div class="container">
	<!-- 부제목 -->
	<div>
		<h3>신고 내역 조회</h3>
	</div>
	
	
	<!-- 신고 내역 테이블 -->
	<div>
		<button type="button" id="resetSortingBtn">정렬 초기화</button>
	</div>
	<table class="table table-bordered">
		<!-- 문의 내역 헤더 -->
		<thead>
			<tr>
				<th>
					<div>번호</div>
				</th>
				<th>
					<div>신고 분류</div>
					<!-- 정렬 기능 -->
					<!-- 기본값 버튼 >> 게시글 버튼 >> 참여자 버튼 >> 기본값 버튼...-->
					<div class="sorting" id="sortType">
						<!-- 조건이 없는 처음 상태 -->
						<button type="button" value="type">
							<span class="">기본</span>
						</button>
						<!-- 신고 분류가 '게시글'인 것만 노출하는 버튼 -->
						<button type="button" value="type REVIEW">
							<span class="">게시글</span>
						</button>
						<!-- 신고 분류가 '참여자'인 것만 노출하는 버튼 -->
						<button type="button" value="type PARTICI">
							<span class="">참여자</span>
						</button>
					</div>
				</th>
				<th><div>신고자</div></th>
				<th>
					<div>발생일</div>
					<!-- 정렬 기능 -->
					<!-- 버튼을 누를 때마다 나타나는 정렬 버튼이 바뀜 -->
					<!-- 오름차순 버튼 >> 내림차순 버튼 >> 기본값 버튼 >> 오름차순...-->
					<div class="sorting" id="sortDate">
						<!-- 정렬 조건없는 처음 상태로 -->
						<button type="button" value="orderBy">
							<span class="glyphicon glyphicon-sort"></span>
						</button>
						<!-- 오름차순 조건 버튼 -->
						<button type="button" value="orderBy ASC">
							<span class="glyphicon glyphicon-arrow-up"></span>
						</button>
						<!-- 내림차순 조건 버튼 -->
						<button type="button" value="orderBy DESC">
							<span class="glyphicon glyphicon-arrow-down"></span>
						</button>
					</div>
				</th>
				<th>
					<div>상태</div>
					<!-- 정렬 기능 -->
					<!-- 대기 버튼 >> 승인 버튼 >> 허위 버튼 >> 반려 버튼 >> 기본값 버튼 >> 대기...-->
					<div class="sorting" id="sortStatus">
						<!-- 조건이 없는 처음 상태 -->
						<button type="button" value="status">
							<span class="">기본</span>
						</button>
						<!-- 상태가 '대기'인 것만 노출하는 버튼 -->
						<button type="button" value="status WAIT">
							<span class="">대기</span>
						</button>
						<!-- 상태가 '승인'인 것만 노출하는 버튼 -->
						<button type="button" value="status APPROVE">
							<span class="">승인</span>
						</button>
						<!-- 상태가 '허위'인 것만 노출하는 버튼 -->
						<button type="button" value="status PUNISH">
							<span class="">허위</span>
						</button>
						<!-- 상태가 '반려'인 것만 노출하는 버튼 -->
						<button type="button" value="status RETURN">
							<span class="">반려</span>
						</button>
					</div>
				</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="rep" items="${list }">
				<tr class="report">
					<td><div>
						${ rep.num}
						<input type="hidden" value="${rep.r_id}"/>
					</div></td>
					
					<c:choose>
						<c:when test="${rep.report_type eq'REVIEW' }">
							<td><div>맛집 후기 신고</div></td>
						</c:when>
						<c:otherwise>
							<td><div>비매너 참여자 신고</div></td>
						</c:otherwise>
					</c:choose>
					<td><div>${rep.user_id}( 
						<c:choose>
							<c:when test="${rep.nickname eq''}">
								없음
							</c:when>
							<c:otherwise>
								${rep.nickname }
							</c:otherwise>
						</c:choose>)
					</div></td>
					<td><div>${rep.report_date}</div></td>
					<td><div>
						<button type="button">
							<span>
								<c:choose>
									<c:when test="${rep.status_id eq 1 }">
										승인
									</c:when>
									<c:when test="${rep.status_id eq 2 }">
										허위
									</c:when>
									<c:when test="${rep.status_id eq 3 }">
										반려
									</c:when>
									<c:otherwise>
										대기
									</c:otherwise>
								</c:choose>
							</span>
						</button>
					</div></td>	
				</tr>														
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 각 페이지로 가는 버튼 -->
	<div class="pageNavigation">
		<div>
			<span><button type="button" class="btn btn-default jumpBtn" value="${prevPage }">이전</button></span>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<span>
					<button type="button" class="btn btn-default numberBtn"
					value="${i}">${i}</button>
				</span>
			</c:forEach>
			<span><button type="button" class="btn btn-default jumpBtn" value="${nextPage }">다음</button></span>
		</div>
	</div>
	<br />
	
	<!-- 이전 페이지로 돌아가거나, 현재 창을 닫는 버튼 -->
	<div>
		<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</div>
</div>

<br /><br />


</body>
</html>