<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>시험점수 등록하기</h1>
	<form action="insert_controller.jsp" method ="post">
	
		<div>
		
			# 이름: <input name="name" maxlength="5px"> <br>	
			# 국어: <input name="kor" maxlength="3px"> <br>	
			# 영어: <input name="eng" maxlength="3px"> <br>	
			# 수학: <input name="math" maxlength="3px"> <br>
			<button type="submit">확인</button>		
		
		</div>
	
	</form>

</body>
</html>