<%@page import="user.User"%>
<%@page import="user.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<% 

	request.setCharacterEncoding("utf-8");

	//입력된 회원정보를 가져오기
	String id = request.getParameter("account");
	String pw = request.getParameter("password");
	
	//로그인을 시도하는 회원의 모든 정보를 얻어오기.
	User user = UserRepository.getUser(id);
	
	/*
		1. 조건문을 사용해서 user변수에 null값을 리턴 받았는지 확인하여
		회원가입이 되어있지 않은 사람이 로그인을 시도한 것이 확인되었을 경우
		로그인 페이지로 보내줍니다.
		
		2. user변수에 null값이 들어있는 것이 아니라면
		회원가입 당시에 작성했던 비밀번호가 로그인 할 때 작성한 비밀번호와 같은지를 판단하여
		같다면 세션에 로그인 데이터를 저장해 주세요. ("login", user)
		
		3. 세션을 만든 후 "login_welcome.jsp"로 페이지를 이동시켜주세요.
		
		4. 비밀번호가 일치하지 않는다면 <script>태그로 "비밀번호가 일치하지 않습니다."
		경고창 하나 띄워주시고 다시 로그인 페이지로 돌려주세요. (뒤로 가기)
	*/
	
	if(user!=null) {

		if(user.getPassword().equals(pw)) {
			session.setAttribute("login", user);
			response.sendRedirect("login_welcome.jsp");
		}
		else {
			%>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.")
				history.back();
			</script>
	<% }
	}
	
	else { %>
		<script type="text/javascript">
		alert("존재하지 않는 회원입니다.")
		location.href="login_form.jsp"
		</script>
	<% 
	}
	%>
	
	


