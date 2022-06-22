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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>수정/삭제하려는 맛집 찾기</title>
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
		
		// 주소 리스트 부분 출력 안되게 초기화
		$(".restaurantList").css("display", "none");
		
		/* 주소 검색 ↔ 지도검색 클릭할 때마다 서로 바뀜 */
		$(".searchBtn").on("click", function()
		{
			$(".searchBtn").toggleClass("active");
			$(".searchBtn[disabled='disabled']").removeAttr("disabled");
			$(this).attr("disabled", "disabled");
			
			// 주소 검색 영역 활성화 ↔ 지도 검색 영역 활성화
			displaySearch();
		});
		
		// 주소 리스트 ajax 처리
		$("#textSearch").on("keyup", function()
		{
			var search = $(this).val();
			
			if (search.replace(" ", "") == "")
			{
				$(".restaurantList").css("display", "none");
			}
			else
			{
				$(".restaurantList").css("display", "");
			}
			
			/* 유효성 검사 필요하면 */
			
			
			// 검색 조건
			var condition =	$('input[name="searchType"]:checked').val();
			/* ajax 처리 */
			ajaxList(search, condition);
		});
		
		// 주소 선택하고, 원래 창으로...
		$(".chooseBtn").on("click", function()
		{
			var id = $(this).val();
			
			var parent = $(this).parent().parent();
			var name = parent.children('td:eq(0)').html();
			var address = parent.children('td:eq(1)').html();
			var detail = parent.children('td:eq(2)').html();
			var x = parent.children('td:eq(3)').html();
			var y = parent.children('td:eq(4)').html();
			
			opener.receiveInfo(id, name, address, detail, x, y);
			
			self.close();
		});
		
		$("#cancleBtn").on("click", function()
		{
			self.close();
		});
	});

	/* 검색 도구 선택적으로 보여주기 */
	function displaySearch()
	{
		if ($("#searchAddr").hasClass("active"))
		{
			$("div.searchAddr").css("display", "");
			$("div.searchMap").css("display", "none");
			//$(".restaurantList").css("display", "none");
		} else if ($("#searchMap").hasClass("active"))
		{
			$("div.searchAddr").css("display", "none");
			$("div.searchMap").css("display", "");
			$(".restaurantList").css("display", "none");
				
		}
	}
	
	// 주소 리스트 출력하는 AJAX
	function ajaxList(search, condition)
	{
		var url = "";
		var params = "keyword=" + search 
				+ "&condition=" + condition;
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
				

				out += "<thead>";
				out += "<tr>"
				out += "<th>가게명</th>"
				out += "<th>주소</th>"
				out += "<th>상세주소</th>"
				out += "<th>선택버튼</th>"
				out += "</tr>"
				out += "</thead>";
				
				out += "<tbody>";
				
				lists.forEach(function(list)
				{
					var id = list.id;
					var name = list.name;
					var coordinateX = list.coordinateX;
					var coordinateY = list.coordinateY;
					
					// 좌표 x, y >> 주소 변환
					    주소 변환 과정 이러쿵 저러쿵....
					//
					var address;
					var addressDetail;
					
					out += "<tr>"
					out +=	"<td>"+name"</td>"
					
					out +=  "<td>"+address+"</td>"
					out +=  "<td>"+addressDetail+"</td>"
					out +=  "<td style='display:hidden;'>"+coordinateX+"</td>"
					out +=  "<td style='display:hidden;'>"+coordinateY+"</td>"
					out +=  "<td>"+"<button type='button' class='chooseBtn' val="+id+">"+"</button></td>";
					out += "</tr>"
					
				});
				

				out += "</tbody>"
				$("div.restaurantList table").append(out);
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
	*. 양식 뜯어고치기
	   -- 구조만 완성.
	2. 주소 입력창 및 리스트 출력 구성
	   -- 어느 정도...
	3. 리스트 출력을 위한 AJAX 구성
	   -- 어느 정도...
	4. 지도에서 마커 선택
	   -- 기다리는 중...

	
 
-->

<body>

<!-- # 페이지 설명
	   관리자가 등록된 맛집을 검색하고, 선택한 맛집을 수정/삭제 대상으로 지정하는 페이지 -->

<!-- 제목 -->	   
<div>
	<h1>맛집 검색</h1>
</div>
<br />

<!-- 직접 주소 입력으로 주소를 검색할지, 지도를 통해 검색할지 선택하는 버튼 -->
<div>
	<button type="button" id="searchAddr" class="btn btn-default searchBtn" value="주소">주소 검색</button>
	<button type="button" id="searchMap" class="btn btn-default searchBtn" value="지도">지도 검색</button>
</div>

<br />

<div>
	<form action="" class="form-horizontal" style="width:500px;">
		
		<div class="form-group">
			<div class="searchAddr">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="" class="col-sm control-label">주소 입력</label>
				<div class="radio">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="restaurantName">
						<input type="radio" id="restaurantName" name="searchType" value="name"/>가게명
					</label>
					&nbsp;
					<label for="restuarantAddr">
						<input type="radio" id="restuarantAddr" name="searchType" value="addr"/>주소	
					</label>
				</div>
				<div class="clickSearchAddr">
					<div class="col-sm">
						<input type="text" id="textSearch" class="form-control" placeholder="키워드 입력" />
					</div>
				</div>
			</div>
			<div class="restaurantList">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>가게명</th>
							<th>주소</th>
							<th>상세주소</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>맛잇쪙</td>
							<td>사랑시 고백구 행복동</td>
							<td>차였어 506호</td>
							<td>
								<button type="button" class='chooseBtn' value="5">선택</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<br /><br />			
			<div class="searchMap">&nbsp;&nbsp;&nbsp;&nbsp;지도 들어가는 공간</div>
		</div>
		<!-- 주소 입력이든, 지도 선택이든 주소 자동입력 부분에 해당 주소가 입력된다. -->
		<div class="form-group">	
			<br />
			<div class="col-sm-12">
				<input type="text" id="address" placeholder="해당 주소 자동입력 부분" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			
			<div class="col-sm-8">
				<input type="text" id="addressDetail" placeholder="상세주소 직접입력 부분" class="form-control"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8">
				<!-- 취소 버튼: 현재 페이지를 닫기. (이전 페이지로) -->
				<button type="button" id="cancleBtn" class="btn btn-default btnCancel">취소</button>
			</div>
		</div>
	</form>
</div>


</body>
</html>