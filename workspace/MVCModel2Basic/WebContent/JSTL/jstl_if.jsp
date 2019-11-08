<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 페이지 안에서 JSTL태그를 사용하려면 디렉티브(지시자)를 통해 taglib선언을 해야 합니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="false">
		<p>항상 출력되는 출력문 입니다.</p>
	</c:if>
	
	<c:if test="${ param.name == '홍길동' }">
		<p>name파라미터의 이름은 ${ param.name } 입니다.</p>
	</c:if>

	<c:if test="${ param.name == '이순신' }">
		<p>name파라미터의 이름은 ${ param.name } 입니다.</p>
	</c:if>
	
	<%--
	<%
		String name = request.getParameter("name");
		if(name.equals("홍길동")) {	%>
		
		<p>name파라미터의 이름은 <%= name %> 입니다.</p>

	<% } %>
	<%
		if(name.equals("이순신")) {	%>
		
		<p>name파라미터의 이름은 <%= name %> 입니다.</p>

	<% } %>
	 --%>
</body>
</html>