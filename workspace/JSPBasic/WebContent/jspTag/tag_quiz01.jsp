<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Random" %>

<!-- Random r = new Random(); -->
<!-- nextInt()메서드는 정수 난수값을 발생시키는 메서드입니다. -->
<!-- 매개값으로 정수 n을 주면 0이상 n미만의 정수 난수를 리턴합니다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%! 
		int visit=0; 
		Random r = new Random();
	%>
	<% 
		visit++; 
		int randomnumber = r.nextInt(8)+2;
	%>
	<p>
		페이지의 누적 요청 수: <%= visit %> <br>
		매 10번째 방문자에게는 기프티콘을 드립니다. <br>
	</p>
	<%
		if(visit%10==0){
			out.println("당첨되셨습니다");
		}
	%>
	<hr>
	
	<h2>랜덤 구구단(<%= randomnumber %>)</h2>
	
	<p>
		이번에 나온 구구단은 <%= randomnumber %>단 입니다. <br> <br>
		<%
			for(int i=1;i<10;i++){
				out.println(randomnumber + " x " + i + " = "+(randomnumber*i)+"<br>");
			}
		%>
	</p>
	
	
</body>
</html>