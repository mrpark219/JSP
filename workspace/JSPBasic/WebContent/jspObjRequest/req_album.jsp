<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../Application/app_basic.jsp" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align=center>
		<%-- <form action="req_album_result.jsp"> --%>
			<table border="1" width="700">
				<tr align="center">
					<%-- <td></td> --%>
					<td>핸드폰 사진</td>
					<td>제조사</td>
					<td>핸드폰 이름</td>
					<td>출시일</td>
				</tr>

				<tr>
					<%-- <td><input type="radio" name="title" value="s10"></td> --%>
					<td align="center">
					<a href = "req_album_result.jsp?title=s10">
						<img src="s10.jpg" width="100" height="100">
					</a>
					</td>
					<td>삼성</td>
					<td><a href = "req_album_result.jsp?title=s10">s10</a></td>
					<td>2019.03</td>
				</tr>

				<tr>
					<%-- <td><input type="radio" name="title" value="note10"></td> --%>
					<td align="center">
						<a href = "req_album_result.jsp?title=note10">
						<img src="note10.jpg" width="100" height="100">
						</a>
					</td>
					<td>삼성</td>
					<td><a href = "req_album_result.jsp?title=note10">note10</a></td>
					<td>2019.08</td>
				</tr>

				<%-- <tr>
					<td colspan="5"><input type="submit" value="확인"></td>
				</tr> --%>

			</table>

		<%-- </form> --%>

	</div>
	<h3>방문자 수: <%= count %></h3>

</body>
</html>