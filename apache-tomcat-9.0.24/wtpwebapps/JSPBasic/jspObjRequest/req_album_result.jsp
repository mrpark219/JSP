<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String model = request.getParameter("title");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if(model.equals("s10")){
			response.sendRedirect("s10.jsp");
		}
		else if(model.equals("note10")){
			response.sendRedirect("note10.jsp");
		}
	%>
	<%--
	<div align="center">

		<h2>선택하신 모델 정보</h2>

		<p>당신이 선택하신 모델은 삼성의 's10' 입니다.</p>
		<hr>
		<h3>모델 홍보 동영상</h3>
		<iframe width="893" height="502" src="https://www.youtube.com/embed/dlk9xmhntrI?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<%} 
	else if(model.equals("note10")) { %>
	<div align="center">

		<h2>선택하신 모델 정보</h2>

		<p>당신이 선택하신 모델은 삼성의 'note10' 입니다.</p>
		<hr>
		<h3>모델 홍보 동영상</h3>
		<iframe width="893" height="502" src="https://www.youtube.com/embed/I0etqpznIhE?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } %>
	 --%>
</body>
</html>