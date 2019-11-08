package kr.co.park.user.model;

import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

public class UserDAO {

	DataSource ds;
	
	//싱글톤 디자인 패턴.
	
	//1. 스스로의 객체를 생성.
	private static UserDAO dao = new UserDAO();
	
	//2. 외부에서 객체생성 할 수 없도록 생성자에 private 제한 붙이기.
	private UserDAO() {
		
		//커넥션풀 구하기.
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//3. 외부에서 객체 요구시 공개된 메서드를 통해 가지고 있던 DAO객체의 주소값 반환.
	public static UserDAO getInstance() {
		return dao;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//중복 ID가 있는지 확인하는 메서드.
	public boolean confirmId(String id) {
		boolean flag = false;
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) { //자동으로 close() 해줌 try() 괄호안에 생성한 객체들을
			
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; //아이디가 존재함.
			}
			else {
				flag = false; //아이디가 존재하지 않음.
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
		
		return flag;
	}
	
	//회원가입을 처리하는 메서드
	public boolean insertMember(UserVO vo) {
		boolean flag = false;
		String sql = "INSERT INTO user VALUES(?,?,?,?,?)";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			
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
		
		return flag;
	}
	
	//로그인 유효성을 검증하는 메서드.
	public int userCheck(String id, String pw) {
		int check = 0;
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) { //아이디가 존재함.
				String dbPw = rs.getString("user_pw"); //DB에 저장된 비밀번호 얻음.
				if(dbPw.equals(pw)) { //로그인 성공
					check = 1;
				}
				else { //비밀번호가 다를 경우.
					check = 0;
				}
			}
			else { //아이디가 존재하지 않음.
				check = -1;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
	
	//모든 회원정보를 얻오오는 메서드.
	public UserVO getMemberInfo(String id) {
		UserVO vo = null;
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		try(Connection conn =ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UserVO();
				vo.setId(rs.getString("user_id"));
				vo.setPw(rs.getString("user_pw"));
				vo.setName(rs.getString("user_name"));
				vo.setEmail(rs.getString("user_email"));
				vo.setAddress(rs.getString("user_address"));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	//비밀번호를 변경하는 메서드.
		public boolean changePassword(String id, String pw) {
			boolean flag = false;
			
			String sql = "UPDATE user SET user_pw=? WHERE user_id=?";

			try (Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)){
			
				pstmt.setString(1, pw);
				pstmt.setString(2, id);
				
				if(pstmt.executeUpdate() == 1) {
					flag = true;
				} else {
					flag = false;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
		
		//회원정보를 수정하는 메서드.
		
		public boolean updateUser(UserVO vo) {
			boolean flag = false;
			
			String sql = "UPDATE user SET user_name=?"
					 + ", user_email=?, user_address=? "
					 + "WHERE user_id=?";
			
			try (Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)){
				
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getAddress());
				pstmt.setString(4, vo.getId());
				
				if(pstmt.executeUpdate() == 1) {
					flag = true;
				} else {
					flag = false;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
		
		//회원 탈퇴 메서드.
		
		public boolean deleteUser(String id) {
			
			boolean flag = false;
			
			String sql = "DELETE FROM user WHERE user_id=?";
			
			try (Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)){
					
				pstmt.setString(1, id);
				
				if(pstmt.executeUpdate() == 1) {
					flag = true;
				} else {
					flag = false;
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return flag;

		}
	
}
