package info;

public class Info {
	private int info_id; //공지사항id
	private String info_title; //공지사항제목
	private String info_text; //공지사항내용
	private String date; //작성일자
	private String admin_id; //관리자아이디
	
	
	
	public int getInfo_id() {
		return info_id;
	}
	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getInfo_text() {
		return info_text;
	}
	public void setInfo_text(String info_text) {
		this.info_text = info_text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
}
