<%@page import="kr.co.park.score.model.ScoreDAO"%>
<%@page import="java.sql.*"%>
<%@page import="kr.co.park.score.model.Scores"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
	List<Scores> scoreList = ScoreDAO.getInstance().list();

	/*
		- DB 테이블에서 전체 학생들의 정보를 얻어오세요.
		- 테이블에서 조회한 정보를 리스트에 담아서 보관하세요.
		(DB에서 가져온 값들을 객체로 포장한 뒤 주소값을 리스트에 추가.)
	*/
 	
%>    

<%
/*
	for(Scores s : scoreList){
		System.out.println(s);
	}
*/
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.del-btn {
		display: inline-block;
		text-decoration: none;
		color: white;
		background: red;
		border: 1px solid black;
	}
	.del-btn:hover {
		background: blue;
	}
	
	input[name=keyword] {
		display: inline-block;
		width: 130px;
		padding: 5px 0;
		border: 1px solid gray;
	}
	
	input[name=keyword]:focus {
		width: 200px;
		trasition: 0.5s;
	
	}
}

</style>
</head>
<body>

	<h1>학생들의 전체 성적 조회</h1>
	<form action="search.jsp" method="post">
		검색<input name="keyword" placeholder="검색할 이름 입력">
		<button type="submit">확인</button>
	</form>
	<br>
	
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
			<td><a class="del-btn" href="delete.jsp?id=<%= s.getId ()%>">삭제</a></td>
		</tr>
		<% } %>
	
	</table>
	
	<a href="insert_form.jsp">다른 점수 등록하기</a>


</body>
</html>