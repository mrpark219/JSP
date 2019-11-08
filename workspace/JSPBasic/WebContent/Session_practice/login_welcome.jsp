<%@ page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		1. 로그인하지 않은 사용자가 주소창에 이 페이지의 URL을 적고
		들어왔을 경우 로그인 창으로 돌려보내는 코드를 작성하세요.
		
		2. 로그인한 회원의 아이디와 별명을 통해 "nick(id)님 환영합니다!"를
		출력하세요
		
		3. 로그인 화면으로, 로그아웃하기(logout.jsp), 회원탈퇴하기(delete.jsp)
	*/
%>
  
<%
	User user = (User)session.getAttribute("login");
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if(user!=null){
	%>

	<h1><%= user.getNickName() %>(<%= user.getName() %>)님 환영합니다!</h1>
	<a href="login_form.jsp">로그인 화면으로</a> <br>
	<a href="logout.jsp">로그아웃 하기</a> <br>
	<a href="delete.jsp">회원탈퇴하기</a>
	<% } 
		else { 
		response.sendRedirect("login_form.jsp");
	 } %>
</body>
</html>