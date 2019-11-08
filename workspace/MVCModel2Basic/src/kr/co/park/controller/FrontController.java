package kr.co.park.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do") //확장자 패턴으로 변경하여 .do로 끝나는 모든 요청을 받게 해줍니다.
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("get 요청 발생!");
		
		String uri = request.getRequestURI();
		System.out.println("요청 uri: "+uri);
		String conPath = request.getContextPath();
		System.out.println("컨텍스트 경로: "+conPath);
		String com = uri.substring(conPath.length());
		System.out.println(com);
		
		
		if(uri.equals("/MVCModel2Basic/join.do")) {
			System.out.println("회원가입 요청이 들어옴!");
			System.out.println("회원가입 로직 작동!");
		}
		if(uri.equals("/MVCModel2Basic/login.do")) {
			System.out.println("로그인 요청이 들어옴!");
			System.out.println("로그인 로직 작동!");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
