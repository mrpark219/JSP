<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 
	* Jsp action Tag 사용법
	 - <jsp:forward 속성=값, ...> </jsp:forward>
	 - 닫는 태그는 태그 내부에 추가적으로 종속되어있는 태그가 없다면 닫는 태그를
	 생략하고 열린태그 끝부분을 />로 마감할 수 있습니다.
 --%>    
    
<jsp:forward page="forward_ex02.jsp"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>forward_ex01 페이지 입니다.</h3>
	<p>
		포워드 기능 떄문에 이 메세지를 보실 수 없을 겁니다.
	
	
	</p>


</body>
</html>