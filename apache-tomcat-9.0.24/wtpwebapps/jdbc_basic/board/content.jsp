<%@page import="kr.co.park.board.model.Board"%>
<%@page import="kr.co.park.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Long id = Long.parseLong(request.getParameter("id"));
	Board article = BoardDAO.getInstance().selectOne(id);
	

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1><%= article.getBoardID() %>번 게시물 내용</h1>

<p>
	# 글번호: <%= article.getBoardID() %><br>
	# 작성자: <%= article.getWriter() %><br>
	# 제목: <%= article.getTitle() %><br>
	# 내용: <textarea rows="3" disabled><%= article.getContent() %></textarea>
</p>

<a href="list.jsp">글 목록보기</a>&nbsp;
<a href="modify.jsp?id=<%= article.getBoardID() %>">글 수정하기</a>

</body>
</html>



