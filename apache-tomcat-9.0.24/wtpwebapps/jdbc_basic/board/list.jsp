<%@page import="kr.co.park.board.model.Board"%>
<%@page import="java.util.*"%>
<%@page import="kr.co.park.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	List<Board> articles = BoardDAO.getInstance().selectALl();	
%>

<!-- 게시물이 없다면 -->

<%
	if(articles.size() <= 0) {
%>

<p>게시물이 존재하지 않습니다.</p>

<% } else { %>

<!-- 게시물이 있다면 -->
<h1>게시글 목록</h1>

<table border="1">
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>비고</td>
	</tr>
		
	<% for(Board board : articles) { %>
		
	<tr>
		<td><%= board.getBoardID() %></td>
		<td><%= board.getWriter() %></td>
		<td>		
			<a href="content.jsp?id=<%= board.getBoardID() %>"><%= board.getTitle() %></a>
		</td>
		<td>
			<a href="delete-con.jsp?id=<%= board.getBoardID() %>">[삭제]</a>
		</td>
	</tr>
	
	<% } %>
	
</table>

<% } %>

<br>
<p>
	<a href="write.jsp">게시글 작성하기</a>
</p>

</body>
</html>







