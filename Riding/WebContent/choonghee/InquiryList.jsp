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
<title>문의 내역 조회</title>
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
		// 최초 세션 페이지 조건 초기화
		sessionStorage.setItem("page", 1);
		
		// 최초 정렬 조건 초기화
		resetSorting();
				
		// 최초 리스트 불러오기
		ajaxList();
		
		// 최초 이동 페이지 불러오기
		ajaxPage();
		
		// 문의 글을 눌렀을 때, 문의 상세 내역 창 팝업
		$(".inquiry").on("click", function()
		{
			var inquireId = $(this).children("td:eq(0)").children().html();
			
			window.open("InquiryDetail.jsp?inquireId="+inquireId, "문의 상세 내역", "width=700, height=500");
			// window.open("inquirydetail.do?inquireId="+inquireId, "문의 상세 내역", "width=700, height=500");
		});
		
		/* 정렬 버튼 순환*/
		$(".sorting").on("click", function()
		{
			var sorting = $(this).children(":visible").next();
			if ( $(this).children(":visible").next().length == 0 )
				sorting = $(this).children(":first");
			
			$(this).children("button").css("display", "none");
			sorting.css("display", "");
			
			// 오름차순-내림차순 정렬
			if (sorting.val().includes("INQUIRE"))
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
			// 이동할 페이지 정보 저장
			var page = Number($(this).html());
			sessionStorage.setItem("page", String(page));
			
			$(".numberBtn").removeClass("active");
			$(this).addClass("active");
			
			// 페이지 리스트 다시 출력
			ajaxList();
		});
		
		/* 페이지 점프 버튼 클릭 */
		$(".jumpBtn").on("click", function()
		{
			// 이동할 페이지 정보 저장
			var page;
			if ( $(this).html() == '이전' )
				page = parseInt(Number($(".numberBtn:first").html()) / 5);
			else
				page = parseInt(Number($(".numberBtn:first").html()) / 5) + 1;
			
			sessionStorage.setItem("page", page);
			
			if (page == 0)
				sessionStorage.setItem("page", 1);
			
			// 페이지 리스트 다시 출력
			ajaxList();
			ajaxPage();
		});
		
		/* 돌아가기 or 닫기 버튼 */
		$("#cancelBtn").on("click", function()
		{
			$(location).attr("href", "url");
		});
	});
	
	// 정렬 초기화
	function resetSorting()
	{
		// 세션에 저장해놓은 정보 초기화
		sessionStorage.setItem("condition", "");
		sessionStorage.setItem("where", "");
		
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
		var domain = cond.split(" ")[0];
		var orderBy = cond.split(" ")[1] != null ? cond.split(" ")[1] : "";
		sessionStorage.setItem(domain, orderBy);
		
		var condition = sessionStorage.getItem("condition");
		
		// 조건 문장에, 새로 들어온 조건이 이미 있었다면
		// ex) domain이 ID, condition = "ID ASC, DATE DESC".
		if ( condition.includes(domain) )
		{
			// 조건 문장을 쪼개 놓음.  ID ASC, DATE DESC >>  ['ID', 'ASC,', 'DATE', 'DESC'];
			var arrayCond = condition.split(" ")
			
			// 새 입력 조건에 오름차순, 내림차순 조건이 없다면
			// ex) domain은 ID인데 orderBy가  ""로 없음
			if ( orderBy === "")
			{
				// ex) domain은 ID인데, condition이 ['ID', 'ASC,', 'DATE', 'DESC']인 경우
				if (condition[0].includes(domain))
				{
					condition = arrayCond[2] + " " + arrayCond[3];
				}
				// ex) domain은 ID인데, condition이 ['DATE', 'DESC,', 'ID', 'ASC' ]인 경우
				else if(condition[2].includes(domain))
				{
					condition = arrayCond[0] + " " + arrayCond[1].replace(',', '');
				}
			}
			// 새 조건에 오름차순, 내림차순 조건이 있다면
			// ex) domain은 ID인데 orderBy가  "ASC" 혹은 "DESC"로 존재
			else
			{
				// 조건 문장에 새 조건을 이미 포함하고 있는데, 앞에 있다면
				// condition이 ['ID', 'ASC,', 'DATE', 'DESC']인데 domain이 ID.
				if (condition[0].includes(domain))
				{
					// ['ID', 'ASC,', 'DATE', 'DESC'] 에서 ID ASC 변경
					// ['ID', 'DESC,', 'DATE', 'DESC'] << 변경 후
					arrayCond[1] = orderBy + ",";
					
					condition = arrayCond.join(' ');
				}
				// 조건 문장에 새 조건을 이미 포함하고 있는데, 뒤에 있다면 
				// condition이 ['ID', 'ASC,', 'DATE', 'DESC']인데 domain이 DATE 인 경우.
				else if(condition[2].includes(domain))
				{
					// ['ID', 'ASC,', 'DATE', 'DESC'] 에서 DATE DESC 변경
					// ['ID', 'ASC,', 'DATE', 'ASC'] << 변경 후
					arrayCond[3] = orderBy;
					
					condition = arrayCond.join(' ');
				}
			}
		}
		// 조건 문장에, 새로 들어온 조건이 없다면
		// domain이 ID인데,   condition = "DATE DESC".
		else
		{
			// 조건 문장 뒤에 새로운 조건 추가
			condition += " " + cond;
		}
		sessionStorage.setItem("condition", condition);
		
		ajaxList();
		ajaxPage();
	}
	
	// 상태 조건 설정
	function setWhere(where)
	{
		if(where == 'WAITING')
			sessionStorage.setItem("where", 'WAITING');
		else if(where == 'SOLVED')
			sessionStorage.setItem("where", 'SOLVED');
		else if(where == 'RETURNED')
			sessionStorage.setItem("where", 'RETURNED');
		else
			sessionStorage.setItem("where", "");
		
		ajaxList();
		ajaxPage();
	}
	
	// ajax 이용. 문의 리스트 불러오기
	function ajaxList()
	{
		// where 및 order by 조건 추가.
		var params;
		var page = sessionStorage.getItem("page");
		var condition = sessionStorage.getItem("condition");
		var where = sessionStorage.getItem("where");
		
		if (condition == "")
			params = "page="+page + "&condition=0";
		else
			params = "page="+page + "&condition=" + condition;
		
		if (where == "")
			params += "&where=0";
		else
			params += "&where="+where;
		
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
					out += '<tr class="inquiry">'
					
					out += '<td><div>'+list.inquireId+'</div></td>';
					out += '<td><div>'+list.inquireTitle+'</div></td>';
					out += '<td><div>'+list.userId+'('+list.nickname+')'+'</div></td>';
					out += '<td><div>'+list.inquireDate+'</div></td>';
					out += '<td><div>';
					out += '<button type="button"><span>'
							+ list.inquireProcess + '</span></button>';
					out += '</div></td>';
					
					out += '</tr>'
				});
				
				$("tbody").append(out);
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
		*/
	}
	
	// ajax 이용. 페이지 리스트 불러오기
	function ajaxPage()
	{
		var page = sessionStorage.getItem("page");
		var condition = sessionStorage.getItem("condition");
		var where = sessionStorage.getItem("where");
		
		if (condition == "")
			params = "page="+page + "&condition=0";
		else
			params = "page="+page + "&condition=" + condition;
		
		if (where == "")
			params += "&where=0";
		else
			params += "&where="+where;
		
		/* 
		$.ajax(
		{
			type:"POST"
			, url: url
			, data: params
			, dataType:"json"
			, success:function(list)
			{
				var out = "";
				
				out += '<span><a href="#" class="btn btn-default jumpBtn">이전</a></span>';
				
				for(var i=list.startNum; i<=list.maxNum; i++)
				{
					if (Number(page) == Number(i))
						out += '<span><a href="#" class="btn btn-default numberBtn active">'+i+'</a></span>'
					else
						out += '<span><a href="#" class="btn btn-default numberBtn">'+i+'</a></span>'
				}				
				
				if( Boolean(list.hasNext) == true)
					out += '<span><a href="#" class="btn btn-default jumpBtn">다음</a></span>';
				
				$("div.pageNavigation").append(out);
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
	*. div >> 부트스트랩 table로 변경
	   -- 해결
	2. 문의 리스트 불러오는 과정(문의ID 포함해서 가져오기)
	   -- 
	3. 문의 리스트 뿌리는 과정
	   -- 2번이랑 같이 대충 구성한 듯?
	4. 상태 필터 값 넘기는 과정
	   -- 테스트 못해보고, 대충 구조 만듦
	5. 번호 정렬 기준 넘기는 과정
	   -- 테스트 못해보고, 대충 구조 만듦
	6. 작성일 정렬 기준 넘기는 과정
	   -- 테스트 못해보고, 대충 구조 만듦
	7. 4~6번 복합 조건을 스프링 쪽으로 넘기는 과정
	   -- 넘어가겠지?.... 테스트해보긴 해야함.
	8. 복합 조건을 String에 저장 후 계속 넘기고 받기.
	   -- session 이용
	9. AJAX로 정렬 조건이 실시간으로 바뀌는 것.
	   -- AJAX로 보내니까 되지 않을까?...
	*. 정렬 초기화 버튼 생성
	   -- 완성!
	11. 하단 번호 클릭시 노출되는 것이 바뀌게 AJAX
	    -- 대충 구조 완성..
	12. 닫기 버튼 클릭 시 Manager.jsp으로 
	    -- 구조만. 나중에 주소 넣어줘야함.
	*. 각 글에서 번호, 제목, 작성자, 작성일, 상태를 누르면 해당 글 정보(문의ID 보내기)를 가지고 InquiryDetail로 이동
	   -- 해결
	14. 글 클릭할 때, 복합조건 값 같이 넘겨주기
	    -- 팝업으로 할 거라 그럴 필요 없을 듯....
	
-->

<body>

<!-- # 페이지 설명
	   관리자가 등록된 문의사항을 리스트로 조회하는 페이지 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>문의 내역 조회</h3>
</div>
<br />
<div>
	<button type="button" id="resetSortingBtn">정렬 초기화</button>
</div>
<br />
<!-- 문의 내역 테이블 -->
<div>
	<table class="table table-bordered">
		<!-- 문의 내역 헤더 -->
		<thead>
			<tr>
				<th>
					<div>번호</div>
					<!-- 정렬 기능 -->
					<!-- 버튼을 누를 때마다 나타나는 정렬 버튼이 바뀜 -->
					<!-- 오름차순 버튼 >> 내림차순 버튼 >> 기본값 버튼 >> 오름차순...-->
					<div class="sorting" id="sortId">
						<!-- 정렬 조건없는 처음 상태로 -->
						<button type="button" value="INQUIREID">
							<span class="glyphicon glyphicon-sort"></span>
						</button>
						<!-- 오름차순 조건 버튼 -->
						<button type="button" value="INQUIREID ASC">
							<span class="glyphicon glyphicon-arrow-up"></span>
						</button>
						<!-- 내림차순 조건 버튼 -->
						<button type="button" value="INQUIREID DESC">
							<span class="glyphicon glyphicon-arrow-down"></span>
						</button>
					</div>
				</th>				
				<th><div>제목</div></th>
				<th><div>작성자ID(닉네임)</div></th>
				<th>
					<div>작성일</div>
					<!-- 정렬 기능 -->
					<div class="sorting" id="sortDate">
						<button type="button" value="INQUIREDATE">
							<span class="glyphicon glyphicon-sort"></span>
						</button>
						<button type="button" value="INQUIREDATE ASC">
							<span class="glyphicon glyphicon-arrow-up"></span>
						</button>
						<button type="button" value="INQUIREDATE DESC">
							<span class="glyphicon glyphicon-arrow-down"></span>
						</button>
					</div>
				</th>	
				<th>
					<div>상태</div>
					<!-- 정렬 기능 -->
					<!-- 대기 버튼 >> 해결 버튼 >> 반려 버튼 >> 기본값 버튼 >> 대기...-->
					<div class="sorting" id="sortProcess">
						<!-- 조건이 없는 처음 상태 -->
						<button type="button" value="">
							<span class="">기본</span>
						</button>
						<!-- 상태가 '대기'인 것만 노출하는 버튼 -->
						<button type="button" value="WAITING">
							<span class="">대기</span>
						</button>
						<!-- 상태가 '해결'인 것만 노출하는 버튼 -->
						<button type="button" value="SOLVED">
							<span class="">해결</span>
						</button>
						<!-- 상태가 '반려'인 것만 노출하는 버튼 -->
						<button type="button" value="RETURNED">
							<span class="">반려</span>
						</button>
					</div>
				</th>
				
			</tr>
		</thead>
		<!-- 문의 리스트 출력 -->
		<!-- 해당 문의 글을 클릭하면 문의 상세 내역으로 넘어감 -->
		<tbody>
			<tr class="inquiry">
				<td><div>4</div></td>
				<td><div>문의다</div></td>
				<td><div>1135(나문의)</div></td>
				<td><div>2033/05/31</div></td>
				<td>
					<div>
						<button type="button">
							<span>대기</span>
						</button>
					</div>
				</td>
			</tr>
			<tr class="inquiry">
				<td><div>3</div></td>
				<td><div>문희다</div></td>
				<td><div>1235(나문희)</div></td>
				<td><div>2033/04/30</div></td>
				<td>
					<div>
						<button type="button">
							<span>해결</span>
						</button>
					</div>
				</td>
			</tr>
			<tr class="inquiry">
				<td><div>2</div></td>
				<td><div>이 편지는</div></td>
				<td><div>900(행문의편지)</div></td>
				<td><div>2033/03/31</div></td>
				<td>
					<div>
						<button type="button">
							<span>반려</span>
						</button>
					</div>
				</td>
			</tr>
			<tr class="inquiry">
				<td><div>1</div></td>
				<td><div>복수다</div></td>
				<td><div>1532(사문의복수를하러왔다)</div></td>
				<td><div>2033/02/28</div></td>
				<td>
					<div>
						<button type="button">
							<span>반려</span>
						</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<br /><br />

<!-- 각 페이지로 가는 버튼 -->
<div class="pageNavigation">
	<span><a href="#" class="btn btn-default jumpBtn">이전</a></span>
	<span><a href="#" class="btn btn-default numberBtn">1</a></span>
	<span><a href="#" class="btn btn-default numberBtn">2</a></span>
	<span><a href="#" class="btn btn-default numberBtn">3</a></span>
	<span><a href="#" class="btn btn-default numberBtn">4</a></span>
	<span><a href="#" class="btn btn-default numberBtn">5</a></span>
	<span><a href="#" class="btn btn-default jumpBtn">다음</a></span>
</div>
<br />

<!-- 이전 페이지로 돌아가거나, 현재 창을 닫는 버튼 -->
<div>
	<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
	<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
</div>

</body>
</html>