<%@page import="kr.co.park.model.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user" class="kr.co.park.model.user.UserVO"/>
	
	<jsp:setProperty name="user" property="id" value="abc1234"/>
	<jsp:setProperty name="user" property="pw" value="aaa1111"/>
	<jsp:setProperty name="user" property="name" value="홍길동"/>
	
 	아이디: <jsp:getProperty name="user" property="id"/>
	비밀번호: <jsp:getProperty name="user" property="pw"/>
	이름: <jsp:getProperty name="user" property="name"/>

	<hr>
	
	아이디: ${ user.id }
	비밀번호: ${ user.pw }
	이름: ${ user.name }
	
	<hr>
	
	<%
		String id = user.getId();
		String pw = user.getPw();
		String name = user.getName();
	%>
	
	아이디: <%= id %>
	비밀번호: <%= pw %>
	이름: <%= name %>
	
	<hr>
	<h3>자바코드로 객체 생성</h3>
	
	<%
		UserVO vo = new UserVO();
		vo.setId("kim1234");
		vo.setName("김철수");
		vo.setPw("kkk1234");
		request.setAttribute("vo", vo);
	%>
	
	이름: ${vo.id } <br>
	비밀번호: ${vo.pw } <br>
	이름: ${vo.name } <br>

</body>
</html>