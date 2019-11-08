package kr.co.park.jdbc;

import java.sql.*;

public class JdbcSelect {

	public static void main(String[] args) {
		
		String url = "jdbc:mysql://localhost:3316/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";
		
		String sql = "SELECT * FROM members";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; //select문에서만 사용하는 객체.
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			/*
				- Select 쿼리문의 실행 결과 데이터가 한줄이라도 존재한다면
				rs.next()메서드는 true를 리턴하며, 해당 행을 지목합니다.
			*/
			
			System.out.println("--------------------------------------------");
			
			while(rs.next()) {
				
				/*
					 - select의 실행 결과의 컬럼값을 읽어오려면
					 getString(), getInt()등의 메러드를 사용합니다.
					 - 해당 메서드의 매개값으로는 읽어올 테이블의 컬럼명을 지정합니다.
				*/
				
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("# 아이디: %s, 비밀번호: %s, 이름: %s, 이메일: %s\n", id, pw, name, email);
				System.out.println("--------------------------------------------");
				
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				conn.close(); stmt.close(); rs.close();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
				
				
				
	}
	
}
