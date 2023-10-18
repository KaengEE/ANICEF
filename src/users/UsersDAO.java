package users;

import java.sql.*;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import item.Item;
import users.Users;


public class UsersDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public UsersDAO() {

		try {
			String dbURL = "jdbc:mysql://localhost:3306/anicef?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 로그인 메소드 입력( id,password) 리턴(-1:유저없음 0:비밀번호 불일치 1:일반회원 -2: 데이터베이스오류 )
	public int login(String id, String pw) {
		// 유저Id의 유저가 있으면 password 가져옴
		String SQL = "SELECT pw from users where id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();// 실행결과가 rs에 저장됨.
			if (rs.next()) {// 만약 rs가 있다면
				// 일단 유저가 있고, password를 비교한다.
				if (rs.getString(1).equals(pw)) {
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

	// 회원가입 메소드
	public int join(Users users) {
		String SQL = "insert into users values ( ?, ?, ?, ?, ?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, users.getId());
			pstmt.setString(2, users.getName());
			pstmt.setString(3, users.getDate());
			pstmt.setString(4, users.getPw());
			pstmt.setString(5, users.getPh());
			pstmt.setString(6, users.getAd());
			return pstmt.executeUpdate();// DB에 정성적으로 입력 후 1 리턴
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return -1; // 데이터베이스 오류
	}

	// 회원id 조회 후 정보 가져오는 메소드
	public Users getUser(String id) {
		String SQL = "select * from users where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Users users = new Users();// 임시객체
				users.setId(rs.getString(1));
				users.setName(rs.getString(2));
				users.setDate(rs.getString(3));
				users.setPw(rs.getString(4));
				users.setPh(rs.getString(5));
				users.setAd(rs.getString(6));
				return users;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

	// 회원 정보 업데이트 하기
	public int updateUser(String id, String name, String date, String pw, String ph, String ad) {
		String SQL = "UPDATE users SET name =? , date =? , pw =?, ph =?, ad =? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, date);
			pstmt.setString(3, pw);
			pstmt.setString(4, ph);
			pstmt.setString(5, ad);
			pstmt.setString(6, id);
			return pstmt.executeUpdate();// 1이 리턴될 때 정상정 1줄 수정됨.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	//deletUser 메서드
	public int delUser(String id) {
		String SQL = "DELETE FROM users WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return -1;
	}

}
