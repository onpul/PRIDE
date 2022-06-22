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
<title>MyProfile.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

   function req()
   {
      if(confirm("프로필을 수정하시겠습니까?"))
      {
  			//프로필 수정 폼으로 연결 window.open() 작성
      }
      else
      {
         alert("취소했습니다.");
      }
   }


</script>
</head>
<body>


<div>
   <h2>내 프로필</h2>
</div>
<div class="box1">
   <div>
      😺 달리는 야옹이 🚲🧢<br>
      
         야옹. 난 오늘도 달린다.
         함께 달리자.
       <input type="button" value="프로필 수정" onclick="req();"/> 
   </div>
</div>
</body>
</html>