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
<title>회원 패널티 관리 페이지</title>
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
		/* 회원 검색 창을 눌렀을 때 */
		$("#searchUser").on("click", function()
		{
			popUpSearchUser();
		});
		
		/* 수정 버튼 눌렀을 때 */
		$(".updateBtn").on("click", function()
		{
			/* 회원 검색이 이루어지지 않았다면, 회원 검색부터 */
			if ( $('#userId input').val() == "" )
			{
				//alert("유저 검색부터 하슈");
			}
			else
			{
				//alert("오케이");
				/* 패널티 수정 창으로 */
				var url = "UserPenaltyUpdateForm.jsp";
				var param = "?id=" + $(this).val();
				
				window.open(url+param, "", "width=500, height=500");
			}
			
		});
		/* 닫기 or 돌아가기 버튼 눌렀을 때 */
		$("#backBtn").click(function()
		{
			/* 
			window.close(); 맞나? 여하튼 닫거나
			이전 페이지로 location.href= 'url'					
			*/
		});
	});

	/* 회원 검색 창으로 */
	function popUpSearchUser()
	{
		var url = "SearchUser.jsp";
		
		window.open(url, "", "width=500, height=500");
		/* 
		https://pjsprogram.tistory.com/8  -- spring ajax 처리 참조 링크		
		*/
	}
	
	/* 유저가 받은 패널티 정보 불러오기 */
	function loadUserInfo(userId, userNick)
	{
		$("#userId").text("회원ID: " + userId);
		$("#userNick").text("닉네임: " + userNick);
		
		$(".updateBtn").css("display", "");
		
		/* 패널티 목록 ajax로 불러오고, table에 붙이는 과정 */
		/*
		var params = "id=" + userid;
		
		$.ajax(
		{
			type:"POST"
			, url:"패널티목록 구해올 url"
			, data: {
				id: userId
			}
			, dataType:"json"
			, success:function(lists)
			{
				var out = "";
				
				lists.forEach(function(list)
				{
					var id = list.id;
					var auto = list.auto;
					var type = list.type;
					var startDate = list.startDate;
					var endDate = list.endDate;
					var theRest = list.theRest;
					
					out += "<tr>";
					out += "<td style='display:none;'>";
					out += "<input type='hidden' value='"+id+"' />";
					out += "</td>";
					
					out += "<td style='display:none;'>";
					out += "<input type='hidden' value='"+auto+"' />";
					out += "</td>";
					
					out += "<td style='display:none;'>";
					out += "<input type='hidden' value='"+theRest+"' />";
					out += "</td>";
					
					out += "<td>"+ type + "</td>";
					out += "<td>"+ startDate + "</td>";
					out += "<td>"+ endDate + "</td>";
					out += "<td>";
					
					out += "<button class='updateBtn'"
							+" type='button' value='"+id+"'>수정</button>";
							 
					out += "<button class='deleteBtn'"
							+" type='button' value='"+id+"'>삭제</button>";
					
					out += "</td>";
					
					out += "</tr>";
				});
				
				$('#table').append(out);
			}
			, error:function(e)
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
    *. div >> 부트스트랩 table
       -- 해결
     
	*. 회원 검색칸 or 검색 버튼 클릭 시 SearchUser 페이지 새 창 등장. 이 때 현재 페이지가 어디인지 같이 넘겨준다.
	   -- 어디인지 넘길 필요는 없었고, 해결
	   
	*. SearchUser 페이지에서 회원 ID 넘어온 것 받기.
	   -- 약식 구현
	
	*. 왼쪽 상단의 ID, 닉네임 값 AJAX로 표현
	   -- AJAX는 안 써도 되어서 안 씀.
	   
	*. 회원ID를 통해 패널티 리스트 출력. AJAX로 구현. 패널티 리스트 view 필요.
	   -- 대충 ajax만 구성
	    
	5. 이 때, view는 이 때 수동이면 수동, 자동이면 자동이라는 컬럼 추가한 view.
	   -- 일단 auto 있다고 하고, 로직 짜놨음
	   
	6. 이 때, view는 남은 기간 attribute 추가한 view. 테이블에 남은 기간 컬럼 추가
	   -- 일단 theRest 있다고 하고, 로직 짬
	
	7. 수정 버튼 클릭 시 UserPenaltyUpdateForm 새 창 등장
	   -- nope...
	
	8. 이 때, 패널티적용ID + 자동 or 수동 값을 넘겨준다.
	   -- nope........
	   
	9. 삭제 버튼 클릭 시, confirm 창을 통해 확인 후 삭제한다. 이 때 패널티적용ID + 자동 or 수동 값을 통해 삭제한다.
	   -- nope.........
	
	10. 패널티 생성 버튼 클릭 시, UserPenaltyInsertForm 새 창이 나타난다.
	   -- nope.........
		
	11. 이 때, 현재 회원 ID를 같이 넘겨준다.
	   -- nope.......
	   
	12. 닫기 or 돌아가기 버튼 클릭시 Manager.jsp로 돌아간다.
	
	13. 패널티 생성 버튼은 검색한 회원 ID가 넘어왔을 때만 보인다.
	   -- nope.....
	
-->

<body>
<!-- # 페이지 설명
	   회원을 검색하고, 선택한 회원의 패널티 조회 및 수정 -->

<!-- 제목 -->
<div>
	<h1>관리자</h1>
	<hr>
</div>

<!-- 부제목 -->
<div>
	<h3>회원 패널티 관리</h3>
</div>

<!-- 회원 검색 후 회원을 선택했을 때, 해당 회원의 아이디와 닉네임 노출되는 곳 -->
<!-- 밑의 div와 같은 line에 노출. block 단위 -->
<div>
	<span id="userId">
		ID: &nbsp;&nbsp;
	</span>
	&nbsp;/&nbsp;&nbsp;
	<span id="userNick">
		닉네임 : &nbsp;&nbsp;
	</span>
</div>

<!-- 회원 검색. input 칸이나 검색 버튼을 누르면 회원 검색 페이지(SearchUser) 팝업 -->
<div>
	<span id="searchUser">
		<input type="text" placeholder="회원 검색"/>
		<button type="button">검색</button>
	</span>
</div>

<!-- 검색한 회원을 선택했을 때, 해당 회원의 패널티 관련 정보가 노출되는 곳 -->
<table id="table" class="table table-bordered">
	<tr>
		<th>패널티 종류</th>	
		<th>시작 날짜</th>	
		<th>종료 날짜</th>
		<th>옵션</th>	
	</tr>
	<tr>
		<td style="display:none;">
			<input type="hidden" value="" />
		</td>
		<td>종류</td>
		<td>시작일</td>
		<td>종료일</td>
		<td>
			<!-- 버튼 클릭 시 패널티 수정 페이지 팝업 -->
			<button style="display:none;" class="updateBtn" type="button" value="jstlcorevalue">수정</button>
			<!-- 버튼 클릭 시 패널티 -->
			<button style="display:none;" class="deleteBtn" type="button" value="jstlcorevalue">삭제</button>
		</td>
	</tr>
</table>


<br />
<!-- 패널티 생성 폼으로 이동 -->
<div>
	<button type="button">패널티 생성</button>
</div>
<br />


<!-- 패널티 관리 페이지를 닫거나, 이전 페이지로 돌아감 -->
<div>
	<button type="button">
		돌아가기 or 닫기
	</button>
</div>
</body>
</html>