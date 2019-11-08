package kr.co.park.jdbc;

import java.sql.*;
import java.sql.DriverManager;
import java.util.Scanner;

public class JdbcInsert2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# 회원정보 입력을 시작합니다.");
		
		System.out.print("* 아이디: ");
		String id = sc.next();
		
		System.out.print("* 비밀번호: ");
		String pw = sc.next();
		
		System.out.print("* 이름: ");
		String name = sc.next();
		
		System.out.print("* 이메일: ");
		String email = sc.next();
		
		String url = "jdbc:mysql://localhost:3316/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO members VALUES (?,?,?,?)";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			
			/*
			 	PreparedStatement객체는 Connection이 제공하는 prepareStatement()
			 	메서드를 호출하고, 매개값에 sql을 전달합니다.
			*/
			pstmt = conn.prepareStatement(sql);
			
			/*
				- pstmt객체를 생성했다면 sql문의 ?의 값을 채워줍니다.
				- ?는 첫번째 물음표부터 1번의 인덱스 값을 가지며 순차적으로 인덱스가 1씩 증가합니다.
				- DB테이블의 컬럼데이터 타입에 따라 setString(), setInt() 등의 메서드를 사용하여 ?를 채웁니다.
			*/
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			/*
				- ?값을 모두 입력했다면 sql문의 종류에 따라
			  	executeUpdate, executeQuery()를 호출합니다.
			  	- stmt와는 다르게 매개값으로 sql을 전달하지 않습니다.
			*/
			
			int resultNum = pstmt.executeUpdate();
			
			if(resultNum == 1) {
				System.out.println("회원정보 입력 성공!");
			}
			else {
				System.out.println("회원정보 입력 실패!");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				conn.close(); pstmt.close(); sc.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

	}

}
