<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String name = request.getParameter("user_name");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	String gender = request.getParameter("gender");
	String region = request.getParameter("region");
	String[] hobbys = request.getParameterValues("hobby");


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>form태그로 전달된 데이터 읽기 학습.</h2>
	<p>
		# 이름: <%= name %> <br>
		# ID: <%= id %> <br>
		# PW: <%= pw %> <br>
		# 취미: <%= Arrays.toString(hobbys) %> <br>
		# 성별: <%= gender %> <br>
		# 지역: <%= region %> <br>
	
	
	</p>



</body>
</html>