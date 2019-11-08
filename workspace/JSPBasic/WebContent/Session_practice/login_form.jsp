<%@ page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//로그인했던 회원이 이 화면으로 진입할 경우 "이미 로그인한 회원입니다."메세지를 대신 출력해주세요.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		User user = (User)session.getAttribute("login");
		if(user!=null) {
	%>
	<h2><%= user.getName() %>님은 이미 로그인 중 입니다.</h2>
	<a href="login_welcome.jsp">웰컴으로 돌아가기</a>
	<% 
		} 
		else { %>

	<h1>로그인 양식</h1>

	<form action="login_controller.jsp" method = "post">
	
		<p>
			<input type = "text" name="account" placeholder="아이디"> <br>
			<input type = "password" name="password" placeholder="비밀번호"> <br>
			
			<input type="submit" value="로그인">
			<button type="button" onclick = "location.href='register_form.jsp'">회원가입</button>
			<%-- location.href는 자바 스크립트 문법입니다.
			페이지 이동을 시킬 때 사용합니다. --%>	
		</p>
	</form>
	<% } %>
</body>
</html>