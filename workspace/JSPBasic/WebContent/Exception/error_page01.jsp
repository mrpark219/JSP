<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error_page02.jsp" %>   <%-- 에러 발생시 error_page02.jsp로 보내라 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%= 10 / 0 %>
	<%= request.getParameter("id").toLowerCase() %>
	
</body>
</html>

<!-- 인터넷 익스플로러 브라우저의 경우 전체 응답 결과의 데이터가 브라우저 기준보다 작을 경우
	마이크로 소프트에서 자체 제공하는 에러페이지를 출력합니다. 
	
	window에서 브라우저 바꾸면 됨-->