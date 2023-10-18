package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
	// DB연결 객체들 선언
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AdminDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/anicef?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("db연결완료");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 로그인 메소드 입력( id,password) 리턴(-1:유저없음 0:비밀번호 불일치 1:일반회원 -2: 데이터베이스오류 )
	public int login(String adminId, String adminPw) {
		// 유저Id의 유저가 있으면 password 가져옴
		String SQL = "SELECT admin_pw from admin where admin_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, adminId);
			rs = pstmt.executeQuery();// 실행결과가 rs에 저장됨.
			if (rs.next()) {// 만약 rs가 있다면
				// 일단 유저가 있고, password를 비교한다.
				if (rs.getString(1).equals(adminPw)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음(유저없음)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();// 사용한 DB객체들을 닫아줌
		}
		return -2; // 데이터베이스 오류 (SQL)
	}

	// closeAll 메소드(사용한 DB객체들을 닫아줌 )
	private void closeAll() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
