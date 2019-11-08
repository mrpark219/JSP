package kr.co.park.jdbc;

import java.sql.*;
import java.util.Scanner;

public class JdbcSelect2 {

	public static void main(String[] args) {
			
		/*
 			- 회원의 ID를 입력받아 해당 ID의 회원정보를 모두 출력하는
 			JDBC 프로그래밍 코드를 작성하세요.
		*/
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("조회할 회원의 ID를 입력하세요.");
		System.out.print("> ");
		String userId = sc.next();
		
		String url = "jdbc:mysql://localhost:3316/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM members WHERE id ='"+userId+"'";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.println("============회원 정보============");
				System.out.printf("#아이디: %s\n비밀번호: %s\n이름: %s\n이메일: %s\n", id, pw, name, email);
				System.out.println("=================================");
			}
			
			else {
				System.out.println("아이디가 "+userId+"인 회원이 없습니다.");
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
			try {
				conn.close(); stmt.close(); rs.close(); sc.close();
			}
			catch (Exception e) {				
				e.printStackTrace();
			}
		}
		

	}

}
