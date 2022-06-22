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
<title>시설 수정/삭제 폼</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script type="text/javascript">

	$(function()
	{
		/* 최초 실행, 주소 검색 버튼 활성화 */
		$("#searchAddr").addClass("active").attr("disabled", "disabled");
		
		// 최초 주소 검색 영역 활성화
		displaySearch();
		
		/* 주소 검색 ↔ 지도검색 클릭할 때마다 서로 바뀜 */
		$(".searchBtn").on("click", function()
		{
			$(".searchBtn").toggleClass("active");
			$(".searchBtn[disabled='disabled']").removeAttr("disabled");
			$(this).attr("disabled", "disabled");
			
			// 주소 검색 영역 활성화 ↔ 지도 검색 영역 활성화
			displaySearch();
			
		});
		
		/* 수정하려는 시설 찾기 */
		$(".searchFacility").on("click", function()
		{
			window.open("SearchFacilityForm.jsp", "시설 찾기", "width=700, height=500");
		});
		
		/* 시설 등록 화면으로 전환 */
		$("#toggleInsertBtn").on("click", function()
		{
			$(location).attr("href", "FacilityInsertForm.jsp");
		});
		
		/* 수정 버튼 클릭 */
		$("#updateBtn").on("click", function()
		{
			/* 현재 작성자 ID 세션에서 불러오기 */
			// 임시로 세션 부여
			sessionStorage.setItem("id", 555);
			/* 관리자가 직접 등록이라, 요청자 = 승인자 */
			$("#hiddenInfo #userId").val(sessionStorage.getItem('id'));
			$("#hiddenInfo #userId2").val(sessionStorage.getItem('id'));
			
			$("#updateForm").submit();
		});
		
		/* 삭제 버튼 클릭 */
		$("#deleteBtn").on("click", function()
		{
			/* 현재 작성자 ID 세션에서 불러오기 */
			// 임시로 세션 부여
			sessionStorage.setItem("id", 555);
			/* 관리자가 직접 등록이라, 요청자 = 승인자 */
			$("#hiddenInfo #userId").val(sessionStorage.getItem('id'));
			$("#hiddenInfo #userId2").val(sessionStorage.getItem('id'));
			
			$("#updateForm").attr("action", "삭제url");
			$("#updateForm").submit();
		});
		
		$("#cancelBtn").on("click", function()
		{
			$(location).attr("href", "url");
		});
		
		/* 주소 검색 */
		/* https://postcode.map.daum.net/guide */
		$(".clickSearchAddr").on("click", function()
		{
			// 커서 빼기.(focus 삭제)
			$(this).blur();
			
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                    addr = addr + ' ' + extraAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('sample6_postcode').value = data.zonecode;
	                //document.getElementById("sample6_address").value = addr;
	                $("#facilityAddr").val(addr);
	                
	                // 주소를 좌표로 바꿔놓는다.
	                /*
	                
	                $("#coordinateX").val(x);
	                $("#coordinateY").val(y);
	                */	                
	                
	                // 커서를 상세주소 필드로 이동한다.
	                //document.getElementById("sample6_detailAddress").focus();
	                $("#facilityAddrDetail").val("");
	                $("#facilityAddrDetail").focus();
	            }
	        }).open();
		});
		
	});

	/* 검색 도구 선택적으로 보여주기 */
	function displaySearch()
	{
		if ($("#searchAddr").hasClass("active"))
		{
			$("div.searchAddr").css("display", "");
			$("div.searchMap").css("display", "none");
		} else if ($("#searchMap").hasClass("active"))
		{
			$("div.searchAddr").css("display", "none");
			$("div.searchMap").css("display", "");
				
		}
	}
	
	// SearchFacilityForm으로부터 시설 정보 받는 폼
	function receiveInfo(id, name, address, detail, x, y)
	{
		$("#facilityId").val(id);
		$("#facilityName").val(name);
		$("#facilityAddr").val(address);
		$("#facilityAddrDetail").val(detail);
		$("#coordinateX").val(x);
		$("#coordinateY").val(y);
		
	}
</script>

</head>

<!-- TODO -->
<!--  
	*. 등록 버튼 클릭 시, FacilityInsertForm으로 넘어갈 수 있도록
	   -- 달아주었다.
	2. 주소 검색 버튼 활성화일 땐, 주소 검색창 나오게 하기. 지도 페이지는 display:none
	   -- 해결
	3. 지도 검색 버튼 활성화일 땐, 지도 페이지 나오게 하기. 주소 검색창은 display:none
	   -- 해결
	4. 위치 검색 input 또는 위치 검색 버튼 클릭 시 SearchFacilityForm 페이지 새 창 등장.
	   -- ㅇㅋ
	*. SearchFacilityForm에서 값을 넘겨주었다면, 자동으로 시설 종류+ 기본 주소 입력. ID값은 hidden 저장
	   -- 입력완료
	*. 우체국? 주소 검색 API 찾아보기
	   -- api 찾음
	*. SearchPlace 페이지 생성
	   -- 필요 없음
	*. 주소 검색 input 클릭 시 SearchPlace 새 창 뜨게.
	   -- API로 해결
	*. 주소 검색 버튼 클릭 시 SearchPlace 새 창 뜨게
	   -- API로 해결
	*. AJAX로 주소 검색 값을 받아올 수 있게 설정
	   -- API로 해결 
	10. 지도에서 위치 선택 시, 마커로 표시되게.
	    -- 기다려요. API 사용법
	11. 지도에서 위치 선택 시, 해당 값이 주소 값으로 자동으로 입력되게 설정
	    -- 기다려요. API 사용법
	12. 수정 버튼 클릭 시, form 값이 DB로 넘어갈 수 있게 준비
	    -- 준비 해둠. 
	13. 취소 버튼 클릭 시, 관리자 페이지(Manager.jsp)로 갈 수 있게 설정
	    -- 준비 해둠.
	14. 삭제 버튼 클릭 시, 해당 form의 hidden ID 값을 통해 삭제
	    -- 준비 해둠.
 
-->

<body>

<!-- # 페이지 설명
	   관리자가 지도에 존재하는 시설을 직접 수정/삭제하는 폼 -->

<!-- 제목 -->
<div>
	<h1>시설 수정/삭제 폼</h1>
</div>

<!-- 수정/삭제 폼에서 등록 폼으로 전환 -->
<div>
	<button id="toggleInsertBtn" type="button" class="btn btn-success">등록으로 전환</button>
</div>
<br />

<!-- 직접 주소 입력으로 주소를 검색할지, 지도를 통해 검색할지 선택하는 버튼 -->
<div>
	<button type="button" id="searchAddr" class="btn btn-default searchBtn">주소 검색</button>
	<button type="button" id="searchMap" class="btn btn-default searchBtn">지도 검색</button>
</div>

<br />

<div>
	<!-- 시설 수정 폼 -->
	<form id="updateForm" action="updatefacility.action" method="post"
	class="form-horizontal" style="width:500px;">
		<!-- 수정하려는 시설 위치 검색 기능 -->
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">수정하려는 시설 위치</label>
			<!-- 텍스트 칸 or 검색 버튼 클릭 시, 시설 검색 창이 새로 뜬다. -->
			<div class="searchFacility">
				<div class="col-sm-4">
					<input type="text" class="form-control" placeholder="위치 검색">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-default">검색</button>
				</div>
			</div>
		</div>
	
		<!-- 시설 종류 선택. 수정 폼일 땐 비활성화 -->
		<!-- 검색한 시설을 선택하였을 때 자동입력됨 -->
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">시설 종류</label>
			<div class="col-sm-4" >
				<input type="text" id="facilityName" class="form-control"
				readonly="readonly" placeholder="자동 입력 부분" value=""/>
			</div>
		</div>
		
		<!-- 주소 검색 버튼이 활성화일 때, 주소 검색 기능이 노출된다. -->
		<!-- 지도 검색 버튼이 활성화일 때, 주소 검색 기능은 노출되지 않고, 지도 기능만 출력된다. -->
		<div class="form-group">
			&nbsp;&nbsp;&nbsp;&nbsp;밑으로 주소입력 or 지도들어가는공간. 버튼따라 출력.
			<div class="searchAddr">
				<label for="" class="col-sm-4 control-label">변경할 주소</label>
				<div class="clickSearchAddr">
					<div class="col-sm-4">
						<input type="text" placeholder="주소 입력" class="form-control"/>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default">검색</button>
					</div>
				</div>
			</div>
			<br /><br />
			<div class="searchMap">&nbsp;&nbsp;&nbsp;&nbsp;지도 들어가는 공간</div>
		</div>
		<br />
		
		<!-- 주소 입력이든, 지도 선택이든 주소 자동입력 부분에 해당 주소가 입력된다. -->
		<div class="form-group">	
			<br />
			<div class="col-sm-12">
				<input type="text" id="facilityAddr" readonly="readonly" placeholder="해당 주소 자동입력 부분" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-8">
				<input type="text" id="facilityAddrDetail" placeholder="상세주소 직접입력 부분" class="form-control"/>
			</div>
		</div>
		
		<!-- 시설에 대한 hidden 정보 놓는 곳. 시설ID, x좌표, y좌표, 요청자, 요청처리자 -->
		<div id="hiddenInfo" class="form-group" style="display:hidden;">
			<input type="hidden" id="facilityId" value=""/>
			<input type="hidden" id="coordinateX" value=""/>
			<input type="hidden" id="coordinateY" value=""/>
			<input type="hidden" id="userId" value=""/>			
			<input type="hidden" id="userId2" value=""/>			
		</div>		
		
		<div class="form-group">
			<div class="col-sm-8">
				<!-- 수정 버튼: 시설 위치 수정 폼 제출 -->
				<button type="button" id="updateBtn" class="btn btn-warning">수정</button>
				<!-- 삭제 버튼: 시설 위치 삭제 폼 제출 -->
				<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
				<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
				<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
			</div>
		</div>
	</form>
</div>

</body>
</html>