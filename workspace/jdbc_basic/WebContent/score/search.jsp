<%@page import="kr.co.park.score.model.ScoreDAO"%>
<%@page import="kr.co.park.score.model.IScoreDAO"%>
<%@page import="java.sql.*"%>
<%@page import="kr.co.park.score.model.Scores"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");
	String keyword = "%" + request.getParameter("keyword") + "%";
	
	IScoreDAO dao = ScoreDAO.getInstance();
	
	List<Scores> scoreList = dao.search(keyword);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>검색 결과!</h1>
	
	<% if(scoreList.size() > 0) { %>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>		
			<th>비고</th>
		</tr>
		
		<% for(Scores s : scoreList) { %>
		<tr>
			<td><%= s.getName() %></td>
			<td><%= s.getKor() %></td>
			<td><%= s.getEng() %></td>
			<td><%= s.getMath() %></td>
			<td><%= s.getTotal() %></td>
			<td><%= s.getAverage() %></td>
			<td><a href="delete.jsp?id=<%= s.getId() %>">삭제</a></td>
		</tr>
		<% } %>
		
		<% } else { %>
		<h2>검색 결과가 없어요~~~</h2>
		<% } %>
	</table>

	<a href="insert_form.jsp">다른 점수 등록하기</a>
	<a href="score_list.jsp">목록으로 돌아가기</a>
	
</body>
</html>