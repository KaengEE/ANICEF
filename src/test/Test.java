package test;

import java.util.ArrayList;

import admin.AdminDAO;
import booking.Booking;
import booking.BookingDAO;
import users.UsersDAO;

public class Test {
	public static void main(String[] args) {
		//UsersDAO dao = new UsersDAO(); 
		//AdminDAO admindao = new AdminDAO();
		BookingDAO bookingDAO = new BookingDAO();
		ArrayList<Booking> list = bookingDAO.getList(1);
		
		for(Booking b: list) {
			System.out.println(b);
		}
		
	}
}
