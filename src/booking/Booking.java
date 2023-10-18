package booking;

public class Booking {
	
	private int booking_id;
	private String user_id;
	private String local;
	private String booking_name;
	private String book_date;
	private String book_time;
	private String text;
	private String state;
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getBooking_name() {
		return booking_name;
	}
	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getBook_time() {
		return book_time;
	}
	public void setBook_time(String book_time) {
		this.book_time = book_time;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", user_id=" + user_id + ", local=" + local + ", booking_name="
				+ booking_name + ", book_date=" + book_date + ", book_time=" + book_time + ", text=" + text + ", state="
				+ state + "]";
	}
	

}
