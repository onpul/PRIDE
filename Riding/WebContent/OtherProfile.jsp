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
<title>OtherProfile.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

   /* 
   function req()
   {
      if(confirm("친구를 요청하시겠습니까?"))
      {
         //여기에 쪽지 나오는 window.open() 작성하기
      }
      else
      {
         alert("안할래용");
      }
   }
    */
   
   
   /* 
   function res()
   {
      if(confirm("해당 유저를 신고 하시겠습니까?"))
      {
         window.open("Report.jsp");
         window.close();
      }
      else
      {
         alert("취소했습니다.");
         
      }

   }*/
   
</script>
</head>
<body>


<div>
   <h2>타사용자 프로필</h2>
</div>
<div class="box2">
   <div>
      😺 달리는 야옹이 🚲🧢<br>
      
         야옹. 난 오늘도 달린다.
         함께 달리자.
       <!-- <input type="button" value="친구요청하기" onclick="req();"/> --> 
     <!--  <input type="button" value=" 🚨" onclick="res();"/> -->
   </div>
</div>
</body>
</html>