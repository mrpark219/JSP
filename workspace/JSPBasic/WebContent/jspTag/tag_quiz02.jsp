<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Integer> nums = new ArrayList<>();	
	int cnt=0;
	
	while(nums.size() < 6) {
		int n = r.nextInt(45) + 1;
		//    = (int)(Math.random() * 45) + 1;
		if(!nums.contains(n)) {
			nums.add(n);	
		}
	}	
	Collections.sort(nums);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! Random r = new Random(); %>
	
	<h1>로또번호 생성 결과</h1>
	<p>
		이번주 로또는 이 번호다!! <br>
	</p>
	
	<%	
		for(int num : nums) {
			out.print(num + "&nbsp;");
		}
	%>
	
</body>
</html>