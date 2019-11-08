package kr.co.park.board.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class BoardDAO implements IBoardDAO {

	DataSource ds;
	
	//싱글톤 패턴
	//1. 생성자에 private 제한.
	private BoardDAO() {
		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//JSP에서 커넥션 풀의 정보를 구하는 방법.(설정파일이 InitialContext() 객체에 저장됨.)
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//2. 클래스 내부에서 자신 스스로의 객체를 단 1개만 생성함.
	private static BoardDAO boardDAO = new BoardDAO();
	
	//3. 외부에서 공개된 메서드를 통해 객체를 리턴.
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	//커넥션 객체를 생성하여 리턴해주는 유틸 메서드 선언.
//		private Connection getConnection() throws Exception {
//			
//			String url = "jdbc:mysql://localhost:3316/jsp_practice?serverTimezone=Asia/Seoul";
//			String uid = "jsp";
//			String upw = "jsp";
//			
//			return DriverManager.getConnection(url, uid, upw);
//		}
	
		Connection conn = null;
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
		
		/////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public boolean insert(Board article) {

		boolean flag = false;
		String sql = "INSERT INTO board "
				 + "(writer, title, content) "
				 + "VALUES "
				 + "(?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			else {
				flag = false;
			}
		}
		catch(Exception e) {
	 		e.printStackTrace();
	 	}
	 	finally{
	 		try{
	 			if(conn != null)
	 				conn.close();
	 			if(pstmt != null)
	 				conn.close();
	 		}
	 		catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 	}
		return flag;		
	}

	@Override
	public Board selectOne(Long boardId) {
		
		String sql = "SELECT * FROM board WHERE board_id=?";
		Board article = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, boardId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new Board(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getDate("created_at"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null)conn.close(); 
				if(pstmt != null)pstmt.close(); 
				if(rs != null)rs.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return article;
	}

	@Override
	public List<Board> selectALl() {
		
		String sql = "SELECT * FROM board ORDER BY board_id DESC";
		List<Board> articles = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Board board = new Board(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getDate("created_at"));
				
				articles.add(board);
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null)conn.close(); 
				if(pstmt != null)pstmt.close(); 
				if(rs != null)rs.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return articles;
	}

	@Override
	public boolean update(Board article) {
		
		String sql = "UPDATE board "
				+ "SET writer=?, title=?, content=? "
				+ "WHERE board_id=?";
		boolean flag = false;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setLong(4, article.getBoardID());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			else {
				flag = false;
			}
			
		}
		catch(Exception e) {
	 		e.printStackTrace();
	 	}
	 	finally {
	 		try{
	 			if(conn != null) conn.close(); 
	 			if(pstmt != null) pstmt.close();
	 		}
	 		catch (Exception e){
	 			e.printStackTrace();
	 		}
	 	}
		
		return flag;
	}

	@Override
	public boolean delete(Long BoardId) {
	
		String sql = "DELETE FROM board "
				 + "WHERE board_id=?";
		boolean flag = false;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, BoardId);
	 		
	 		if(pstmt.executeUpdate() == 1) {
	 			flag = true;
	 		}
	 		else {
	 			flag = false;
	 		}
	 		
	 	}
	 	catch(Exception e) {
	 		e.printStackTrace();
	 	}
	 	finally {
	 		try{
	 			if(conn != null) conn.close(); 
	 			if(pstmt != null) pstmt.close();
	 		}
	 		catch (Exception e){
	 			e.printStackTrace();
	 		}
	 	}
		
		return flag;
	}

	
	
}
