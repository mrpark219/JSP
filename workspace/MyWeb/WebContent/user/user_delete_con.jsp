<%@page import="kr.co.park.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	1. 폼데이터 처리
	2. 로그인 유효성 검사 하세요.
	3. deleteUser()메서드 선언해서 실행.
	4. 탈퇴에 성공하면 세션을 삭제 후 user_login으로 이동
	5. 탈퇴 실패시 user_mypage로 이동.
	*/
	
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("user_id");
	String pw = request.getParameter("check_pw");
	
	int result = UserDAO.getInstance().userCheck(id, pw);
	
	if(result == 0) { %>
	<script>
		alert("비밀번호가 틀렸습니다.");
		location.href="user_mypage.jsp";
	</script>
	<% } else { 
			if(UserDAO.getInstance().deleteUser(id)) {
				session.invalidate();	%>
				<script>
					alert("회원 탈퇴가 정상 처리되었습니다.");
					location.href="user_login.jsp";
				</script>
			<% } else { //삭제 실패%>
			<script>
				alert("회원 탈퇴에 실패했습니다.");
				location.href="user_mypage.jsp";
			</script>
	<% }
			
}%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


