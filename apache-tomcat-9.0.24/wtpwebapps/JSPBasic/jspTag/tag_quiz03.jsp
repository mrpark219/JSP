<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	List<String> party = new ArrayList<>();  
	List<Integer> jobNumber = new ArrayList<>();
%>
<%
	String[] jobs = {"전사", "도적", "사냥꾼", "마법사", "사제"};
	//직업 갯수 만큼의 정수 난수를 발생
	//party라는 list에 현재 선택된 직업이 몇 개 존재하는지 확인하는 작업이 필요
	//반복문으로 list를 순회해서 현재 선택된 직업의 문자열과 리스트 내부에 들어있는 
	//문자열 중에서 같은 문자열이 발견될 때마다 숫자를 센다
%>
    
<%
	
	Random r = new Random();
	int n = r.nextInt(jobs.length);
	int cnt=0;
	String job = jobs[n];
	party.add(jobs[n]);
	jobNumber.add(n);
	for(String j : party){
		if(job.equals(j)){ //문자열은 참조형이라 == 비교 안됨!!! -> equals 사용
			cnt++;
		}
	}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>당신의 역할</h2>
	<p>
	<img src="img/<%= n %>.png" width="40px" height="40px">
		당신에게 부여된 역할은 <strong>[<%= jobs[n] %>]</strong>입니다. <br>
		현재 파티에 당신과 같은 역할을 가진 플레이어는 <%= cnt %>명입니다.
	</p>
	
	<p>
		현재 파티 구성 <br>
		<%-- <%= party %> --%>
		
		<% for(int idx : jobNumber) { %>
			<img src="img/<%= idx %>.png" width="20px" height="20px">
		<% } %>
		
		(<%= party.size() %>명 참가중)
	</p>
	
	<%
		if(party.size()==10){
			party.clear();
		}
	%>
	
</body>
</html>