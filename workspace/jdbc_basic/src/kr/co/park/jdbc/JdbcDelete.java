package kr.co.park.jdbc;

import java.sql.*;
import java.util.Scanner;

public class JdbcDelete {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("삭제할 회원의 ID를 입력하세요.");
		System.out.print("> ");
		String id = sc.next();
		
		String url = "jdbc:mysql://localhost:3316/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM members WHERE id=?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			int resultNum = pstmt.executeUpdate();
			
			if(resultNum==1) {
				System.out.println("회원 ID:"+id+" 이(가) 정상 삭제되었습니다.");
			}
			else {
				System.out.println("삭제에 실패했습니다.");
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
