<!-- 2. 알림 | 알림조회  -->

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_win.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function()
		{
			$("#btnDelete").click( function()
			{
				location.href="Notice_Del.action?notice_id="+$(this).val();
			
			
			})
			
			
		});

/* 
 function rowDel(obj)
 {
 	 var tr = obj.parentNode.parentNode;
 	     tr.parentNode.removeChild(tr);
 	  
 }
 */
 
/* 
 $(function()
 		{
 			$("#aempty").click( function()
 			{
 				location.href="Notice_Del_all.action"
 			
 			
 			})
 			
 			
 		});


 $(function()
	 		{
	 			$("#readnot").click( function()
	 			{
	 				location.href="Notice_Del_read.action"
	 			
	 			
	 			})
	 			
	 			
	 		}); */
/* 
$(function () {
    $('#aempty').click( function() {
        $( '#noti > tbody').empty();
    });
}); */





</script>



</head>

<!-- 
창 사이즈 조절
 -->
<body onload="window.resizeTo(1000,700)"> 

<hr />


<!-- 
<div style="position: relative; left: 600px; top: 450px;">
	
		
		<a href="#" id="readnot">읽은 알림 삭제</a>
		|
		<a href="#" id="aempty">전체 삭제</a>
	
	
</div>	
 -->

<!-- 이 코드는 알림창 개별 삭제하는 버튼 -->
<div class="container" >
<div style="width: 700px; height: 400px; overflow:scroll;">
<table  class="table" id="noti">
			<thead>
			<tr>
			
     	 			<th style="text-align:center;">알림</th>
     	 
    		</tr>
			</thead>

      		<tbody>
      	
     		 
     		 	<c:forEach var="notice_id" items="${list }">
						<tr>
							<td>${notice_id.notice_id }</td>
							<td>${notice_id.user_id}</td>
							<td>${notice_id.n_content_id }</td>
							<td>${notice_id.send_date }</td>
							<td>
							<button id="btnDelete"class="btn  pull-center" type="button" 
       							value="${notice_id.notice_id}">x</button>
       						</td> 
						</tr>
								
				</c:forEach>
					
					
     			<!--  onclick='javascript:rowDel(this);' -->
       	
   			
   			 
   		
   			 </tbody>
   			 
   	
</table>
</div>


		
		
</div>	





</body>


</html>