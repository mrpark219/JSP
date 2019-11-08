<%@page import="kr.co.park.board.model.BoardDAO"%>
<%@page import="kr.co.park.board.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");
	Long id = Long.parseLong(request.getParameter("boardNo"));
	Board article = new Board();
	
	article.setBoardID(id);
	article.setWriter(request.getParameter("writer"));
	article.setTitle(request.getParameter("title"));
	article.setContent(request.getParameter("content"));

	if(BoardDAO.getInstance().update(article)) {
		response.sendRedirect("content.jsp?id=" + id);
	}
	else {
		response.sendRedirect("list.jsp");
	}
	
%>    