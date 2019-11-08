package kr.co.park.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 클래스 선언 방법: HttpServlet클래스를 상속받습니다.
//URL Mapping: 페이지의 URL을 사용자정의로 지정하는 방식
@WebServlet("/hello")

public class ServletBasic extends HttpServlet{

	//기본 생성자 선언.
	public ServletBasic() {
		System.out.println("hello페이지 서블릿 객체 생성!");
	}
	
	//HttpServlet클래스에서 상속받은 메서드들을 오버라이딩 합니다.
	//init(), doGet(), doPost(), destroy() 등등...
	
	@Override
	public void init() throws ServletException {
		/*
			페이지 요청이 들어왔을때 처음 실행할 로직 작성.
			init() 메서드는 컨테이너(서버)에 의해 서블릿 객체가 생성될때 
			최초 1회 자동 호출됩니다.
			객체의 생성자와 비슷하나 역할.
		*/
		System.out.println("init 메서드가 호출됨!");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Http Get 요청이 들어왔을때 호출되는 메서드.
		System.out.println("doGet 메서드 호출!");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Http Post 요청이 들어왔을때 호출되는 메서드.
		System.out.println("doPost 메서드 호출!");
	}
	
	@Override
	public void destroy() {
		//서블릿 객체가 소멸될 때 호출하는 메서드.(객체 소멸시 1회 호출)
		//대부분 객체 반납이나 소멸에 사용.
		System.out.println("destroy 메서드 호출!");
	}
	
}
