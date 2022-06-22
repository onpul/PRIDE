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
<title>Manager.jsp</title>
</head>

<body>
<!-- 헤더 -->
<div>
	<c:import url="<%=header %>"></c:import>
</div>
<div class="alert2">
<h1> 관리자 </h1>
</div>
<hr />

<div>
 &nbsp;&nbsp;<a href="Man_AddCount.jsp" class="hrf">생성&nbsp;&nbsp;요청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
 &nbsp;&nbsp;<a href="Man_ModCount.jsp"  class="hrf">수정&nbsp;&nbsp;요청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
 &nbsp;&nbsp;<a href="Man_DelCount.jsp"  class="hrf">삭제&nbsp;&nbsp;요청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
 &nbsp;&nbsp;<a href="reportlist.do" class="hrf">신고&nbsp;&nbsp;발생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
 &nbsp;&nbsp;<a href="#"  class="hrf">문의&nbsp;&nbsp;조회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br /><hr />
 &nbsp;&nbsp;<a href="#" class="hrf">편의&nbsp;&nbsp;시설&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
 &nbsp;&nbsp;<a href="#" onclick="();" class="hrf">평가&nbsp;점수&nbsp;관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
 &nbsp;&nbsp;<a href="#" onclick="();" class="hrf">공헌도&nbsp;점수&nbsp;관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
 &nbsp;&nbsp;<a href="#" onclick="();" class="hrf">패널티&nbsp;관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br /><hr />
</div>

</body>
</html>