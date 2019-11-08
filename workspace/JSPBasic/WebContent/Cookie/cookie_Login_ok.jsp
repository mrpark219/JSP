<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	//post방식 인코딩(한글 처리).
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String check = request.getParameter("id_remember");
	
	if(id.equals("abc1234")&&pw.equals("aaa1111")) {
		Cookie idCookie = new Cookie("id_cookie", id);
		idCookie.setMaxAge(30);
		response.addCookie(idCookie); //pc에 쿠키 저장
		
		if(check != null) {
			Cookie idMemory = new Cookie("remember_id", id);
			idMemory.setMaxAge(15);
			response.addCookie(idMemory);
		}
		
		response.sendRedirect("cookie_login_welcome.jsp");
		
	}
	else {
		response.sendRedirect("cookie_login.jsp");
	}



%>