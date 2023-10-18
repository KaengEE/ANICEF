<%@page import="users.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booking.BookingDAO"%>
<!-- form으로 부터 전달된 값을 booking객체의 프로퍼티(필드변수)에 설정 
	 input 태그의 name과 자바빈의 프로퍼티명과 동일한 것에 대응-->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="booking" class="booking.Booking" scope="page" />
<jsp:setProperty name="booking" property="*" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약</title>
</head>
<body>
	<%
		// 이미 세션에 로그인 정보가 있으면 다시 로그인할 필요가 없음 
	String user_id = null;
	if (session.getAttribute("userID") != null) {
		user_id = (String) session.getAttribute("userID");
	}

	if (user_id == null) {
		out.println("<script>");
		out.println("alert('로그인을 하세요')");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}

	/* 제목 또는 내용을 안적었을 경우 글쓰기 페이지로 돌아간다. */
	if (booking.getBook_date() == null) {
		out.println("<script>");
		out.println("alert('입력안된 내용이 있습니다.')");
		out.println("history.back()"); // 되돌아감
		out.println("</script>");
	} 

	String local = request.getParameter("local");
	
	String text = request.getParameter("text");
	
	String booking_name = request.getParameter("booking_name");
	
	String book_date = request.getParameter("book_date");
	
	String book_time = request.getParameter("book_time");
	
	BookingDAO bookingDAO = new BookingDAO();

	int result = bookingDAO.join(user_id, local, booking_name, book_date, book_time, text);
	if (result == 1) {
		out.println("<script>");
		out.println("location.href = 'bookingList.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('예약 실패 했습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	%>

</body>
</html>