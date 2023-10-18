package info;

import java.sql.*;
import java.util.ArrayList;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import animal.Animal;
import users.Users;

public class InfoDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public InfoDAO() {

		try {
			String dbURL = "jdbc:mysql://localhost:3306/anicef?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("db연결완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	//DB객체를 닫는 메서드
	private void closeAll() {
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 공지사항 최신 작성순으로 3개만 리턴
	public ArrayList<Info> getInfoList() {
		String SQL = "SELECT * from info "+ "order by info_id desc limit 3";
		ArrayList<Info> list = new ArrayList<Info>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt(1));
				info.setInfo_title(rs.getString(2));
				info.setInfo_text(rs.getString(3));
				info.setDate(rs.getString(4));
				info.setAdmin_id(rs.getString(5));
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}
	
	
	// addInfo 메서드
	public int addInfo(String info_title, String info_text, String admin_id) {
		String SQL = "INSERT INTO info (info_title, info_text, admin_id) VALUES (?, ?, ?)";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, info_title);
            pstmt.setString(2, info_text);
            pstmt.setString(3, admin_id);
			return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			closeAll();
		}
		return -1;
	}
	
	
	//deletInfo 메서드
	public int delInfo(Integer info_id) {
		String SQL = "DELETE FROM info WHERE info_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, info_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return -1;
	}
	
	//수정메서드
	public int editInfo(String info_title, String info_text, String admin_id, int info_id) {
		String SQL = "UPDATE info SET info_title = ?, info_text = ?, admin_id = ? WHERE info_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, info_title);
            pstmt.setString(2, info_text);
            pstmt.setString(3, admin_id);
            pstmt.setInt(4, info_id);
            return pstmt.executeUpdate();
		} catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeAll();
	    }
	    
	    return -1;
	}
}
