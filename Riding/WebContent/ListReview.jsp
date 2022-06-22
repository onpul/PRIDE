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
<title>맛집 조회 목록 리스트</title>
<link rel="stylesheet" href="css/main.css" type="text/css">


<style type="text/css">

input{ 	padding: 7px;
		margin: 15px auto; 
	
	}

input[type=submit], input[type=button],input[type=reset] {
	padding: 7px 15px;
	margin: 7px 10px;
	background: #99CEB5; 
	color: white;
	border: none;
	cursor: pointer;
	width:35%;
}
input[type=submit]:hover{
	background:#F59B7A;
}
input[type=button]:hover{
	background:#F59B7A;
}
input[type=reset]:hover{
	background:#F59B7A;
}


a{
	text-decoration: none;
	color: tomato;
}
hr{
	border: 1px dotted #f5b49c;
}
a{
  color:w#F59B7A;
}
a>mark{
	background-color: #fdbba3;
	opacity: 50%;

}

</style>
<script type="text/javascript">
	
	function reg()
	{
		location.href = "StoreMap.jsp";
	}
	
	
	function rWrite()
	{
		location.href = "RegisterReview.jsp";
	}
	
	
	
	
	
	
</script>




</head>
<body>
<!-- 헤더 -->
<div>
	<c:import url="<%=header %>"></c:import>
</div>
<!-- 게시물 검색 폼  -->
<form action="">
<div>
<div>
	<table border="1" width="60%" height="20%">
	<tr>
	<td align="left">
	<select name="searchField" id="">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="name">작성자</option>
	</select>
	<input type="text" name="searchWord"/>
	<input type="submit" value="검색하기"/>
	
	<select name="RangeKey" class="RangeField">
          <option value="최신순">최신순</option>
          <option value="조회순">조회순</option>
    </select>
	
	</td>
	</tr>	
	</table>
</form>
</div>
<br /><br />

<!-- 게시물 목록 -->
<div style="overflow:scroll">
	<table border="1" width="80%">
	<tr align=left>
	<th width="10%">번호</th>
	<th width="*">제목</th>
	<th width="15%">작성자</th>
	<th width="15%">작성일</th>
	<th width="10%">조회수</th>
	</tr>

</table>

	<table>
		<tr>
		<a href="DetailReview.jsp" >상세 후기 보기~~~~~</a>
		
		
		</tr>
	
	
	</table>




</div>


<br /><br />

<div>
	<span><button type="button" onclick="">처음으로</button></span>
	<span><button type="button" onclick="">1</button></span>
	<span><button type="button" onclick="">2</button></span>
	<span><button type="button" onclick="">3</button></span>
	<span><button type="button" onclick="">4</button></span>
	<span><button type="button" onclick="">5</button></span>
	<span><button type="button" onclick="">마지막으로</button></span>
	<span><button type="button" onclick="reg()">홈으로</button></span>
	<span><button type="button" onclick="rWrite()">후기등록하기</button></span>
</div>
</div>
</body>
</html>