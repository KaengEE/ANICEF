package booking;

import java.sql.*;
import java.util.ArrayList;

public class BookingDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BookingDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/anicef?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DB연결 닫기
	public void closeAll() {	
		try {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	

	}


	//현재 날짜를 DB에서 검색해 리턴
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return ""; //데이터베이스 오류
	}


	// 가능한 모든 글의 갯수 +1 리턴
	public int getNext() {
		String SQL = "SELECT COUNT(*) FROM booking WHERE bookingAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; //데이터베이스 오류
	}


	// 부킹테이블에 새 부킹을 입력 한다.
	public int join(String booking_name, String user_id, String book_date, String state, String book_time, String text) {


		String SQL = "INSERT INTO booking(booking_name, user_id, book_date, state, book_time, text) values(?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, booking_name);
			pstmt.setString(2, user_id);
			pstmt.setString(3, book_date);
			pstmt.setString(4, state);
			pstmt.setString(5, book_time);
			pstmt.setString(6, text);
			System.out.println(pstmt);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; //데이터베이스 오류
	}

	// 게시글들을 전체 리턴한다.
	public ArrayList<Booking> getList(int pageNumber){
		String SQL = "select * from booking where booking_id < ? and bookingAvailable = 1 ORDER BY booking_id DESC LIMIT 10";
		ArrayList<Booking> list = new ArrayList<Booking>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Booking booking = new Booking();
				booking.setBooking_id(rs.getInt(1));
				booking.setUser_id(rs.getString(2));
				booking.setLocal(rs.getString(3));
				booking.setBooking_name(rs.getString(4));
				booking.setBook_date(rs.getString(5));
				booking.setBook_time(rs.getString(6));
				booking.setText(rs.getString(7));
				booking.setState(rs.getString(8));
				
				list.add(booking);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 에러
		} 

		return list; //데이터베이스 오류
	}

	// 다음 페이지가 있는가?(현재 페이지 + 1) 나올 게시글이 있으면 참이다.
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from booking where booking_id < ? and bookingAvailable = 1";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true; //다음 페이지 있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return false; // 없음
	}

	// id로 게시글 불러오기
	public Booking getBbs(int booking_id) {
		String SQL = "select * from booking where booking_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, booking_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Booking booking = new Booking(); // 임시객체
				booking.setBooking_id(rs.getInt(1));
				booking.setBooking_name(rs.getString(2));
				booking.setUser_id(rs.getString(3));
				booking.setBook_date(rs.getString(4));
				booking.setState(rs.getString(5));
				return booking;
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}

		return null;
	}

	//id의 게시글을 업데이트 하기
	public int update(int booking_id, String booking_name, String user_id, String book_date, String state) {
		String SQL = "update booking set booking_name = ? , user_id =? , book_date = ?, state = ? where booking_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, booking_name);
			pstmt.setString(2, user_id);
			pstmt.setString(3, book_date);
			pstmt.setString(4, state);
			pstmt.setInt(5, booking_id);
			return pstmt.executeUpdate(); //1이 리턴될때 정상적 1줄 수정됨
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; //데이터베이스 오류
	}


	// 게시글 삭제(여기서는 사용가능을 0으로 하여 보이지 않게함)
	public int delete(int booking_id) {
		String SQL = "update booking set bookingAvailable = 0 where booking_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, booking_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; //데이터베이스 오류
	}

	//상태변경 메서드
	public int updateState(String state,int booking_id) {
		String SQL = "UPDATE booking SET state = ? WHERE booking_id = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, state);
			pstmt.setInt(2, booking_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return -1;
	}


}
