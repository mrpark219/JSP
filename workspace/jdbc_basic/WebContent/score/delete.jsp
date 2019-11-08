<%@page import="kr.co.park.score.model.ScoreDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	Long id = Long.parseLong(request.getParameter("id"));
	
	if(ScoreDAO.getInstance().delete(id)) {
		response.sendRedirect("score_list.jsp");
	}
	else {
		response.sendRedirect("score_list.jsp");
	}

%>    