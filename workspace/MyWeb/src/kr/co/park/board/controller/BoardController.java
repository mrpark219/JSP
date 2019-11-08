package kr.co.park.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.park.board.service.ContentServiceimpl;
import kr.co.park.board.service.DeleteServiceimple;
import kr.co.park.board.service.GetListServiceImpl;
import kr.co.park.board.service.ModifyServiceimpl;
import kr.co.park.board.service.RegisterServiceimpl;
import kr.co.park.board.service.SearchServiceimpl;
import kr.co.park.board.service.UpdateServiceimple;
import kr.co.park.board.service.iBoardService;

@WebServlet("*.board") //확장자 패턴.
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); //URI
		String conPath = request.getContextPath(); //contextPath
		String com = uri.substring(conPath.length());
		iBoardService sv = null;
		
		//리스트 목록 요청
		if(com.equals("/board/list.board")) {
			
			sv = new GetListServiceImpl();
			sv.execute(request, response);
			
			//request 객체를 다음 화면까지 운반하기 위한 forward 이동
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		}
		//글쓰기 화면 이동 요청
		else if(com.equals("/board/writer.board")) { 
			response.sendRedirect("board_write.jsp");
		}
		//글 등록
		else if(com.equals("/board/regist.board")) {
			
			sv = new RegisterServiceimpl();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		}
		//글 상세보기
		else if(com.equals("/board/content.board")) {
			
			sv = new ContentServiceimpl();
			sv.execute(request, response);
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
		}
		else if(com.equals("/board/modify.board")) {
			
			//ModifyServiceImpl() 생성.
			//게시글에 해당하는 정보를 가져오는 메서드 실행
			//service에서 reqeust 객체에 저장
			//화면이동(dp)해서 태그안에 값을 출력.
			sv = new ModifyServiceimpl();
			sv.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
			dp.forward(request, response);
			
		}
		else if(com.equals("/board/update.board")) {
			/*
				1. UpdateServiceImple()만들고 excute() 메서드 실행
				2. 서비스에서는 bId, title, context를 받아서 dao의 updateBoard() 메서드 실행
				3. updtaeBoard()는 update구문으로 데이터 수정
				4. 페이지 이동을 목록
				5. sql = UPDATE my_baord SET title=?, content=? WHERE board_id=?
			*/
			
			sv = new UpdateServiceimple();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		}
		//삭제요청
		else if(com.equals("/board/delete.board")) {
			sv = new DeleteServiceimple();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		}
		else if(com.equals("/board/search.board")) {
			//sql = SELECT * FROM my_board WHERE title LIKE ?
			
			sv = new SearchServiceimpl();
			sv.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		}
				
		
	}
}
