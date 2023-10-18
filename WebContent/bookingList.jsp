<%@page import="booking.Booking"%>
<%@page import="booking.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/footer.css" />
<title>예약 내역 페이지</title>
</head>
<body>
	<%
		String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	int pageNumber = 1; //페이지는 초기값 1
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

	<%@ include file="header.jsp"%>
	
	<main class="d-flex justify-content">

		<!-- 예약내역 화면 -->
		<div class="container">
			<div class="container mt-4">
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>동물이름</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>방문현황</th>
							</tr>
						</thead>
						<tbody>
							<%
								BookingDAO bookingDAO = new BookingDAO();
							ArrayList<Booking> list = bookingDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=list.get(i).getBooking_id()%></td>
								<td><%=list.get(i).getBooking_name()%></td>
								<td><%=list.get(i).getUser_id()%></td>
								<td><%=list.get(i).getBook_date()%></td>
								<td><%=list.get(i).getState()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<%
						if (pageNumber != 1) {
					%>
					<a href="bookingList.jsp?pageNumber=<%=pageNumber - 1%>"
						class="btn btn-success btn-arraw-left">이전</a>
					<%
						}
					if (bookingDAO.nextPage(pageNumber + 1)) {
					%>
					<a href="bookingList.jsp?pageNumber=<%=pageNumber + 1%>"
						class="btn btn-success btn-arraw-left">다음</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</main>
	<div class="d-flex justify-content-center">
		<a href="booking.jsp" class="btn btn-primary">예약하기</a>
	</div>
	<%@ include file="footer.jsp"%>
	<script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
