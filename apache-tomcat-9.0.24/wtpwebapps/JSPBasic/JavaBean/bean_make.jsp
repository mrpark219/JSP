<%@ page import="kr.co.park.jspbasic.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");
	/*
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	*/

%>

 
<jsp:useBean id="user" class="kr.co.park.jspbasic.user.UserBean" scope="request"/>

<%--
	* 파라미터의 이름과 자바빈 클래스의 멤버변수명이 일치할 경우
	액션태그 setProperty의 속성 property의 값을 *로 지정하면
	자동으로 파라미터값을 읽어서 자바빈 클래스 변수에 저장합니다.
 --%>

<jsp:setProperty name="user" property="*"/>

<%-- 
<jsp:setProperty name="user" property="id" value="<%= id %>"/>
<jsp:setProperty name="user" property="pw" value="<%= pw %>"/>
<jsp:setProperty name="user" property="name" value="<%= name %>"/>
<jsp:setProperty name="user" property="email" value="<%= email %>"/>
--%>
<%
	/*
	UserBean user = new UserBean();
	
	user.setId(id);
	user.setPw(pw);
	user.setName(name);
	user.setEmail(email);
	
	request.setAttribute("user", user);
	*/
%>    

<jsp:forward page="bean_use.jsp"/>