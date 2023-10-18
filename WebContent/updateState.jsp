<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="booking.BookingDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%
    // 폼에서 전달된 데이터 가져오기
    String booking_id = request.getParameter("booking_id"); //숫자변환
    int bookingId = Integer.parseInt(booking_id);
	String state = request.getParameter("state");
	
    BookingDAO dao = new BookingDAO();
    int result = dao.updateState(state, bookingId);

	if(result == 1){
		out.print("success");
	}else{
		out.print("error");
    }
    
%> 