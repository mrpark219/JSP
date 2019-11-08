<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>

<%
	Date date = new Date();	//컴퓨터로부터 시간을 받아옴
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일"); //시간을 원하는 형태로 바꿔서 저장
	String dayInfo = sdf.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		오늘은 <%= dayInfo %> 입니다.
		<%= date %>
	</p>
	
</body>
</html>