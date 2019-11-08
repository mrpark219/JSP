<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	score_bean_make에서 전송된 ScoreBean객체를 활용하여
	5가지 데이터를 브라우저에 출력하세요.
 --%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="score" class="kr.co.park.jspbasic.score.ScoreBean" scope="request"/>
	
	# 국어점수: <jsp:getProperty name="score" property="kor"/> 점 <br>
	# 영어점수: <jsp:getProperty name="score" property="eng"/> 점 <Br>
	# 수학점수: <jsp:getProperty name="score" property="math"/> 점 <br>
	# 총점: <jsp:getProperty name="score" property="total"/> 점 <br>
	# 평균: <jsp:getProperty name="score" property="avg"/> 점 <br>

</body>
</html>