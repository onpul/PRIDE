<!-- 3. 초대 | 초대장 조회 -->

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
<title>Invite.jsp</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* function rowDel(obj)
{
	 var tr = obj.parentNode.parentNode;
	     tr.parentNode.removeChild(tr);
	  
}
 */


$(function()
		{
			$("#btnDelete").click( function()
			{
				location.href="Inv_Del.action?invite_id="+$(this).val();
			
			
			})
			
			
		});


/* $(function() {
    $('#aempty').click( function() {
        $( '#noti > tbody').empty();
    });
});
 */


</script>



</head>

<!-- 
창 사이즈 조절
 -->
<body onload="window.resizeTo(1000,700)"> 

<hr />


<!-- 초대장 개별 삭제하는 버튼 -->
<div class="container" >
<div style="width: 700px; height: 400px; overflow:scroll;">
<table  class="table" id="noti">
			<thead>
			<tr>
     	 			<th style="text-align:center;">초대장</th>
     	 			<th> </th>
    		</tr>
			</thead>

      		<tbody>
      	
     		 	
     		 	<c:forEach var="invite_id" items="${list }">
						<tr>
							<td>${invite_id.invite_id }</td>
							<td>${invite_id.sender_id}</td>
							<td>${invite_id.riding_id }</td>
							<td>${invite_id.receiver_id }</td>
							<td>${invite_id.send_date }</td>
							<td>
							<button class="btn  pull-center" type="submit" 
					 		id="btnDelete" value="${invite_id.invite_id }"
       						>x</button>
							</td>	
							
						</tr>
						
					 
				</c:forEach>
     			
       	
   			
   			 
   		
   			 </tbody>
   			 
   	
</table>
</div>


		
		
</div>	



</body>


</html>