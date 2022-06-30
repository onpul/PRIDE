<%@page import="com.test.riding.RidingDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	RidingDTO dto = (RidingDTO)request.getAttribute("riding");
	
	String start_day = dto.getStart_date().split(" ")[0];
	String start_time = dto.getStart_date().split(" ")[1];
	start_time = start_time.substring(0, start_time.length()-3 );
	
	String end_day = dto.getEnd_date().split(" ")[0];
	String end_time = dto.getEnd_date().split(" ")[1];
	end_time = end_time.substring(0, end_time.length()-3 );
	
	int ev_grade_id = dto.getEv_grede_id();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정</title>

<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- jquery UI -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"
	integrity="sha256-6XMVI0zB8cRzfZjqKcD01PBsAy3FlDASrlC8SxCpInY=" 
	crossorigin="anonymous"></script>

<!-- jqueryUI css -->
<link rel="stylesheet" href="https://releases.jquery.com/git/ui/jquery-ui-git.css">

<!-- timepicker css -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- timepicker js -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	//라이딩 시작 일시
 	$(document).ready(function()
	{
		//alert("확인");
				
		// 기간 선택 기능
		addDate();
				
		// 라이딩 스타일 최초 '제한없음' 선택으로 초기화
		//$(".riding-style input[value='0']").prop('checked', 'checked');
		
		$("#riding_name").on("keydown", function()
		{
			if(Number($(this).val().length) == 20)
				alert("20자 내로 입력해주세요.");
		});
				
		
		// 경유지 추가 버튼 눌렀을 때
		$(".pointBtn button:eq(0)").on("click", function()
		{
			// 경유지 2 개 이상부터는 삭제 버튼 생성
			if($("span.point").children("label").length >= 1)
				$(".pointBtn button:eq(1)").css("display", "");
			
			// 경유지 입력 추가하기
			if($("span.point").children("label").length < 5 )
			{
				var numIdx = $("span.point").children("label").length + 1;
				
				var str = "<br>";
				str +=		'<label class="point'+numIdx+'">경유지'+numIdx+' ';
				str +=			'<input type="text" class="txt" name="address" readonly="readonly"/> ';
				str +=			'<input type="text" class="txt" name="detail_address"/>';
				str +=			'<button type="button" class="searchMap" value="point'+numIdx+'">검색</button>';
				str += 			'<span class="hidden_point'+numIdx+'" style="display: none;"></span>'
				str +=		'</label>';
				 
				$("span.point").append(str);
				
				// 이벤트 다시 활성화
				$(".searchMap").on("click", function()
				{
					searchMap($(this).val());
				});	
			}	
		});
		
		// 경유지 삭제버튼 눌렀을 때
		$(".pointBtn button:eq(1)").on("click", function()
		{
			// 삭제 눌렀을 때
			if($("span.point").children("label").length > 1 )
			{
				$("span.point").children("label:last-child").remove();
				$("span.point").children("br:last-child").remove();
			}
			
			// 경유지 1개 남았을 때는 숨기기
			if($("span.point").children().length < 2)
				$(".pointBtn button:eq(1)").css("display", "none");
			
			setMarkers();
		})
			
		// 지도 검색 활성화
		$(".searchMap").on("click", function()
		{
			searchMap($(this).val());
		});
		
		// 제출 버튼 눌렀을 때
		$("#submitRiding").on("click", function()
		{
			checkSubmit();
		});
		
		
		$("#myRidingBtn").click(function()
		{
			//alert("확인");
			
			// 사용자의 라이딩 스타일 받아오기 전 모든 체크를 해제
			$("input:radio[name='sex_p_id']").prop("checked", false);
			$("input:radio[name='age_p_id']").prop("checked", false);
			$("input:radio[name='speed_id']").prop("checked", false);
			$("input:radio[name='step_id']").prop("checked", false);
			$("input:radio[name='eat_p_id']").prop("checked", false);
			$("input:radio[name='dining_p_id']").prop("checked", false);
			$("input:radio[name='mood_p_id']").prop("checked", false);
			
			// 사용자의 라이딩 스타일을 받아와 checked 적용
			myRidingCheck();
		});
	});
 	
	function checkSubmit()
	{
		// 라이딩 모임 이름 검사
		if ( $("#riding_name").val() === '' )
		{
			$("#riding_name").focus();
			alert("모임 이름을 입력해주세요.");
			return;
		}
		
		// 라이딩 기간 입력 여부 검사
		var check = false;
		$("input[name='riding_date']").each(function(index, item)
		{
			if (item.value === '')
			{
				check = true;
				return false;
			}				
		});
		if (check)
		{
			alert("라이딩 기간을 입력해주세요.");
			return;
		}
		
		// 모임 장소 입력 여부 검사
		if ( $("input[name=meet_lati]").length === 0 )
		{
			alert("모임 장소를 검색 버튼을 통해 입력해주세요.");
			return;
		}
		
		// 모임 출발 장소 입력 여부 검사
		if ( $("input[name=start_lati]").length === 0 )
		{
			alert("모임 출발 장소를 검색 버튼을 통해 입력해주세요.");
			return;
		}
		
		// 모임 종료 장소 입력 여부 검사
		if ( $("input[name=end_lati]").length === 0 )
		{
			alert("모임 종료 장소를 검색 버튼을 통해 입력해주세요.");
			return;
		}
		
		setRidingDate();
		
		$("form#insertRiding").submit();
	}
	
	function searchMap(val)
	{
		
		window.open("searchmap.action?openType="+val , "위치 찾기", "width=800");
	}
	
	function getAddr(openType, addr, lat, lng)
	{
		if (!openType.includes('point'))
		{
			var address = openType + '_address';
			var lati = openType + '_lati';
			var longi = openType + '_longi';
			
			$('#'+address).val(addr);
			
			var latiInput = '<input type="hidden" name="'+lati+'" value="'+lat+'"/>'; 
			var longiInput = '<input type="hidden" name="'+longi+'" value="'+lng+'"/>'; 
			
			$("span.hidden_"+openType).empty();
			$("span.hidden_"+openType).append(latiInput);
			$("span.hidden_"+openType).append(longiInput);
		}
		else
		{
			
			$('label.'+openType).children("input[name=address]").val(addr);
			
			var latiInput = '<input type="hidden" name="latitude" value="'+lat+'"/>'; 
			var longiInput = '<input type="hidden" name="longitude" value="'+lng+'"/>';
			
			$("span.hidden_"+openType).empty();
			$("span.hidden_"+openType).append(latiInput);
			$("span.hidden_"+openType).append(longiInput);
		}
		
		// 지도 마커 표시
		setMarkers();
	}
	
	function setMarkers()
	{
		// KakaoMap.jsp 안에 작성된 마커, 인포윈도우 초기화 function
		reset();
		
		// 모임 장소 설정했다면
		if ($("input[name='meet_lati']").length)
		{
			var lat = $("input[name='meet_lati']").val();
			var lng = $("input[name='meet_longi']").val();
			var addr = $("input[name='meet_address']").val();
			addMarker(lng, lat, addr, 'meet');
		}
		
		// 출발점 설정했다면
		if ($("input[name='start_lati']").length)
		{
			var lat = $("input[name='start_lati']").val();
			var lng = $("input[name='start_longi']").val();
			var addr = $("input[name='start_address']").val();
			addMarker(lng, lat, addr, 'start');
		}
		
		// 도착점 설정했다면
		if ($("input[name='end_lati']").length)
		{
			var lat = $("input[name='end_lati']").val();
			var lng = $("input[name='end_longi']").val();
			var addr = $("input[name='end_address']").val();
			addMarker(lng, lat, addr, 'end');
		}
		
		// 경유지 설정했다면...
		if ($("input[name='latitude']").length)
		{
			for (var i=0; i<$("input[name='latitude']").length; i++)
			{
				var lat = $("input[name='latitude']:eq("+i+")").val();
				var lng = $("input[name='longitude']:eq("+i+")").val();
				var addr = $("input[name='address']:eq("+i+")").val();
				var num = String(i+1);
				addMarker(lng, lat, addr, 'point '+num);	
			}
			
		}
		
	}
	
	function myRidingCheck()
	{
		var user_id = ${user_id};
			
		$.ajax(
		{
			type:"POST"
			, asynx:false
			, url:"myRidingCheck.action?user_id="+user_id
			, success:function(data)
			{
				
				var jObj = JSON.parse(data);
				
				var age_p_id = jObj[0].age_p_id;
				var dining_p_id = jObj[1].dining_p_id;
				var eat_p_id = jObj[2].eat_p_id;
				var mood_p_id = jObj[3].mood_p_id;
				var sex_p_id = jObj[4].sex_p_id;
				
				//alert(mood_p_id);
				
				$('input:radio[name="age_p_id"][value=' + age_p_id + ']').prop('checked', true);
				$('input:radio[name="dining_p_id"][value=' + dining_p_id + ']').prop('checked', true);
				$('input:radio[name="eat_p_id"][value=' + eat_p_id + ']').prop('checked', true);
				$('input:radio[name="mood_p_id"][value=' + mood_p_id + ']').prop('checked', true);
				$('input:radio[name="sex_p_id"][value=' + sex_p_id + ']').prop('checked', true);
				
				// 속도, 숙련도는 제한 없음 디폴트
				$('input:radio[name="speed_id"][value=0]').prop('checked', true);
				$('input:radio[name="step_id"][value=0]').prop('checked', true);
				
				
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		})
	}
	
	// 기간 설정 기능 추가.
	function addDate()
	{
		var date = new Date();
		
		// 현재 시 분 기록. 
		
		// 최소 3일 이후부터 
		var min = new Date();
		min.setDate(min.getDate()+3);
		
		// 최대 3개월 까지
		var max = new Date();
		max.setMonth(max.getMonth()+3);
		
		$("#start_day").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeMonth : true
			, minDate : min
			, maxDate : max
			, onSelect : function(date, instance)
			{
				// 현재 날짜와 데이트피커의 마지막 입력값 날짜가 다르다면....
				if (date !== instance.lastVal)
				{
					$(this).change();
				}
				
			}
		})
		.on("change", function()
		{
			//alert("접속 테스트");
			
			// 최소 3일 이후일 때, 최소 시작 시간 시:분 구하기
			// 27일 12:00 PM     >> 3일 후 >>>>  30일 12:00 PM. 
			// 분은 10분 단위로 쓰고, 1분 단위는 올림. 
			var minute = (Math.ceil(min.getMinutes()/10)*10);
			var hour = min.getHours();
			
			// 60분이면 0분 치환. 시간은 1시간 +.
			if (minute == 60)
			{
				minute = 0;
				hour = hour + 1;
			}
			
			// 최소 시작 시:분
			var min_hour_minute = hour.toString() + ":" + minute.toString();
			
			// ex) 현재 24일 12시라면, 시작 날짜는 3일 후(27일 12시)부터 가능한데
			//     이 때, 27일을 선택했으면 시간은 27일 12시부터 선택 가능.
			//     만약 28일, 29일 등을 선택했으면 0~24시 자유롭게 선택 가능
			var start_time = $("#start_day").datepicker("getDate") > min
								? '0' : min_hour_minute;
			
			// start_time timepicker를 지웠다가 다시 달아줌.(초기화 후 재사용)
			$("#span_start_time").empty();
			var start_timepicker = '<input type="text" id="start_time" name="riding_date" required size="9" placeholder="시:분(24시)"/>';
			$("#span_start_time").append(start_timepicker);
			
			// #end_day datepicker 초기화 후 다시 달기
			$("#span_end_day").empty();
			var end_datepicker = '<input type="text" id="end_day" name="riding_date" required size="8" placeholder="종료 날짜">';
			$("#span_end_day").append(end_datepicker);
			
			// end_time timepicker를 지웠다가 다시 달아줌.(초기화 후 재사용)
			$("#span_end_time").empty();
			var end_timepicker = '<input type="text" id="end_time" name="riding_date" required size="9" placeholder="시:분(24시)"/>';
			$("#span_end_time").append(end_timepicker);
			
			//값 변화 관찰용
			var start_time_value="";
			
			$("#start_time").timepicker({
				timeFormat: 'HH:mm'
				, interval: 10
				, minTime: start_time
				, maxTime: '23:59'
				, scrollbar: true
				, dynamic: false
			    , change: function(val)
				{
			    	// 값이 변했다면 change
			    	if (val.toString() !== start_time_value)
			    	{
			    		start_time_value = val.toString();
			    		$(this).change();
			    	}
				}
			})
			.on("change", function()
			{
				// alert("접속 테스트");
				
				// #end_day datepicker 초기화 후 다시 달기
				$("#span_end_day").empty();
				var end_datepicker = '<input type="text" id="end_day" name="riding_date" required size="8" placeholder="종료 날짜">';
				$("#span_end_day").append(end_datepicker);
				
				// end_time timepicker를 지웠다가 다시 달아줌.(초기화 후 재사용)
				$("#span_end_time").empty();
				var end_timepicker = '<input type="text" id="end_time" name="riding_date" required size="9" placeholder="시:분(24시)"/>';
				$("#span_end_time").append(end_timepicker);
				
		    	// 시 분 변수로 빼내기.
		    	var h = $("#start_time").val().split(":")[0];
		    	var m = $("#start_time").val().split(":")[1];
		    	
		    	// 최소, 최대 시간 설정
		    	var min_end = $("#start_day").datepicker("getDate");
		    	var max_end = $("#start_day").datepicker("getDate"); 	
		    	max_end.setHours(h);
		    	max_end.setMinutes(m);
		    	max_end.setDate(max_end.getDate()+7); // 시작일로부터 최대 7일
				
		    	
		    	$("#end_day").datepicker(
				{
					dateFormat : "yy-mm-dd"
					, changeMonth : true
					, minDate : min_end
					, maxDate : max_end
					, onSelect : function(end_date, end_instance)
					{
						// 현재 날짜와 데이트피커의 마지막 입력값 날짜가 다르다면....
						if (end_date !== end_instance.lastVal)
						{
							$(this).change();
						}
					}
				})
				.on("change", function()
				{
					//alert("접속");
				
					
					// end_time timepicker를 지웠다가 다시 달아줌.(초기화 후 재사용)
					$("#span_end_time").empty();
					var end_timepicker = '<input type="text" id="end_time" name="riding_date" required size="9" placeholder="시:분(24시)"/>';
					$("#span_end_time").append(end_timepicker);
					
					// 종료일의 최대 시:분. 마지노선.
		    		var end_hour_minute = max_end.getHours().toString() + ":" + max_end.getMinutes().toString();
					
					// 마지막 날에서, 선택 가능한 minimum 시간과 선택 가능한 maximum 시간 설정하기 
					// 최초값 설정
					var end_minTime = end_hour_minute;
					var end_maxTime = "23:59";
					
					
					// 선택한 종료 날짜가, 시작 날짜와 같지 않을 때
					if ( $("#end_day").datepicker("getDate").getDate() != $("#start_day").datepicker("getDate").getDate() )
						end_minTime = '0';
					// 선택한 종료 날짜가, 최대 선택 가능한 날짜랑 같을 때
					if ( $("#end_day").datepicker("getDate").getDate() == max_end.getDate() )
						end_maxTime = end_hour_minute;
					
					$("#end_time").timepicker({
						timeFormat: 'HH:mm'
						, interval: 10
						, minTime: end_minTime
						, maxTime: end_maxTime
					    , scrollbar: true
					    , dynamic: false
					    
					});
				});
			});
		});
	}
	
	// 제출 전 date 설정
	function setRidingDate()
	{
		var start_date = $("#start_day").val() + " " + $("#start_time").val();
		var end_date = $("#end_day").val() + " " + $("#end_time").val();
		
		$("#start_date").val(start_date);
		$("#end_date").val(end_date);
	}
</script>
</head>
<body>
<div>
	<h3>다인 라이딩 모임 수정 폼입니다</h3>
    <hr>
</div>

<!-- 라이딩 모임 상세 정보 변수-->
<div class="container">
	<form id="insertRiding" action ="insertriding.action" method="post">
		<table class="table table-bordered">
			<tr>
				<th>모임 이름</th>
				<td>
					<input type="text" id="riding_name" name="riding_name" 
					maxlength="20" placeholder="20자 이내로 입력하세요" value="${riding.riding_name }"/>
				</td>
			</tr>
			<tr>
				<th>라이딩 기간</th>
				<td>
					<span id="span_start_day">
						<input type="text" id="start_day" name="riding_date" required size="8"
						placeholder="시작 날짜" value='<%=start_day%>'>
					</span>
					<span id="span_start_time">
						<input type="text" id="start_time" name="riding_date" required size="9" 
						placeholder="시:분(24시)" value='<%=start_time%>'/>
					</span>
					~ 
					<span id="span_end_day">
						<input type="text" id="end_day" name="riding_date" required size="8" 
						placeholder="종료 날짜" value='<%=end_day%>'>
					</span>
					<span id="span_end_time">
						<input type="text" id="end_time" name="riding_date" required size="9" 
						placeholder="시:분(24시)" value='<%=end_time%>'/>
					</span>
					
					<input type="hidden" id="start_date" name="start_date" value="${riding.start_date }"/>
					<input type="hidden" id="end_date" name="end_date" value="${riding.end_date }"/>
				</td>
			</tr>
			<tr>
				<th>최대 인원수</th>
				<td>
					<select name="maximum" id="maximum">
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모임 장소</th>
				<td>
					<span class="meet">
						<input type="text" name="meet_address" id="meet_address" 
						placeholder="주소" readonly="readonly" value="${riding.meet_address }"/>
						<input type="text" name="meet_detail" id="meet_detail"
						placeholder="상세주소를 입력하세요" value="${riding.meet_detail }"/>
						<button type="button" class="searchMap" value="meet">검색</button>
						<span class="hidden_meet" style="display: none;">
							<input type="hidden" name="meet_lati" value="${riding.meet_lati }"/> 
							<input type="hidden" name="meet_longi" value="${riding.meet_longi }"/>
						</span>
					</span>
				</td>
			</tr>
			<tr>
				<th>모임 출발 장소</th>
				<td>
					<span class="start">
						<input type="text" name="start_address"	id="start_address" 
						placeholder="주소" readonly="readonly" value="${riding.start_address }"/>
						<input type="text" name="start_detail" id="start_detail" 
						placeholder="상세주소를 입력하세요" value="${riding.start_detail }"/>
						<button type="button" class="searchMap" value="start">검색</button>
						<span class="hidden_start" style="display: none;">
							<input type="hidden" name="start_lati" value="${riding.start_lati }"/> 
							<input type="hidden" name="start_longi" value="${riding.start_longi }"/> 
						</span>
					</span>
					
				</td>
			</tr>
			<tr>
				<th>모임 종료 장소</th>
				<td>
					<span class="end">
						<input type="text" name="end_address" id="end_address" 
						placeholder="주소" readonly="readonly" value="${riding.end_address }"/>
						<input type="text" name="end_detail" id="end_detail" 
						placeholder="상세주소를 입력하세요" value="${riding.end_detail }"/>
						<button type="button" class="searchMap" value="end">검색</button>
						<span class="hidden_end" style="display: none;">
							<input type="hidden" name="end_lati" value="${riding.end_lati }"/> 
							<input type="hidden" name="end_longi" value="${riding.end_longi }"/>
						</span>
					</span>
				</td>
			</tr>
			<tr>
				<th>경유지</th>
				<td>
					<%-- 
					<div>
						<button type="button" onclick="searchList()">경유지 찾아보기</button>
					</div>
					<div>
						<jsp:include page="bicycle.jsp"></jsp:include>
					</div>
					--%>
					<div class="ridingPoint">
						<span class="point">
							<label class="point1">경유지1
								<input type="text" class="txt" name="address" readonly="readonly"/>
								<input type="text" class="txt" name="detail_address"/>
								<button type="button" class="searchMap" value="point1">검색</button>
								<span class="hidden_point1" style="display: none;"></span>
							</label>
						</span>
						<span class="pointBtn">
							<button type="button">추가</button>
							<button type="button" style="display:none;">삭제</button>
						</span>		
					</div>	
				</td>
			</tr>
			<tr>
				<th>공지사항</th>
				<td>
					<textarea name="comments" cols="50" rows="5">${riding.comments }</textarea>
				</td>
			</tr>
		</table>
		
		<br />
		
		<div>
			<%-- <c:import url="${request.contextPath }/KakaoMap.jsp"/> --%>
			<c:import url="/displaymap.action"/>			
		</div>
				
		
		<!-- 여기서부터는 라이딩 스타일을 지정하는 구간입니다 -->
		<h2>라이딩 스타일 지정</h2>
        <hr>
        
        <div class="form-group myRidingBtn">
			<input type="button" class="btn btn-default" id="myRidingBtn" value="나의 라이딩스타일 적용"/>
		</div>        
        <table class="table table-bordered riding-style">
        	<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="sex_p_id" value="0"
						<c:if test="${riding.sex_p_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
					<c:choose>
						<c:when test="${sex eq'M' }">
							<input type="radio" name="sex_p_id" value="1"
							<c:if test="${riding.sex_p_id eq 1 }"> checked="checked"</c:if> />남
						</c:when>
						<c:otherwise>
							<input type="radio" name="sex_p_id" value="2"
							<c:if test="${riding.sex_p_id eq 2 }"> checked="checked"</c:if> />여
						</c:otherwise>
					</c:choose>
					</label>
				</td>
			</tr>
			<tr>
				<th>연령 제한</th>
				<td>
					<label>
						<input type="radio" name="age_p_id"  value="0"
						<c:if test="${riding.age_p_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
					<c:if test="${age_p_id != '0' }">
						<input type="radio" name="age_p_id" value="${age_p_id }"
						<c:if test="${riding.age_p_id == age_p_id }"> checked="checked"</c:if>
						/>${age_p_id }0대 
						<c:if test="${age_p_id == '6' }">이상
						</c:if>
					</c:if>
					</label>
				</td>
			</tr>
			<tr>
				<th>속도</th>
				<td>
					<label>
						<input type="radio" name="speed_id" value="0"
						<c:if test="${riding.speed_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="speed_id" value="1"
						<c:if test="${riding.speed_id eq 1 }"> checked="checked"</c:if>/>20미만
					</label>
					<label>
						<input type="radio" name="speed_id" value="2"
						<c:if test="${riding.speed_id eq 2 }"> checked="checked"</c:if>
						/>20이상 24미만
					</label>
					<label>
						<input type="radio" name="speed_id" value="3"
						<c:if test="${riding.speed_id eq 3 }"> checked="checked"</c:if>
						/>24이상
					</label>
				</td>
			</tr>
			<tr>
				<th>숙련도</th>
				<td>
					<label>
						<input type="radio" name="step_id" value="0" 
						<c:if test="${riding.step_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="step_id" value="1" 
						<c:if test="${riding.step_id eq 1 }"> checked="checked"</c:if>
						/>1년 미만
					</label>
					<label>
						<input type="radio" name="step_id" value="2" 
						<c:if test="${riding.step_id eq 2 }"> checked="checked"</c:if>
						/>1~3년
					</label>
					<label>
						<input type="radio" name="step_id" value="3"
						<c:if test="${riding.step_id eq 3 }"> checked="checked"</c:if>
						/>3~5년
					</label>
					<label>
						<input type="radio" name="step_id" value="4"
						<c:if test="${riding.step_id eq 4 }"> checked="checked"</c:if>
						/>6년 이상
					</label>
				</td>
			</tr>
			<tr>
				<th>식사 여부</th>
				<td>
					<label>
						<input type="radio" name="eat_p_id" value="0" 
						<c:if test="${riding.eat_p_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="eat_p_id" value="1" 
						<c:if test="${riding.eat_p_id eq 1 }"> checked="checked"</c:if>
						/>밥 안 먹고 달려요
					</label>
					<label>
						<input type="radio" name="eat_p_id" value="2" 
						<c:if test="${riding.eat_p_id eq 2 }"> checked="checked"</c:if>
						/>밥 먹고 달려요
					</label>
				</td>
			</tr>
			<tr>
				<th>회식 여부</th>
				<td>
					<label>
						<input type="radio" name="dining_p_id" value="0" 
						<c:if test="${riding.dining_p_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="dining_p_id" value="1" 
						<c:if test="${riding.dining_p_id eq 1 }"> checked="checked"</c:if>
						/>끝나고 회식 안 해요
					</label>
					<label>
						<input type="radio" name="dining_p_id" value="2" 
						<c:if test="${riding.dining_p_id eq 2 }"> checked="checked"</c:if>
						/>끝나고 회식 해요
					</label>
				</td>
			</tr>
			<tr>
				<th>분위기</th>
				<td>
					<label>
						<input type="radio" name="mood_p_id" value="0"
						<c:if test="${riding.mood_p_id eq 0 }"> checked="checked"</c:if>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="mood_p_id" value="1"
						<c:if test="${riding.mood_p_id eq 1 }"> checked="checked"</c:if>
						/>침묵이 좋아요
					</label>
					<label>
						<input type="radio" name="mood_p_id" value="2"
						<c:if test="${riding.mood_p_id eq 2 }"> checked="checked"</c:if>
						/>친목이 좋아요
					</label>
				</td>
			</tr>
			
			<tr>
				
				<th>참여자 제한 등급</th>
				<td>
					<label>
						<input type="radio" name="ev_grade_id" value="0" 
						<% if(ev_grade_id == 0) { %> checked="checked" <%} %>
						/>제한없음
					</label>
					<label>
						<input type="radio" name="ev_grade_id" value="1" 
						<% if(ev_grade_id == 1) { %> checked="checked" <%} %>
						/>다이아전거
					</label>
					<label>
						<input type="radio" name="ev_grade_id" value="2" 
						<% if(ev_grade_id == 2) { %> checked="checked" <%} %>
						/>금전거
					</label>
					<label>
						<input type="radio" name="ev_grade_id" value="3" 
						<% if(ev_grade_id == 3) { %> checked="checked" <%} %>
						/>은전거
					</label>
					<label>
						<input type="radio" name="ev_grade_id" value="4" 
						<% if(ev_grade_id == 4) { %> checked="checked" <%} %>
						/>동전거
					</label>
					<label>
						<input type="radio" name="ev_grade_id" value="5" 
						<% if(ev_grade_id == 5) { %> checked="checked" <%} %>
						/>돌전거
					</label>
				</td>
			</tr>
			
        </table>
        
		<div>
			<hr />
			<button type="button" id="submitRiding" class="btn btn-primary" >모임 생성하기</button>   
			<button type="reset" class="btn btn-danger">취소하기</button>
		</div>
	</form>
</div>

</body>
</html>