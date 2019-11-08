<%@page import="kr.co.park.el.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
		- EL태그로 자바의 객체를 활용하려면 request, session, application
		객체에 자바의 객체를 저장시켜야 합니다.
	*/
	request.setAttribute("t", new Thermometer());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- el에서 객체의 메서드 호출시 매개값으로 문자열을 전달할 때 반드시 홀따옴표를 사용합니다. --%>
	
	${ t.setDegrees('서울', 22.5) }
	서울의 온도: 섭씨${ t.getDegrees('서울') } // 화씨 ${ t.change('서울') }
	<br>
	
	${ t.setDegrees('도쿄', 28.6) } 
	도쿄의 온도: 섭씨 ${ t.getDegrees('도쿄') } // 화씨 ${ t.change('도쿄') }

</body>
</html>