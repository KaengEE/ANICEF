package animal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;



public class AnimalDAO {
	// DB연결 객체들 선언
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AnimalDAO() {

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

	//강아지 게시글들을 전체 리턴한다.
	public ArrayList<Animal> getListDog() {
		String SQL = "SELECT * from animal WHERE species ='dog' ";
		ArrayList<Animal> list = new ArrayList<Animal>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Animal animal = new Animal();
				animal.setId(rs.getInt(1));
				animal.setName(rs.getString(3));
				animal.setLocal(rs.getString(9));
				animal.setMain_image(rs.getString(10));
				list.add(animal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}

	// 고양이 게시글들을 전체 리턴한다.
	public ArrayList<Animal> getListCat() {
		String SQL = "SELECT * from animal WHERE species ='cat' ";
		ArrayList<Animal> list = new ArrayList<Animal>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Animal animal = new Animal();
				animal.setId(rs.getInt(1));
				animal.setName(rs.getString(3));
				animal.setLocal(rs.getString(9));
				animal.setMain_image(rs.getString(10));
				list.add(animal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}



	
	// 그 외 게시글들을 전체 리턴한다.
	public ArrayList<Animal> getListOther() {
		String SQL = "SELECT * from animal WHERE species ='other' ";
		ArrayList<Animal> list = new ArrayList<Animal>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Animal animal = new Animal();
				animal.setId(rs.getInt(1));
				animal.setName(rs.getString(3));
				animal.setLocal(rs.getString(9));
				animal.setMain_image(rs.getString(10));
				list.add(animal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}

	
	// 보호중인 동물 전체 리턴 - 최근 들어온 순으로 조회
	public ArrayList<Animal> getListAll() {
		String SQL = "SELECT * from animal "+ "order by date desc limit 8";
		ArrayList<Animal> list = new ArrayList<Animal>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Animal animal = new Animal();
				animal.setId(rs.getInt(1));
				animal.setMain_image(rs.getString(10));
				list.add(animal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list; // 데이터베이스 오류
	}

	
	
	// id로 게시글 불러오기
	public Animal getAnimalDetail(int id) {
		String SQL = "select * from animal where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Animal animal = new Animal();//임시객체
				animal.setId(rs.getInt(1));
				animal.setSpecies(rs.getString(2));
				animal.setName(rs.getString(3));
				animal.setSex(rs.getString(4));
				animal.setAge(rs.getInt(5));
				animal.setDate(rs.getString(6));
				animal.setOx(rs.getString(7));
				animal.setHealth(rs.getString(8));
				animal.setLocal(rs.getString(9));
				animal.setMain_image(rs.getString(10));
				animal.setSub_image(rs.getString(11));
				animal.setText(rs.getString(12));
				return animal;
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
