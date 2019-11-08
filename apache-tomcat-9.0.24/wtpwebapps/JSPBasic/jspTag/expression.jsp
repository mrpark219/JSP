<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	public String name = "홍길동";
%>

<%
	String address = "서울시";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 표현식은 out.println을 대체합니다. -->
	이름: <%= name %> <br>  <!-- out.println("이름: " + name + "<br>"); -->
	주소: <%= address %> <br>


</body>
</html>