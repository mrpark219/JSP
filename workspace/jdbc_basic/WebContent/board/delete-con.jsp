<%@page import="kr.co.park.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	Long id = Long.parseLong(request.getParameter("id"));
	
	if(BoardDAO.getInstance().delete(id)) {
		response.sendRedirect("list.jsp");
	}
	else {
		response.sendRedirect("list.jsp");
	}
%>    