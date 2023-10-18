package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import animal.Animal;

public class ItemDAO {
	// DB연결 객체들 선언
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ItemDAO() {

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

	// 펫 용품 게시글들을 전체 리턴한다.
	public ArrayList<Item> getListItem() {
		String SQL = "SELECT * from item";
		ArrayList<Item> list = new ArrayList<Item>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setMain_image(rs.getString(5));
				list.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}

	
	
	
	// id로 게시글 불러오기
		public Item getItemDetail(int id) {
			String SQL = "select * from item where id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Item item = new Item();//임시객체
					item.setId(rs.getInt(1));
					item.setName(rs.getString(2));
					item.setPrice(rs.getInt(3));
					item.setStock(rs.getInt(4));
					item.setMain_image(rs.getString(5));
					item.setSub_image(rs.getString(6));
					item.setText(rs.getString(7));
					return item;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeAll();
			}
			return null;
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
