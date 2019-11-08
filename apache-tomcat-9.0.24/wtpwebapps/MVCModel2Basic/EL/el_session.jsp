<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	session.setAttribute("id", "abc1234");
	session.setAttribute("pw", "aaa1111");
	
	response.sendRedirect("el_session_con.jsp");

%>    