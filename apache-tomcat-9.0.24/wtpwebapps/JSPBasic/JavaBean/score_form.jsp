<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="score_bean_make.jsp" method="post">

	<%--
		국어(kor), 영어(eng), 수학(math)점수를 입력받아 전송하는
		폼을 작성하세요.
	 --%>

	#국어: <input type="text" name="kor" size="10px"> <br>
	#영어: <input type="text" name="eng" size="10px"> <br>
	#수학: <input type="text" name="math" size="10px"> <br>
	<input type="submit" value="확인">

</form>

</body>
</html>