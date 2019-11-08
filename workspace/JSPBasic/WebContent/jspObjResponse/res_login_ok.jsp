<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 

	- 이 페이지에서는 넘어온 아이디값과 비밀번호값을 받아서 처리합니다.
	만약 아이디가 "abc1234"이고 비밀번호가 "xyz9876"이라면
	아이디가 일지하지 않았을 경우
	"res_id_fail.jsp"로 리다이렉팅해서
	"존재하지 않는 회원입니다."를 브라우저에 출력후 로그인 폼으로 돌아갈 수 있도록 링크를 제공하세요.
	아이디가 일치할 경우 비밀번호도 확인해서 비밀번호가 틀렸을 경우
	"비밀번호가 틀렸습니다." 를 브라우저에 출력하세요. 로그인 폼 링크를 제공하세요.
	아이디, 비밀번호가 전부 일치할 경우 "res_welcom.jsp"로 리다이렉팅해서 "회원님 반갑습니다!"를 출력

--%>

<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("abc1234")&&pw.equals("xyz9876")){
		response.sendRedirect("res_welcome.jsp");
	}
	else if(id.equals("abc1234")){
		response.sendRedirect("res_pw_fail.jsp");
	}
	else{
		response.sendRedirect("res_id_fail.jsp");
	}
	
%>