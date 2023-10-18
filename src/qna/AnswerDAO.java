package qna;

import java.sql.*;

public class AnswerDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public AnswerDAO() {

		try {
			String dbURL = "jdbc:mysql://localhost:3306/anicef?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

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
	
	
	// addanswer 메서드
	public int addAnswer(String qna_id, String answer, String admin_id, String state) {
		String SQL = "INSERT INTO answer (qna_id, answer, admin_id, state) VALUES (?, ?, ?, ?)";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, qna_id);
            pstmt.setString(2, answer);
            pstmt.setString(3, admin_id);
            pstmt.setString(4, state);
			return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
		return -1;
	}
	
	// 답변이 존재한다면 ?
	public boolean AnswerExist(int qna_id) {
	    String SQL = "SELECT * FROM answer WHERE qna_id = ?";
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, qna_id);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            return true;
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    
	    return false;
	}

	
	// 수정 메서드
	public int updateAnswer(int answer_id, String answer, String admin_id) {
		//업데이트할때는 answer_id로 수정
	    String SQL = "UPDATE answer SET answer = ?, admin_id = ? WHERE answer_id = ?";
	    
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, answer);
	        pstmt.setString(2, admin_id);
	        pstmt.setInt(3, answer_id);
			return pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
	
	
}
